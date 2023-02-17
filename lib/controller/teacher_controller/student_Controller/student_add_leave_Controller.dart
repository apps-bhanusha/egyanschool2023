import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/studentLeaveRecord_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_list_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_Controller/student_leave_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class StudentAddLeaveController extends GetxController {
  StudentLeaveRecordController StudentLeaveRecord=Get.put(StudentLeaveRecordController());
  List <dynamic> AddStudentLeaveRecordControllerList = [].obs;
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());
   final ClassListController classListController = Get.put(ClassListController());
   final StudentLeaveController studentLeaveController = Get.put(StudentLeaveController());
String studentId="";
  RxBool loadingAddStudentLeaveRecord1 =false.obs;
  Future<List<StudentAddLeaveController>?> StudentAddStudentLeaveapi(company_key,from_date,to_date,message,userfile,staff_id,selectdrop) async {
   
    classListController.studentListModel.value?.response.forEach((element) {
                     if(element.studentName.toString().toLowerCase()==selectdrop.toString().toLowerCase()){
                    
                      studentId=element.studentId;
                  

                     }
                   });
    print("save leave........");
    print(staff_id);
    print(studentId);
    print(from_date);
    print(to_date);
    print(message);
    print(userfile);
    print(selectdrop);
    print("end");
   try {
      var headers = {
      'Cookie': 'ci_session=8e6de003d84c4a149a3c80a6be1fff63b6c73cfa'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://e-gyan.co.in/api/leavewebservices/addstudentLeaveRecord'));
    request.fields.addAll({
      'company_key': company_key.toString(),
      'student_id': studentId.toString(),
      'from_date': from_date.toString(),
      'to_date': to_date.toString(),
      'message': message.toString(),
      'staff_id': staff_id.toString(),

    });
   if(userfile!=null){
     request.files.add(await http.MultipartFile.fromPath('userfile', userfile));
   }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      studentcall(company_key);

   var sdata= await response.stream.bytesToString();
   print("DDDDDDDDDDDDDDDDDDDDD");
   print(sdata);
   print("DDDDDDDDDDDDDDDDDDDDD");

   var alldata =jsonDecode(sdata);
      // print(await response.stream.bytesToString());
      if(alldata["status"] == true){
        studentLeaveController.studentLeaveRecord(selectdrop);
 Get.snackbar(
          alldata["message"].toString(),
          "",
        duration: 5.seconds, // it could be any reasonable time, but I set it lo-o-ong
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true,

        isDismissible: true,
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
        mainButton: TextButton(
            onPressed: Get.back,
            child: const Text(
                "Close"

            )),
      );
      }else{
         Get.snackbar(
          "Save Error",
          "",
        duration: 5.seconds, // it could be any reasonable time, but I set it lo-o-ong
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true,

        isDismissible: true,
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
        mainButton: TextButton(
            onPressed: Get.back,
            child: const Text(
                "Close"

            )),
      );
      }
     
    }
    else {
    }
   } catch (e) {
     print(e);
   }

  }
  void studentcall(company_key){
    var box = Hive.box("schoolData");
    var  id = box.get("student_id");
    company_key = box.get("company_key");
    StudentLeaveRecord.StudentLeaveRecordapi(company_key,'${studentProfileController.studentProfileModel.value?.response.studentId}');

      loadingAddStudentLeaveRecord1.value=true;




  }


}