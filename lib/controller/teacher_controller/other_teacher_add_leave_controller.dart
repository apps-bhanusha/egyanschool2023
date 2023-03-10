import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/studentLeaveRecord_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/other_teacher_leave_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class AddStaffLeaveRecordController extends GetxController {
  StaffLeaveRecordController staffLeaveRecord=Get.put(StaffLeaveRecordController());
  List <dynamic> AddStudentLeaveRecordControllerList = [].obs;
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

  RxBool loadingAddStaffLeaveRecord1 =false.obs;
  Future<String> AddStaffLeaveRecordapi(staffId,date,fromDate,toDate,reason,leaveTypeId,companyKey,userfile) async {

    print(userfile);

    var headers = {
      'Cookie': 'ci_session=8e6de003d84c4a149a3c80a6be1fff63b6c73cfa'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiUrl.baseUrl+ApiUrl.addstaffLeaveRecordUrl));
    request.fields.addAll({
      'staff_id': staffId,
      'date':date,
      'from_date': fromDate,
      'to_date': toDate,
      'reason': reason,
      "leave_type_id":leaveTypeId,
      'company_key': companyKey});

    if(userfile!=null){
      request.files.add(await http.MultipartFile.fromPath('userfile', userfile));
    }


    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    // print(response.stream.bytesToString());
    if (response.statusCode == 200) {
      staffcall(companyKey);
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
      return "true";
    }
    }
    else {
      return "";
    }
      return "";

  }
  void staffcall(companyKey){
    var box = Hive.box("schoolData");
    var  id = box.get("student_id");
    companyKey = box.get("company_key");
    var staffId=box.get("staff_id");
    staffLeaveRecord.StaffLeaveRecordapi(companyKey,staffId);

    loadingAddStaffLeaveRecord1.value=true;




  }


}