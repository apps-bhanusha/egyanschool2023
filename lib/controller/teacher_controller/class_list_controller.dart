import 'dart:convert';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/Teacher_model/class_section_timetable_model.dart';
import 'package:ecom_desgin/model/Teacher_model/class_subject_model.dart';
import 'package:ecom_desgin/model/Teacher_model/class_timetable_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ClassListController extends GetxController {
  Rxn<ClassListModel> classListModel = Rxn<ClassListModel>();
  Rxn<ClassSectionModel> classSectionModel = Rxn<ClassSectionModel>();
  Rxn<ClassSubjectModel> classSubjectModel = Rxn<ClassSubjectModel>();

  RxBool isloding = false.obs;
  RxBool isloding2 = true.obs;
  RxBool isloding3 = true.obs;

  RxList<String> classList = <String>[].obs;
  RxList<String> classSection = <String>[].obs;
  RxList<String> classSubject = <String>[].obs;

  String classId = "";
  String sectionId = "";
  String subjectId = "";

///////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
  void classListapi() async {
    try {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");

      var body = json.encode({
        "company_key": company_key,
      });
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.classlistUrl);
      var response = await http.post(urlapi, body: body);
      print("class list responce");
      print(response.body);
      if (response.statusCode == 200) {
        var tdata = jsonDecode(response.body);
        classListModel.value = ClassListModel.fromJson(tdata);

        if (tdata["status"] == true) {
          classList = <String>[].obs;
          print("Staff Name");

          print(classListModel.value?.response[0].id);

          classListModel.value?.response.forEach((element) {
            classList.add(element.name.toString());
          });

          isloding.value = true;

// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {}
      } else {}
    } catch (e) {
      print("Something Error");
    }
  }

/////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

  void classSectionapi(selectdata) async {
    isloding2.value = false;
    print(selectdata);
    classListModel.value?.response.forEach((element) {
      if (element.name.toString() == selectdata) {
        classId = element.id;
        print(classId);
      }
    });
    print("loop end");
    try {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");

      var body = json.encode({
        "company_key": company_key,
        "class_id": classId,
      });
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.classsectionUrl);
      var response = await http.post(urlapi, body: body);
      print("class list responce");
      print(response.body);
      if (response.statusCode == 200) {
        var tdata = jsonDecode(response.body);
        classSectionModel.value = ClassSectionModel.fromJson(tdata);

        if (tdata["status"] == true) {
          isloding.value = true;
          print("Staff Name");
          classSection = <String>[].obs;
          print(classListModel.value?.response[0].id);

          classSectionModel.value?.response.forEach((element) {
            classSection.add(element.sectionName.toString());
            sectionId = element.sectionId;
          });
          isloding2.value = true;

// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {}
      } else {}
    } catch (e) {
      print(e);
      print("Something Error");
    }
  }

///////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
  void classSubjectapi(selectdata1) async {
    isloding3.value = false;
    print(selectdata1);
    classSectionModel.value?.response.forEach((element) {
      if (element.sectionName.toString() == selectdata1) {
        sectionId = element.sectionId;
        print(sectionId);
      }
    });
    print("loop end");
    if (classId.isNotEmpty && sectionId.isNotEmpty) {
      try {
        var box = Hive.box("schoolData");
        var company_key = box.get("company_key");

        var body = json.encode({
          "company_key": company_key,
          "class_id": classId,
          "section_id": sectionId
        });
        print("setal body");

        print(body);
        final urlapi =
        Uri.parse(ApiUrl.baseUrl + ApiUrl.getSubjectByClassSectionUrl);
        var response = await http.post(urlapi, body: body);
        print("class list responce");
        print(response.body);
        if (response.statusCode == 200) {
          var tdata = jsonDecode(response.body);
          classSubjectModel.value = ClassSubjectModel.fromJson(tdata);

          if (tdata["status"] == true) {
            isloding.value = true;
            print("Staff Namessssssssssss");
            print(classSubjectModel.value);
            classSubject = <String>[].obs;

            classSubjectModel.value?.response.forEach((element) {
              classSubject.add(element.name.toString());
              subjectId = element.subjectId!;
            });

            isloding3.value = true;

// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
          } else {}
        } else {}
      } catch (e) {
        print(e);
        print("Something Error");
      }
    }
  }

///////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
  void HomeworkAddListapi(homework_date,submit_date,description,userfile,dropdata) async {
    classSubjectModel.value?.response.forEach((element) {
      print("dropdataffffffffffffff");
      print(dropdata);
      if (element.name.toString() == dropdata) {
        subjectId = element.name;
        print(subjectId);
      }
    });

    if (classId.isNotEmpty && sectionId.isNotEmpty && subjectId.isNotEmpty) {
        var box = Hive.box("schoolData");
        var company_key = box.get("company_key");
        var staff_id=box.get("staff_id");
        var headers = {
          'Cookie': 'ci_session=8e6de003d84c4a149a3c80a6be1fff63b6c73cfa'
        };
        var request = http.MultipartRequest(
            'POST', Uri.parse(ApiUrl.baseUrl + ApiUrl.homeworkAddUrl));
        request.fields.addAll({
          'company_key': company_key,
          'staff_id': staff_id,
          'class_id': '1',
          'section_id': '1',
          'subject_id': '2',
          'homework_date': homework_date,
          'submit_date': submit_date,
          'description': description
        });
        print("requesttttttttttttt");
        print(request.fields);
        if (userfile != null) {
          request.files
              .add(await http.MultipartFile.fromPath('userfile', userfile));
        }

        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          var sdata = await response.stream.bytesToString();
          print("dddddddalddddtaa");
          var alldata = jsonDecode(sdata);
          // print(await response.stream.bytesToString());
          Get.snackbar(
            alldata["message"].toString(),
            "",
            duration: 5.seconds,
            // it could be any reasonable time, but I set it lo-o-ong
            snackPosition: SnackPosition.BOTTOM,
            showProgressIndicator: true,

            isDismissible: true,
            backgroundColor: Colors.lightGreen,
            colorText: Colors.white,
            mainButton:
            TextButton(onPressed: Get.back, child: const Text("Close")),
          );
        } else {}
      }

  }
}