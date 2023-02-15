import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/teacher_controller/class_list_controller.dart';
import 'package:ecom_desgin/model/Teacher_model/exam_result_model.dart';
import 'package:ecom_desgin/model/Teacher_model/student_list_model.dart';
import 'package:ecom_desgin/model/Teacher_model/teacher_class_timetable_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class StudentListController extends GetxController {

  List <dynamic> TeacherclassTimeTableControllerList = [].obs;
  Rxn<StudentListModel> studentListModel = Rxn<StudentListModel>();
  Rxn<ExamResultModel> examResultModel = Rxn<ExamResultModel>();
  RxList<String> studentList = <String>[].obs;
  String studentId = "";


  RxBool loadingStudentList =false.obs;
  RxBool loadingStudentList1 =true.obs;
  Future<List<StudentListController>?> StudentListapi() async {

    // classListController.classSectionModel.value?.response.forEach((element) {
    //   if (element.sectionName.toString() == selectdata1) {
    //     sectionId = element.sectionId;
    //     print(sectionId);
    //   }
    // });
    var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({"company_key":company_key,"class_id":"1","section_id":"1"});
    print("4rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getStudentListByClassSectionUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      TeacherclassTimeTableControllerList=[];
      studentListModel.value=StudentListModel.fromJson(sdata);

      print(studentListModel.value?.response[0].admissionNo);
      TeacherclassTimeTableControllerList.add(sdata) ;
      loadingStudentList.value=true;

      if (sdata["status"] == true ) {
        studentListModel.value?.response.forEach((element) {
          studentList.add(element.studentName.toString());
        });
        print("massage");
      }
      else  {
        print("invalid cccid");
      } }
    else {

      print("School ID Invailid");
    }
  }
  ////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
  List <dynamic> GetexamsResultControllerList = [].obs;

  void GetexamsResultapi(selectdata,exam_id) async {
       loadingStudentList1.value =false;
    studentListModel.value?.response.forEach((element) {
      if (element.studentName.toString() == selectdata) {
        studentId = element.studentId;
        print(studentId);
      }
    });
    var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "company_key":company_key,
      "id": studentId,
      "exam_id":exam_id
    });
    print("4ffffffffffffffffffffoooooooooooooooooo444444444444444444ffffffffffffff");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getexamsResultUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      GetexamsResultControllerList=[];
      GetexamsResultControllerList.add(sdata) ;
      examResultModel.value=ExamResultModel.fromJson(sdata);
      print(examResultModel.value?.response.examResult[0].subjectId);
      print("exammmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmddddddddddddd");
      print(GetexamsResultControllerList);
      print(GetexamsResultControllerList[0]["response"]["examResult"][0]["subject_name"]);
      // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {

        loadingStudentList.value=true;
        loadingStudentList1.value =true;
        print("massage");
      }
      else  {
        print("invalid cccid");
      } }
    else {

      print("School ID Invailid");
    }
  }
}