import 'dart:async';
import 'dart:convert';

import 'package:ecom_desgin/model/Teacher_model/class_section_timetable_model.dart';
import 'package:ecom_desgin/model/Teacher_model/class_subject_model.dart';
import 'package:ecom_desgin/model/Teacher_model/class_timetable_model.dart';
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

class ClassSudfvlmfdbjectController extends GetxController{

  Rxn<ClassSubjectModel>classSubjectModel = Rxn<ClassSubjectModel>();

  RxBool isloding =false.obs;
  static RxList  allsubject = [].obs;

  void classubjectapi(class_id,section_id) async {
    try {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");

      var body = json.encode({
        "company_key":company_key,
        "class_id":class_id,
        "section_id":section_id
      });
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.getSubjectByClassSectionUrl);
      var response = await http.post(urlapi, body: body);

      if (response.statusCode == 200) {
        var tdata = jsonDecode(response.body);


        if (tdata["status"] == true) {
          classSubjectModel.value=ClassSubjectModel.fromJson(tdata);
          isloding.value=true;
          print("Staff Name");
          addclasssubject();
          print(classSubjectModel.value?.response?[0].name);

// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {

        } }else {
      }
    } catch (e) {
      print(e);
      print("Something Error");
    }

  }

  void addclasssubject() {
    allsubject.value = [];

    classSubjectModel.value?.response.forEach((
        element) {
      var Name = '${element.name}';
      print("sectionname------------------------ddddssd");
      print(Name);
      final timer = Timer(
        const Duration(seconds: 3),
            () {
              allsubject.add(Name);
        },

      );

    });
  }

}