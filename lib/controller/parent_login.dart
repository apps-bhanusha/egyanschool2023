import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/model/parent_student_model.dart';
import 'package:ecom_desgin/view/parent/parent_student_list_change.dart';
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

class ParentLoginController extends GetxController{
 var studentpro;
  final SchoolIdController all = Get.put(SchoolIdController());
  final FeeController _feesController = Get.put(FeeController());
  Rxn<ParentStudentListModel> parentStudentListModel= Rxn<ParentStudentListModel>();
  
  List  SchoolIdControllerList = [].obs;
  RxBool loadingdata =true.obs;
  RxBool parentLogin =  false.obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   
  }

// parentloginrecall(){
//  
// }

  void parentapi( username,password,context) async {
  var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "company_key":company_key,
      "username":username,
      "password":password,
    });
        box.put("username",username);
        box.put("password",password);
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.parentLoginUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
          await sessionManager.set("name", username);
          await sessionManager.set("parentlogin", "parentlogin");
          await sessionManager.set("passward", password);
      final userIsStored =
      await saveUser(jsonEncode(response.body));
      var pdata = jsonDecode(response.body);
      parentStudentListModel.value=ParentStudentListModel.fromJson(pdata);
       print("parent responce data ");
      print(parentStudentListModel.value?.response?[0]?.name);
      if (pdata["status"] == true) {
        var box = Hive.box("schoolData");
        var company_key = box.get("company_key");
      loadingdata.value=true;
      parentLogin.value=true;
           return Get.to(const ParentStudentList());
      }

      else  {
        ScaffoldMessenger.of (context).showSnackBar(SnackBar(content: Text(pdata["message"], style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
        ),
        ),
          backgroundColor: Colors.white,
        ),
        );
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




