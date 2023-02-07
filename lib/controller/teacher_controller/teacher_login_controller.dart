import 'package:ecom_desgin/controller/student_login_update_controller.dart';
import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/model/Teacher_model/teacher_login_model.dart';
import 'package:ecom_desgin/model/parent_student_model.dart';
import 'package:ecom_desgin/model/student_login_model.dart';

import 'package:ecom_desgin/view/parent/parent_student_list_change.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_home/teacher_home.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/fees_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/school_id_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecom_desgin/view/dashboard/home.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class TeacherLoginController extends GetxController {
  var studentpro;
  final SchoolIdController all = Get.put(SchoolIdController());
  final StudentLoginUpdateController loginUpdateControllers =
      Get.put(StudentLoginUpdateController());
  final FeeController _feesController = Get.put(FeeController());
  Rxn<TeacherLoginModel> teacherListModel = Rxn<TeacherLoginModel>();
  RxBool loadingdata =false.obs;
  RxBool teachertLogin = true.obs;


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
    var response = await http.post(urlapi, body: body);

    if (response.statusCode == 200) {
      await sessionManager.set("name", username);

      await sessionManager.set("passward", password);
      final userIsStored = await saveUser(jsonEncode(response.body));
      teacherListModel = Rxn<TeacherLoginModel>();

      var tdata = jsonDecode(response.body);

      print(tdata);
      print(tdata["response"]["id"]);
      if (tdata["status"] == true) {

        print("bugss all trues");
print(tdata["company"]["year_end_date"]);
print(tdata["response"]["id"]);
        var box = Hive.box("schoolData");
        box.put("role_flag","T");
        box.put("username",username);
        box.put("staff_id",tdata["response"]["id"]);
        box.put("year_start_date",tdata["company"]["year_start_date"]);
        box.put("year_end_date",tdata["company"]["year_end_date"]);
        await sessionManager.set("teacherlogin", "teacherlogin");
        print(tdata);
        teacherListModel.value = TeacherLoginModel.fromJson(tdata);
        loadingdata.value=true;
        teachertLogin.value = true;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => TeacherHome()),
            (Route<dynamic> route) => false);
      } else {
        teachertLogin.value = true;
        print("bugs all");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              tdata["message"],
              style: GoogleFonts.dmSans(
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
      print("bugs all clear");
      teachertLogin.value = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Blank Field Not Allowed",
          style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.white,
      ));
      print("School ID Invailid"); teachertLogin.value = true;
    }
  }

  saveUser(String jsonEncode) {}
}
