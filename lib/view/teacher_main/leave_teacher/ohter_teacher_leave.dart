import 'dart:async';

import 'package:ecom_desgin/Widgets/Leave_widget.dart';
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/addstudentLeaveRecord_controller.dart';
import 'package:ecom_desgin/controller/studentLeaveRecord_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/other_teacher_leave_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/staff_leave_type_controller.dart';
import 'package:ecom_desgin/view/leave/user_dialog.dart';
import 'package:ecom_desgin/view/teacher_main/leave_teacher/other_teacher_add_leave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class TeacherLeaveStatus extends StatefulWidget {
  const TeacherLeaveStatus({Key? key}) : super(key: key);

  @override
  _TeacherLeaveStatusState createState() => _TeacherLeaveStatusState();
}

class _TeacherLeaveStatusState extends State<TeacherLeaveStatus> {
  var company_key;
  var staff_id;
  var userfile;
  var id;
  // ignore: non_constant_identifier_names
  StaffLeaveRecordController staffLeaveRecord=Get.put(StaffLeaveRecordController());
  AddStudentLeaveRecordController AddStudentLeaveRecord =
  Get.put(AddStudentLeaveRecordController());
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());
  StaffLeaveTypeController staffLeaveTypeController =Get.put(StaffLeaveTypeController());
  int currentTab = 0;
  DateTime today = DateTime.now();

  DateFormat currentDate=DateFormat.yMd();

  get dateStr => "${today.day}-${today.month}-${today.year}";
  var box = Hive.box("schoolData");
  @override
  void initState() {
    String dateStr = "${today.day}-${today.month}-${today.year}";

    super.initState();
    staffLeaveTypeController.staffLeaveTypeapi();
    id = box.get("student_id");
    company_key = box.get("company_key");
    staff_id=box.get("staff_id");
    staffLeaveRecord.StaffLeaveRecordapi(company_key,staff_id);
  }

  @override
  Widget build(BuildContext context) {
    void addUserData() {

    }

    void showUserDialog() {
      showDialog(
        context: context,

        builder: (_) =>

            AlertDialog(

              content: TeacherAddUserDialog(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),

      );
    }

    return RefreshIndicator(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Staff Leave Status',style: MyGoogeFont.mydmSans),
     
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:
            showUserDialog,


          child: Icon(Icons.add),
        ),//StudentLeaveRecord.loadingStudentLeaveRecord.value?
        body: Obx(
                () => staffLeaveRecord.isloading.value==false?staffLeaveRecord.staffLeaveRecordList.value?.response.length!=null?ListView.builder(
                  
              itemBuilder: (ctx, index) {
                return LeaveWidget(applyDate: staffLeaveRecord.staffLeaveRecordList.value?.response[index]["date"],
                 leave_from: staffLeaveRecord.staffLeaveRecordList.value?.response[index]["leave_from"], 
                 leave_to: staffLeaveRecord.staffLeaveRecordList.value?.response[index]["leave_to"],
                  status: staffLeaveRecord.staffLeaveRecordList.value?.response[index]["status"], 
                  applied_by: staffLeaveRecord.staffLeaveRecordList.value?.response[index]["applied_by"]
                  );
                
                //  Container(
                //   height: 0.15.sh,
                //   decoration: const BoxDecoration(
                //     color: Colors.white,
                //   ),
                //   child: Column(
                //     children: [

                //       InkWell(
                //         onTap:(){

                //         },
                //         child: Card(
                //           elevation: 10,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(5.0),
                //           ),
                //           margin:const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                //           child: Container(
                //             width: 0.99.sw,
                //             height: 0.13.sh,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(10),
                //               color: const Color(0xffE3F2FB),
                //             ),
                //             child: Stack(

                //               // ignore: prefer_const_literals_to_create_immutables
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       left: 10,top: 5
                //                   ).r,
                //                   child: Row(
                //                     children: [
                //                       Row(
                //                         children: [
                //                           Text(
                //                             "Apply Date:-",
                //                             style: GoogleFonts.dmSans(
                //                               fontStyle: FontStyle.normal,
                //                               fontSize: 12.sp,
                //                               fontWeight: FontWeight.bold,
                //                               color: Colors.black,
                //                             ),
                //                           ),
                //                           Obx(
                //                                 () =>
                //                                 Text(
                //                                   '${MyDateFormat.dateformatmethod1(staffLeaveRecord.staffLeaveRecordList.value?.response[index]["date"])}',
                //                                   style: GoogleFonts.dmSans(
                //                                     fontStyle: FontStyle.normal,
                //                                     fontSize: 13.sp,
                //                                     fontWeight: FontWeight.bold,
                //                                     color: Colors.black,
                //                                   ),
                //                                 ),
                //                           ),
                //                         ],
                //                       ),
                //                       Spacer(),
                //                       // Padding(
                //                       //   padding:  EdgeInsets.only(right: 14,bottom: 15),
                //                       //   child: Text(
                //                       //     "Room No. 12",
                //                       //
                //                       //   ),
                //                       // ),
                //                     ],
                //                   ),
                //                 ),
                //                 Positioned(
                //                   top: 0.033.sh,

                //                   child: Padding(
                //                     padding: const EdgeInsets.only(
                //                       left: 5,
                //                     ).r,
                //                     child: Row(
                //                       children: [
                //                         // Image.asset("assets/images/teacher.png",width: 0.070.sw,),
                //                         // SizedBox(
                //                         //   width: 0.01.sw,
                //                         // ),
                //                         SizedBox(
                //                           width:0.25.sw,
                //                           child: Padding(
                //                             padding: const EdgeInsets.only(left:5 ,top: 0).r,
                //                             child: Column(
                //                               mainAxisAlignment: MainAxisAlignment.start,
                //                               crossAxisAlignment: CrossAxisAlignment.start,
                //                               children: [

                //                                 Obx(
                //                                       () =>
                //                                       Text(
                //                                         '${staffLeaveRecord.staffLeaveRecordList.value?.response[index]["status"].toString().capitalizeFirst}',
                //                                         style: GoogleFonts.dmSans(
                //                                           fontStyle: FontStyle.normal,
                //                                           fontSize: 17.sp,
                //                                           fontWeight: FontWeight.bold,
                //                                           color: Colors.red,
                //                                         ),
                //                                       ),
                //                                 ),

                //                                 SizedBox(height: 0.010.sh,),
                //                                 SizedBox(
                //                                   width: 0.25.sw,
                //                                   child: Obx(
                //                                         () =>
                //                                         Text(
                //                                           '${staffLeaveRecord.staffLeaveRecordList.value?.response[index]["applied_by"].toString().capitalizeFirst}',
                //                                           style: GoogleFonts.dmSans(
                //                                             fontStyle: FontStyle.normal,
                //                                             fontSize: 12.sp,
                //                                             fontWeight: FontWeight.normal,
                //                                             color: Colors.black,
                //                                           ),
                //                                         ),
                //                                   ),
                //                                 ),

                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                         // const Icon(Icons.timelapse),


                //                         Padding(
                //                           padding:  EdgeInsets.only(left: 0.15.sw, right: 2,top: 2,bottom: 2).r,
                //                           child: Container(
                //                             width: 0.52.sw,
                //                             height: 0.08.sh,
                //                             decoration: BoxDecoration(
                //                                 color: Colors.grey[400],
                //                                 borderRadius:
                //                                 BorderRadius.circular(10)),
                //                             child: Row(
                //                               mainAxisAlignment: MainAxisAlignment.center,
                //                               children: [
                //                                 Column(
                //                                   crossAxisAlignment:
                //                                   CrossAxisAlignment.center,
                //                                   children: [
                //                                     Text("Start Date",
                //                                       style: GoogleFonts.dmSans(
                //                                         fontStyle: FontStyle.normal,
                //                                         fontSize: 15.sp,
                //                                         fontWeight: FontWeight.bold,
                //                                         color: Colors.black,
                //                                       ),),
                //                                     Container(
                //                                       color: Colors.black,
                //                                       width: 0.24.sw,
                //                                       height: 0.001.sh,
                //                                     ),
                //                                     Padding(
                //                                       padding: const EdgeInsets.all(5.0),
                //                                       child:
                //                                       Obx(
                //                                             () =>
                //                                             Text(
                //                                               '${MyDateFormat.dateformatmethod1(staffLeaveRecord.staffLeaveRecordList.value?.response[index]["leave_from"])}',
                //                                               style: GoogleFonts.dmSans(
                //                                                 fontStyle: FontStyle.normal,
                //                                                 fontSize: 13.sp,
                //                                                 fontWeight: FontWeight.bold,
                //                                                 color: Colors.black,
                //                                               ),),
                //                                       ),
                //                                     ),
                //                                   ],
                //                                 ),
                //                                 Container(
                //                                   width:0.002.sw,
                //                                   height: 0.1.sh,
                //                                   color: Colors.white,
                //                                 ),
                //                                 Column(
                //                                   crossAxisAlignment:
                //                                   CrossAxisAlignment.center,
                //                                   children: [
                //                                     Text("End Date",
                //                                       style: GoogleFonts.dmSans(
                //                                         fontStyle: FontStyle.normal,
                //                                         fontSize: 15.sp,
                //                                         fontWeight: FontWeight.bold,
                //                                         color: Colors.black,
                //                                       ),),
                //                                     Container(
                //                                       color: Colors.black,
                //                                       width: 0.24.sw,
                //                                       height: 0.001.sh,
                //                                     ),
                //                                     Padding(
                //                                       padding: const EdgeInsets.all(5.0),
                //                                       child:     Obx(
                //                                             () =>
                //                                             Text(
                //                                               '${MyDateFormat.dateformatmethod1(staffLeaveRecord.staffLeaveRecordList.value?.response[index]["leave_to"])}',
                //                                               style: GoogleFonts.dmSans(
                //                                                 fontStyle: FontStyle.normal,
                //                                                 fontSize: 13.sp,
                //                                                 fontWeight: FontWeight.bold,
                //                                                 color: Colors.black,
                //                                               ),),
                //                                       ),
                //                                     ),
                //                                   ],
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ),

                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // );

              },
              itemCount: staffLeaveRecord.isloading.value==false? staffLeaveRecord.staffLeaveRecordList.value?.response.length:0,
            ):const Center(child: CircularProgressIndicator(color: Colors.blue),):const Center(child: Text("Record Not Found"),)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        // bottomNavigationBar: BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: 10,
        //   color: Colors.green,
        //   child: Container(
        //     height: 60,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //
        //
        //       ],
        //     ),
        //   ),
        // ),
      ),
      onRefresh: () async {
        AlwaysScrollableScrollPhysics();
        setState(() {

          staffLeaveRecord.StaffLeaveRecordapi(company_key,staff_id);
        });

      },
    );
  }
}
