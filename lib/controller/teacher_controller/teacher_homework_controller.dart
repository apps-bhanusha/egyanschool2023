import 'dart:convert';
import 'dart:developer';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/Teacher_model/teacher_homework_evaluation_model.dart';
import 'package:ecom_desgin/model/Teacher_model/teacher_homework_model.dart';
import 'package:ecom_desgin/view/teacher_main/Teacher_home_work/teacher_homework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
class TeacherHomeWorkController extends GetxController {

  RxBool isloadingshomework = false.obs;
  RxBool isdownloadin = true.obs;
  RxBool isdownloadinIndex = true.obs;
  bool noMoreData = false;
  RxBool ishomeworkuploaddate = true.obs;

  RxBool isdownloadinevaluation = true.obs;
  RxList homeWorkControllerList = [].obs;
  RxBool buttonloading = false.obs;
  Rxn<TeacherHomeWorkModel> teacherHomeWorkModel = Rxn<TeacherHomeWorkModel>();
  Rxn<
      TeacherHomeWorkForEvaluationModel> teacherHomeWorkForEvaluationModel = Rxn<
      TeacherHomeWorkForEvaluationModel>();

  String homeworkId = "";

  void teacherhomeworkapi(teacherId) async {
    var box = Hive.box("schoolData");
    var company_key = box.get("company_key");

    var body = json.encode(
        {"company_key": company_key, "teacher_id": teacherId});
    print(body);
    final urlapi = Uri.parse(
        ApiUrl.baseUrl + ApiUrl.getteacherhomeworkUrl);
    var response = await http.post(urlapi, body: body);
    print(response);
    if (response.statusCode == 200) {
      var homeWorkData = jsonDecode(response.body);
      print(homeWorkData);
      homeWorkControllerList.add(homeWorkData["response"]);
      print(homeWorkControllerList);
      teacherHomeWorkModel.value = TeacherHomeWorkModel.fromJson(homeWorkData);
      if (homeWorkData["status"] == true) {
        isloadingshomework.value = true;
      } else {
        print("invalid id");
      }
    } else {
      print("errror");
    }
  }


  void homeworkevaluationapi() async {

    var box = Hive.box("schoolData");
    var teacherId = box.get("staff_id");
    var company_key = box.get("company_key");

    teacherHomeWorkModel.value?.response.forEach((element) {
      if (element.id.toString() == Get.arguments[0].toString()) {
        homeworkId = element.id;
        print(homeworkId);
      }
    });
    var body = json.encode({
      "company_key": company_key,
      "teacher_id": teacherId,
      "homework_id": homeworkId
    });
    print(body);
    final urlapi = Uri.parse(
        ApiUrl.baseUrl + ApiUrl.getteacherhomeworkforevaluationUrl);
    var response = await http.post(urlapi, body: body);

    if (response.statusCode == 200) {
      teacherHomeWorkForEvaluationModel = Rxn<
          TeacherHomeWorkForEvaluationModel>();
      var homeWorkData = jsonDecode(response.body);
      print(homeWorkData);

      if (homeWorkData["status"] == true) {

        teacherHomeWorkForEvaluationModel.value =  TeacherHomeWorkForEvaluationModel.fromJson(homeWorkData);
        isdownloadinevaluation.value = true;
      } else {
        print("invalid id"); isdownloadinevaluation.value = true;
      }
    } else {
      print("errror");
      isdownloadinevaluation.value = true;
    }
  }


  void addEvaluationApi(evaluationDate, evaluationStudentList,context) async {
    TeacherHomeWorkController teacherHomeWorkController=Get.put(TeacherHomeWorkController());
    var box = Hive.box("schoolData");
    var teacherId = box.get("staff_id");
    var company_key = box.get("company_key");

    var body = json.encode({
      "company_key": company_key.toString(),
      "teacher_id": teacherId.toString(),
      "homework_id": homeworkId.toString(),
      "evaluation_student_list": evaluationStudentList.toString(),
      "evaluation_date": evaluationDate.toString()
    });
    print("all");
    print(body);
    final urlapi = Uri.parse(
        ApiUrl.baseUrl + ApiUrl.addEvaluationUrl);
    var response = await http.post(urlapi, body: body);

    if (response.statusCode == 200) {
      var homeWorkData = jsonDecode(response.body);
      print(homeWorkData);
      print(homeWorkData["status"]);

      if (homeWorkData["status"] == true) {
        buttonloading.value=false;
        ishomeworkuploaddate.value = true;
        var box = Hive.box("schoolData");
        var id=box.get("staff_id");
        isloadingshomework.value = false;
        teacherHomeWorkController.teacherhomeworkapi(id);
        Get.snackbar(
          homeWorkData["message"].toString(),
          "",
          duration: 2.seconds,

          snackPosition: SnackPosition.BOTTOM,
          showProgressIndicator: true,

          isDismissible: true,
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,
          mainButton:
          TextButton(onPressed: Get.back, child: const Text("Close")),

        );
           if (homeWorkData["message"]==homeWorkData["message"]){
      Get.off(const TeacherHomeWorkDiplay());
    
           }
           
      } else {
        buttonloading.value=false;
        print("invalid id");
      }
    } else {
      buttonloading.value=false;
      print("errror");
    }
  }

  void isdownloadingmethods() {
    isdownloadin.value = false;
  }
}


