import 'package:ecom_desgin/controller/student_login_update_controller.dart';
import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/model/Teacher_model/teacher_login_model.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_home/teacher_home.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/fees_controller.dart';
import 'package:ecom_desgin/controller/school_id_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../view/teacher_main/teacher_home/teacher_home_T.dart';

class TeacherLoginController extends GetxController {
  var studentpro;
  final SchoolIdController all = Get.put(SchoolIdController());
  final StudentLoginUpdateController loginUpdateControllers =
      Get.put(StudentLoginUpdateController());
  final FeeController _feesController = Get.put(FeeController());
  Rxn<TeacherLoginModel> teacherListModel = Rxn<TeacherLoginModel>();
  RxBool loadingdata =false.obs;
  RxBool teachertLogin = false.obs;
  RxBool isloading = false.obs;
  RxBool activatestudentInfo=false.obs; 

  void teacherLoginApi(username, password, context) async {

    var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "username": username,
      "password": password,
      "company_key": company_key
    });

    print(body);
    box.put("username",username);
    box.put("password",password);

    final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.teacherloginUrl);
   try {
      var response = await http.post(urlapi, body: body);
    print(response.body);
    if (response.statusCode == 200) {

      var tdata = jsonDecode(response.body);
      if (tdata["status"] == true) {
        teacherListModel.value = TeacherLoginModel.fromJson(tdata);
      await sessionManager.set("name", username);
      await sessionManager.set("passward", password);
        var box = Hive.box("schoolData");
        box.put("role_flag","T");
        box.put("username",username);
        box.put("staff_id",teacherListModel.value?.response["id"]);
        box.put("year_start_date",tdata["company"]["year_start_date"]);
        box.put("year_end_date",tdata["company"]["year_end_date"]);
        box.put("distance",tdata["company"]["distance"]);
        await sessionManager.set("teacherlogin", "teacherlogin");
        loadingdata.value=true;
        teachertLogin.value = false;
        print("Login Name");
        print(teacherListModel.value?.response["user_type"]);
        if(teacherListModel.value?.response["user_type"].toString().toLowerCase()=="teacher"){
           activatestudentInfo.value=true; 
        box.put("activatestudentInfo","teacher");
        box.put("student_login","Staff_login");
        }else{
        box.put("activatestudentInfo","");
        activatestudentInfo.value=false; 
        }
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const TeacherHome()),(Route<dynamic> route) => false);
      } else {
        teachertLogin.value = true;
           ScaffoldMessenger.of (context).showSnackBar(SnackBar(content: Text(tdata["message"], style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
        ),
        ),
          backgroundColor: Colors.white,
        ),
        );
      } }else {
      teachertLogin.value = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Something Error",
          style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.white,
      ));
 teachertLogin.value = true;
    }
   } catch (e) {
    print("Server error");
     print(e);
   }
  }

  saveUser(String jsonEncode) {}
}
