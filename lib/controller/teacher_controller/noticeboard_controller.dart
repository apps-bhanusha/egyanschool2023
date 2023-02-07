import 'dart:convert';

import 'package:ecom_desgin/model/Teacher_model/notic_board_model.dart';
import 'package:ecom_desgin/model/Teacher_model/staff_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';

class NoticBoardController extends GetxController{

  Rxn<NoticBoardModel> noticBoardModel = Rxn<NoticBoardModel>();

  RxBool isloding =false.obs;

  void noticBoardapi(role_flag) async {
    try {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");

      var body = json.encode({
        "company_key":company_key,
        "role_flag":role_flag
      });
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.getnoticeUrl);
      var response = await http.post(urlapi, body: body);

      if (response.statusCode == 200) {
        var tdata = jsonDecode(response.body);
        noticBoardModel.value=NoticBoardModel.fromJson(tdata);

        if (tdata["status"] == true) {
          isloding.value=true;
          print("Noticboard Name");
          print(noticBoardModel.value?.response?[0].title);

        } else {

        } }else {
      }
    } catch (e) {
      print(e);
      print("Something Error");
    }

  }

}