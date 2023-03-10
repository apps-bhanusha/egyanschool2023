import 'dart:async';

import 'package:ecom_desgin/Widgets/Leave_widget.dart';
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/addstudentLeaveRecord_controller.dart';
import 'package:ecom_desgin/controller/studentLeaveRecord_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/view/leave/user_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';


class LeaveStatus extends StatefulWidget {
  const LeaveStatus({Key? key}) : super(key: key);

  @override
  _LeaveStatusState createState() => _LeaveStatusState();
}

class _LeaveStatusState extends State<LeaveStatus> {
  var company_key;
  var userfile;
  var id;
  // ignore: non_constant_identifier_names
  StudentLeaveRecordController StudentLeaveRecord=Get.put(StudentLeaveRecordController());
  AddStudentLeaveRecordController AddStudentLeaveRecord =
  Get.put(AddStudentLeaveRecordController());
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

  int currentTab = 0;
  DateTime today = DateTime.now();

  DateFormat currentDate=DateFormat.yMd();


  get dateStr => "${today.day}-${today.month}-${today.year}";
  var box = Hive.box("schoolData");
@override
  void initState() {
  String dateStr = "${today.day}-${today.month}-${today.year}";
  print(dateStr);
    super.initState();

  id = box.get("student_id");
  company_key = box.get("company_key");
  StudentLeaveRecord.StudentLeaveRecordapi(company_key,studentProfileController.studentProfileModel.value?.response.studentId);
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
           content: AddUserDialog(
             
           ),
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
          title: Text('Leave Status',style: MyGoogeFont.mydmSans),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showUserDialog,
          child: Icon(Icons.add),  
        ),//StudentLeaveRecord.loadingStudentLeaveRecord.value?
        body: Obx(
          () => StudentLeaveRecord.isloading.value==false?StudentLeaveRecord.loadingStudentLeaveRecord.value?ListView.builder(
            itemBuilder: (ctx, index) {
              return LeaveWidget(applyDate: StudentLeaveRecord.loadingStudentLeaveRecord.value? StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["apply_date"] ?? "":"",
                 leave_from: StudentLeaveRecord.loadingStudentLeaveRecord.value?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["from_date"] ?? "":"", 
                 leave_to: StudentLeaveRecord.loadingStudentLeaveRecord.value?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["to_date"] ?? "":"",
                  status: StudentLeaveRecord.loadingStudentLeaveRecord.value?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["leave_status"] ?? "":"", 
                  applied_by: StudentLeaveRecord.loadingStudentLeaveRecord.value?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["approved_by_staff_name"] ?? "":""
                  );
              
        //        Container(
        //   height: 0.15.sh,
        //   decoration: const BoxDecoration(
        //     color: Colors.white,
        //   ),
        //   child: Column(
        //     children: [
        //   // for (int i = 0; i <= 3; i++)

        //   InkWell(
        //   onTap:(){

        //   },
        //       child: Card(
        //         elevation: 10,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(5.0),
        //         ),
        //         margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        //       child: Container(
        //         width: 0.99.sw,
        //         height: 0.13.sh,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: const Color(0xffE3F2FB),
        //         ),
        //         child: Stack(

        //           // ignore: prefer_const_literals_to_create_immutables
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.only(
        //                   left: 10,top: 5
        //               ).r,
        //               child: Row(
        //                 children: [
        //                   Row(
        //                     children: [
        //                       Text(
        //                         "Apply Date:-",
        //                         style: GoogleFonts.dmSans(
        //                           fontStyle: FontStyle.normal,
        //                           fontSize: 12.sp,
        //                           fontWeight: FontWeight.bold,
        //                           color: Colors.black,
        //                         ),
        //                       ),
        //                       Obx(
        //                             () =>
        //                             Text(
        //                               StudentLeaveRecord.loadingStudentLeaveRecord.value? StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["apply_date"]!=null?MyDateFormat.dateformatmethod1(StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["apply_date"]):"":"",
        //                           style: GoogleFonts.dmSans(
        //                             fontStyle: FontStyle.normal,
        //                             fontSize: 13.sp,
        //                             fontWeight: FontWeight.bold,
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   Spacer(),
        //                   // Padding(
        //                   //   padding:  EdgeInsets.only(right: 14,bottom: 15),
        //                   //   child: Text(
        //                   //     "Room No. 12",
        //                   //
        //                   //   ),
        //                   // ),
        //                 ],
        //               ),
        //             ),
        //             Positioned(
        //               top: 0.033.sh,

        //               child: Padding(
        //                 padding: EdgeInsets.only(
        //                   left: 5,
        //                 ).r,
        //                 child: Row(
        //                   children: [
        //                     // Image.asset("assets/images/teacher.png",width: 0.070.sw,),
        //                     // SizedBox(
        //                     //   width: 0.01.sw,
        //                     // ),
        //                     SizedBox(
        // width:0.25.sw,
        //                       child: Padding(
        //                         padding: const EdgeInsets.only(left:5 ,top: 0).r,
        //                         child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [

        //                             Obx(
        //                             () =>
        //                            Text(
        //                              StudentLeaveRecord.loadingStudentLeaveRecord.value?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["leave_status"]!=null?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["leave_status"]:"":"",
        //                                 style: GoogleFonts.dmSans(
        //                                   fontStyle: FontStyle.normal,
        //                                   fontSize: 17.sp,
        //                                   fontWeight: FontWeight.bold,
        //                                   color: Colors.red,
        //                                 ),
        //                               ),
        //                             ),

        // SizedBox(height: 0.010.sh,),
        //                             SizedBox(

        //                               width: 0.25.sw,
        //                               child: Obx(
        //                                     () =>
        //                                     Text(
        //                                       StudentLeaveRecord.loadingStudentLeaveRecord.value?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["approved_by_staff_name"]!=null?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["approved_by_staff_name"]:"":"",
        //                                       style: GoogleFonts.dmSans(
        //                                         fontStyle: FontStyle.normal,
        //                                         fontSize: 12.sp,
        //                                         fontWeight: FontWeight.normal,
        //                                         color: Colors.black,
        //                                       ),
        //                                     ),
        //                               ),
        //                             ),

        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                     // const Icon(Icons.timelapse),


        //                     Padding(
        //                       padding:  EdgeInsets.only(left: 0.15.sw, right: 2,top: 2,bottom: 2).r,
        //                       child: Container(
        //                         width: 0.52.sw,
        //                         height: 0.08.sh,
        //                         decoration: BoxDecoration(
        //                             color: Colors.grey[400],
        //                             borderRadius:
        //                             BorderRadius.circular(10)),
        //                         child: Row(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: [
        //                             Column(
        //                               crossAxisAlignment:
        //                               CrossAxisAlignment.center,
        //                               children: [
        //                             Text("Start Date",
        //                               style: GoogleFonts.dmSans(
        //                                 fontStyle: FontStyle.normal,
        //                                 fontSize: 15.sp,
        //                                 fontWeight: FontWeight.bold,
        //                                 color: Colors.black,
        //                               ),),
        //                                 Container(
        //                                   color: Colors.black,
        //                                   width: 0.24.sw,
        //                                   height: 0.001.sh,
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.all(5.0),
        //                                   child:
        //                                   Obx(
        //                                         () =>
        //                                         Text(
        //                                           StudentLeaveRecord.loadingStudentLeaveRecord.value?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["from_date"]!=null?MyDateFormat.dateformatmethod1(StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["from_date"]):"":"",
        //                                       style: GoogleFonts.dmSans(
        //                                         fontStyle: FontStyle.normal,
        //                                         fontSize: 13.sp,
        //                                         fontWeight: FontWeight.bold,
        //                                         color: Colors.black,
        //                                       ),),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                             Container(
        //                               width:0.002.sw,
        //                               height: 0.1.sh,
        //                               color: Colors.white,
        //                             ),
        //                             Column(
        //                               crossAxisAlignment:
        //                               CrossAxisAlignment.center,
        //                               children: [
        //                                 Text("End Date",
        //                                   style: GoogleFonts.dmSans(
        //                                     fontStyle: FontStyle.normal,
        //                                     fontSize: 15.sp,
        //                                     fontWeight: FontWeight.bold,
        //                                     color: Colors.black,
        //                                   ),),
        //                                 Container(
        //                                   color: Colors.black,
        //                                   width: 0.24.sw,
        //                                   height: 0.001.sh,
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.all(5.0),
        //                                   child:     Obx(
        //                                         () =>
        //                                         Text(
        //                                           StudentLeaveRecord.loadingStudentLeaveRecord.value?StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["to_date"]!=null?MyDateFormat.dateformatmethod1(StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"][index]["to_date"]):"":"",
        //                                       style: GoogleFonts.dmSans(
        //                                         fontStyle: FontStyle.normal,
        //                                         fontSize: 13.sp,
        //                                         fontWeight: FontWeight.bold,
        //                                         color: Colors.black,
        //                                       ),),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                     ),

        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       ),
        //   )
        //     ],
        //   ),
        // );

            },
            itemCount: StudentLeaveRecord.isloading.value==false? StudentLeaveRecord.StudentLeaveRecordControllerList[0]["response"].length:0,
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
          
          StudentLeaveRecord.StudentLeaveRecordapi(company_key,studentProfileController.studentProfileModel.value?.response.studentId);
        });
    
      },
    );
  }
}
