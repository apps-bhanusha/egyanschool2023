import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_list_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_Controller/student_leave_controller.dart';
import 'package:ecom_desgin/view/teacher_main/S_leave/add_leave.dart';
import 'package:flutter/material.dart';

import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
class StudentLeave extends StatefulWidget {
  const StudentLeave({super.key});

  @override
  State<StudentLeave> createState() => _StudentLeaveState();
}

class _StudentLeaveState extends State<StudentLeave> {
   final ClassListController classListController = Get.put(ClassListController());

  StudentLeaveController studentLeaveController=Get.put(StudentLeaveController());
String selectStudent="Select Student";

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) =>
         AlertDialog(
           content: StudentAddUserDialog(
             
           ),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
           ),
         ),

      );
    }


@override
  void initState() {
    super.initState();
    classListController.allstudentList();
 
  
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          backgroundColor:AgentColor.appbarbackgroundColor,
          title: Text('Leave ',style: MyGoogeFont.mydmSans),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showUserDialog,
          child: const Icon(Icons.add),  
        ),//StudentLeaveRecord.loadingStudentLeaveRecord.value?
        body: Column(
          children: [
                Center(
          child: Container(
      
       width: 0.95.sw,
       height: 0.1.sh,
       decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
           BoxShadow(
                 blurRadius: 5,
                  color: Colors.grey
                )
                 ]
       ),
          child: Column(
            children: [
              Container(
                height: 10,
                width: 0.95.sw,
                color:Colors.blue
              ),
              const SizedBox( height: 10,),
      
     Obx(() =>   DropdownButton(
      iconSize: 35,
        alignment: Alignment.center,
    hint:  classListController.islodingstudentlist.value ?SizedBox(width: 110,height:20, child: Text(selectStudent)):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
        items: classListController.studentListDrop.map((country){
        return DropdownMenuItem( 
            value: country, 
            child: Text(country),
        );
        }).toList(),
        onChanged: (dynamic country){
      selectStudent=country;
      setState(() {
         studentLeaveController.studentLeaveRecord(country);
         studentLeaveController.isloading2.value=false;
         studentLeaveController.isloading.value=false;
      });
        },
      )),
     
      
            ],
          ),
          ),
        ),
              const SizedBox( height: 3,),

             Container(
              height: 0.7.sh,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Obx(
                () => studentLeaveController.isloading.value==true?studentLeaveController.isloading2.value?
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                    // for (int i = 0; i <= 3; i++)
            
                    InkWell(
                    onTap:(){
            
                    },
                             child: Padding(
                               padding: const EdgeInsets.only(top: 8),
                               child: Card(
                                 elevation: 10,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(5.0),
                                 ),
                                 margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                               child: Container(
                                 width: 0.99.sw,
                                 height: 0.19.sh,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: const Color(0xffE3F2FB),
                                 ),
                                 child: Column(
                                            
                                   // ignore: prefer_const_literals_to_create_immutables
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(
                                           left: 10,top: 5
                                       ).r,
                                       child: Row(
                                         children: [
                                           Row(
                                             children: [
                                               Text(
                                                 "Apply Date:-",
                                                 style: GoogleFonts.dmSans(
                                                   fontStyle: FontStyle.normal,
                                                   fontSize: 12.sp,
                                                   fontWeight: FontWeight.bold,
                                                   color: Colors.black,
                                                 ),
                                               ),
                                               Obx(
                                                     () =>
                                                     Text(
                                                       studentLeaveController.loadingStudentLeaveRecord.value? studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["apply_date"]!=null?MyDateFormat.dateformatmethod1(studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["apply_date"]):"":"",
                                                   style: GoogleFonts.dmSans(
                                                     fontStyle: FontStyle.normal,
                                                     fontSize: 13.sp,
                                                     fontWeight: FontWeight.bold,
                                                     color: Colors.black,
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Spacer(),
                                           // Padding(
                                           //   padding:  EdgeInsets.only(right: 14,bottom: 15),
                                           //   child: Text(
                                           //     "Room No. 12",
                                           //
                                           //   ),
                                           // ),
                                         ],
                                       ),
                                     ),
                                     Positioned(
                                       top: 0.033.sh,
                                         
                                       child: Padding(
                                         padding: EdgeInsets.only(
                                           left: 5,
                                         ).r,
                                         child: Row(
                                           children: [
                                             // Image.asset("assets/images/teacher.png",width: 0.070.sw,),
                                             // SizedBox(
                                             //   width: 0.01.sw,
                                             // ),
                                             SizedBox(
                                                   width:0.25.sw,
                                               child: Padding(
                                                 padding: const EdgeInsets.only(left:5 ,top: 0).r,
                                                 child: Column(
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                         
                                                     Obx(
                                                     () =>
                                                    Text(
                                                      studentLeaveController.loadingStudentLeaveRecord.value?studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["leave_status"]!=null?studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["leave_status"]:"":"",
                                                         style: GoogleFonts.dmSans(
                                                           fontStyle: FontStyle.normal,
                                                           fontSize: 17.sp,
                                                           fontWeight: FontWeight.bold,
                                                           color: Colors.red,
                                                         ),
                                                       ),
                                                     ),
                                         
                                               SizedBox(height: 0.010.sh,),
                                                     SizedBox(
                                         
                                                       width: 0.25.sw,
                                                       child: Obx(
                                                             () =>
                                                             Text(
                                                               studentLeaveController.loadingStudentLeaveRecord.value?studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["approved_by_staff_name"]!=null?studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["approved_by_staff_name"]:"":"",
                                                               style: GoogleFonts.dmSans(
                                                                 fontStyle: FontStyle.normal,
                                                                 fontSize: 12.sp,
                                                                 fontWeight: FontWeight.normal,
                                                                 color: Colors.black,
                                                               ),
                                                             ),
                                                       ),
                                                     ),
                                         
                                                   ],
                                                 ),
                                               ),
                                             ),
                                             // const Icon(Icons.timelapse),
                                         
                                         
                                             Padding(
                                               padding:  EdgeInsets.only(left: 0.15.sw, right: 2,top: 2,bottom: 2).r,
                                               child: Container(
                                                 width: 0.52.sw,
                                                 height: 0.08.sh,
                                                 decoration: BoxDecoration(
                                                     color: Colors.grey[400],
                                                     borderRadius:
                                                     BorderRadius.circular(10)),
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                   children: [
                                                     Column(
                                                       crossAxisAlignment:
                                                       CrossAxisAlignment.center,
                                                       children: [
                                                     Text("Start Date",
                                                       style: GoogleFonts.dmSans(
                                                         fontStyle: FontStyle.normal,
                                                         fontSize: 15.sp,
                                                         fontWeight: FontWeight.bold,
                                                         color: Colors.black,
                                                       ),),
                                                         Container(
                                                           color: Colors.black,
                                                           width: 0.24.sw,
                                                           height: 0.001.sh,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.all(5.0),
                                                           child:
                                                           Obx(
                                                                 () =>
                                                                 Text(
                                                                   studentLeaveController.loadingStudentLeaveRecord.value?studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["from_date"]!=null?MyDateFormat.dateformatmethod1(studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["from_date"]):"":"",
                                                               style: GoogleFonts.dmSans(
                                                                 fontStyle: FontStyle.normal,
                                                                 fontSize: 13.sp,
                                                                 fontWeight: FontWeight.bold,
                                                                 color: Colors.black,
                                                               ),),
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                     Container(
                                                       width:0.002.sw,
                                                       height: 0.1.sh,
                                                       color: Colors.white,
                                                     ),
                                                     Column(
                                                       crossAxisAlignment:
                                                       CrossAxisAlignment.center,
                                                       children: [
                                                         Text("End Date",
                                                           style: GoogleFonts.dmSans(
                                                             fontStyle: FontStyle.normal,
                                                             fontSize: 15.sp,
                                                             fontWeight: FontWeight.bold,
                                                             color: Colors.black,
                                                           ),),
                                                         Container(
                                                           color: Colors.black,
                                                           width: 0.24.sw,
                                                           height: 0.001.sh,
                                                         ),
                                                         Padding(
                                                           padding: const EdgeInsets.all(5.0),
                                                           child:     Obx(
                                                                 () =>
                                                                 Text(
                                                                   studentLeaveController.loadingStudentLeaveRecord.value?studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["to_date"]!=null?MyDateFormat.dateformatmethod1(studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["to_date"]):"":"",
                                                               style: GoogleFonts.dmSans(
                                                                 fontStyle: FontStyle.normal,
                                                                 fontSize: 13.sp,
                                                                 fontWeight: FontWeight.bold,
                                                                 color: Colors.black,
                                                               ),),
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ),
                                   
                                           ],
                                         ),
                                       ),
                                     ),
                                     const SizedBox(height: 3,),
                                         
                                   
                                    Row(
                                     children:  [
                                       Text("Reason:-"),
                                     SizedBox(width: 20,),
                                         
                                       Text(studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["reason"].toString())
                                     ],
                                     ),
                                     const SizedBox(height: 9,),
                                                     studentLeaveController.StudentLeaveRecordControllerList[0]["response"][index]["leave_status"].toString().toLowerCase()=="Pending"?  
                                                     
                                   Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children:const [
                                    Icon(LineIcons.fileDownload,color: Colors.blue),
                                    Icon(LineIcons.thumbsUp,color: Colors.blue),
                                    Icon(LineIcons.thumbsDown,color: Colors.blue),
                                         
                                     ],):      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: const [
                                    Icon(LineIcons.fileDownload,color: Colors.grey,),
                                    Icon(LineIcons.thumbsUp,color: Colors.grey),
                                    Icon(LineIcons.thumbsDown,color: Colors.grey),
                                         
                                     ],)
                                   ],
                                 ),
                               ),
                               ),
                             ),
                    )
                      ],
                    );
            
                  },
                  itemCount: studentLeaveController.isloading2.value? studentLeaveController.StudentLeaveRecordControllerList[0]["response"].length:0,
                ): studentLeaveController.isloading2.value?const Center(child: Text(""),)
                :const Center(child: Text("No Record Found"),):const Center(child: CircularProgressIndicator(color: Colors.blue),)
                  ),
            ),
          ],
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
      );
  }
}