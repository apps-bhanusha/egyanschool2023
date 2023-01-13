import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/fees_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/school_id_controller.dart';
import 'package:ecom_desgin/model/parent_student_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecom_desgin/view/dashboard/home.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


import 'package:http/http.dart' as http;

class UserNameController extends GetxController {
  var studentpro;
  final SchoolIdController all = Get.put(SchoolIdController());
  final FeeController _feesController = Get.put(FeeController());
  List  SchoolIdControllerList = [].obs;
  RxBool loadingdata =false.obs;
  Rxn<ParentStudentListModel> parentStudentListModel= Rxn<ParentStudentListModel>();


  // Future<bool> saveUser(String user) async {
  //   final prefs = await SchoolIdControllerList.toString();
  //   return prefs.setString('', user);
  // }
  Future<List<UserNameController>?> apicallpost( username,password,context) async {

    var body = json.encode({
      "username":username,
      "company_key":"Od9EFRCPo8ach2Hk",
      "password":password,
    });
    print("465555555555555555555555555544444444");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.studentLoginUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      final userIsStored =
      await saveUser(jsonEncode(response.body));
      var sdata = jsonDecode(response.body);
      parentStudentListModel.value= ParentStudentListModel.fromJson(sdata);
      print("fddddddddddddddddddd33333333333333333333");
      print(sdata);
  SchoolIdControllerList.add(sdata);
print(SchoolIdControllerList);
print(SchoolIdControllerList[0]["response"][0]["student_id"]);

      if (sdata["status"] == true) {
        var box = Hive.box("schoolData");
        box.put("username",username);
        box.put("password",password);
        box.put("student_id",SchoolIdControllerList[0]["response"][0]["student_id"]);
        box.put("exam_view", SchoolIdControllerList[0]['parent_info']["exam_view"]);
        print("44444444444444444444444333333333311111111111333333333333333");
        box.put("studentprofileimage", SchoolIdControllerList[0]["response"][0]["profileimage"]);
        box.put("studentname", SchoolIdControllerList[0]["response"][0]["name"]);
        box.put("mobileno", SchoolIdControllerList[0]['parent_info']["mobileno"]);
        box.put("admission_no", SchoolIdControllerList[0]['parent_info']["admission_no"]);
        box.put("DOB", SchoolIdControllerList[0]['parent_info']["DOB"]);
        box.put("roll_no", SchoolIdControllerList[0]['parent_info']["roll_no"]);
        box.put("email", SchoolIdControllerList[0]['parent_info']["email"]);
        box.put("studentclass",SchoolIdControllerList[0]["response"][0]["class"]);
        box.put("studentsection",SchoolIdControllerList[0]["response"][0]["section"]);
        box.put("studenttotalfees", SchoolIdControllerList[0]["response"][0]["fee"]["total_amount"]);
        box.put("studentduefees",  SchoolIdControllerList[0]["response"][0]["fee"]["total_balance_amount"]);
        box.put("studentpresent", SchoolIdControllerList[0]["response"][0]["attandance"]["present"]);
        box.put("total_deposite_amount", SchoolIdControllerList[0]["response"][0]["fee"]["total_deposite_amount"]);

        print(SchoolIdControllerList[0]["response"][0]["name"]);
print("22211111111111111111111111111111111111");
print(SchoolIdControllerList[0]["response"][0]["fee"]["total_deposite_amount"]);
        var company_key = box.get("company_key");

        _feesController.Feesapi(SchoolIdControllerList[0]["response"][0]["student_id"],company_key);
        print("333333878777uuu");
print(SchoolIdControllerList[0]["response"][0]["profileimage"]);
    // ,all.SchoolIdControllerList2[0]["response"]["company_key"]
       // studentpro= box.get("studentprofileimage");
       //  print("33333387877555543447uuu");
       //  print(studentpro);
      loadingdata.value=true;
           return Get.offAll( const HomeScreen(),arguments: ['0',false]);
      }
      else  {
        ScaffoldMessenger.of (context).showSnackBar(SnackBar(content: Text(sdata["message"], style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
        ),
        ),
          backgroundColor: Colors.white,
        ),
        );
        print("invalid id");
      } }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank Field Not Allowed",style: GoogleFonts.dmSans(fontStyle: FontStyle.normal,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),),
        backgroundColor:Colors.white,
      )
      );
      print("School ID Invailid");
    }
  }

  saveUser(String jsonEncode) {}
}

