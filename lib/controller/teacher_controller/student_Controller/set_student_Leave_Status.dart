import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
class SetStudentLeavestatus  extends GetxController {
  
    Future<String?> setstatus(leave_id,status_ide) async {
    try {
       var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
      var staff_id = box.get("staff_id");
      var body = json.encode({
      "leave_id":leave_id,
      "status_id":status_ide,
      "staff_id":staff_id,
      "company_key":company_key
      }
);
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.setstudentLeaveStatusUrl);
      var response = await http.post(urlapi, body: body);
      print("student set status attendace responce");
            print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["status"] == true) {
                Get.snackbar(
        data["message"].toString(),
        "",
        duration: 2.seconds, // it could be any reasonable time, but I set it lo-o-ong
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
        } else {
         return "false";
        } }else {
      } 
    } catch (e) {
       print(e);
      print("Something Error");
    }
  }

}