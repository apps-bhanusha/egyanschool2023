import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecom_desgin/view/dashboard/HomeScreen.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';


import 'package:http/http.dart' as http;

class UserNameController extends GetxController {
  List  SchoolIdControllerList = [].obs;

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
      // final userIsStored =
      // await saveUser(jsonEncode(response.body));
      var sdata = jsonDecode(response.body);
      print("fddddddddddddddddddd33333333333333333333");
      print(sdata);
  SchoolIdControllerList.add(sdata);
print(SchoolIdControllerList);

      if (sdata["status"] == true) {
      var box = Hive.box("schoolData");
      box.put("username",username);
      box.put("password",password);
           return Get.to(() => HomeScreen());
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
}

