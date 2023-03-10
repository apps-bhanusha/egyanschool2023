import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/studentLeaveRecord_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class AddStudentLeaveRecordController extends GetxController {
  StudentLeaveRecordController StudentLeaveRecord=Get.put(StudentLeaveRecordController());
  List <dynamic> AddStudentLeaveRecordControllerList = [].obs;
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

  RxBool loadingAddStudentLeaveRecord1 =false.obs;
Future<String> AddStudentLeaveRecordapi(companyKey,studentId,fromDate,toDate,message,userfile) async {
    var headers = {
      'Cookie': 'ci_session=8e6de003d84c4a149a3c80a6be1fff63b6c73cfa'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://e-gyan.co.in/api/leavewebservices/addstudentLeaveRecord'));
    request.fields.addAll({
      'company_key': companyKey,
      'student_id': '${studentProfileController.studentProfileModel.value?.response.studentId}',
      'from_date': fromDate,
      'to_date': toDate,
      'message': message,

    });
   if(userfile!=null){
     request.files.add(await http.MultipartFile.fromPath('userfile', userfile));
   }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      studentcall(companyKey);

   var sdata= await response.stream.bytesToString();
   var alldata =jsonDecode(sdata);
      // print(await response.stream.bytesToString());
        if(alldata["status"]==true){
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
      return "ok";
        }
  
      return "";
    }
    else {
      return "";
    }

  }
  void studentcall(companyKey){
    var box = Hive.box("schoolData");
    var  id = box.get("student_id");
    companyKey = box.get("company_key");
    StudentLeaveRecord.StudentLeaveRecordapi(companyKey,'${studentProfileController.studentProfileModel.value?.response.studentId}');

      loadingAddStudentLeaveRecord1.value=true;




  }


}