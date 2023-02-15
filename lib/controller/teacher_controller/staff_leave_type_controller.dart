import 'dart:convert';

import 'package:ecom_desgin/model/Teacher_model/payslip_model.dart';
import 'package:ecom_desgin/model/Teacher_model/staff_detail_model.dart';
import 'package:ecom_desgin/model/Teacher_model/staff_leave_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';

class StaffLeaveTypeController extends GetxController{

  Rxn<StaffLeaveTypeModel> staffLeaveTypeModel = Rxn<StaffLeaveTypeModel>();

  RxBool isloding =false.obs;

  void staffLeaveTypeapi() async {
    try {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");

      var body = json.encode({
        "company_key":company_key,
      });
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.staffLeaveTypeUrl);
      var response = await http.post(urlapi, body: body);

      if (response.statusCode == 200) {
        var tdata = jsonDecode(response.body);
        staffLeaveTypeModel.value=StaffLeaveTypeModel.fromJson(tdata);

        if (tdata["status"] == true) {
          isloding.value=true;

// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {

        } }else {
      }
    } catch (e) {
      print("Something Error");
    }

  }

}