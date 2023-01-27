import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/fees_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/parent_login.dart';
import 'package:ecom_desgin/controller/school_id_controller.dart';
import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/model/parent_student_model.dart';
import 'package:ecom_desgin/model/student_login_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecom_desgin/view/dashboard/home.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


import 'package:http/http.dart' as http;

class StudentLoginUpdateController extends GetxController {

  final SchoolIdController all = Get.put(SchoolIdController());



  RxBool loadingstudentLoginData =false.obs;
  RxBool isloading=true.obs;

  ParentLoginController parentLoginController=Get.put(ParentLoginController());

  Rxn<StudentLoginModel> studentLoginModelList= Rxn<StudentLoginModel>();

  Future<List<StudentLoginUpdateController>?> apicallpost(username,password) async {
    var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "username":username,
      "company_key":company_key,
      "password":password,
    });
    print("465555555555555555555555555544444444");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.studentLoginUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;


      final userIsStored =
      await saveUser(jsonEncode(response.body));
      var sdata = jsonDecode(response.body);

      print(sdata);


      if (sdata["status"] == true) {
        studentLoginModelList.value = StudentLoginModel.fromJson(sdata);


        loadingstudentLoginData.value=true;

      }
      else  {

        print("invalid id");
      } }
    else {

      print("School ID Invailid");
    }
  }

  saveUser(String jsonEncode) {}
}

