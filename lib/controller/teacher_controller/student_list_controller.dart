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


  RxBool loadingStudentList =true.obs;
  RxBool loadingStudentListdrop =false.obs;
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
    var body = json.encode({"company_key":company_key,"class_id":"0","section_id":"0"});
    print("4rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getStudentListByClassSectionUrl);
    var response = await http.post(urlapi, body: body);
    print(response.body);
    print("D<:D<:::::::::::::::::::::::::::::");
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      TeacherclassTimeTableControllerList=[];
      studentListModel.value=StudentListModel.fromJson(sdata);

      print(studentListModel.value?.response[0].admissionNo);
      TeacherclassTimeTableControllerList.add(sdata) ;
     

      if (sdata["status"] == true ) {
        studentList = <String>[].obs;
        studentListModel.value?.response.forEach((element) {
          studentList.add(element.studentName.toString());
        });
         loadingStudentListdrop.value=true;
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
 try {
      print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getexamsResultUrl);
    print("A");
    print(urlapi);
    var response = await http.post(urlapi, body: body);
    print("b");
print(response.body);
    if (response.statusCode == 200) {
    print("c");

      var  sdata = jsonDecode(response.body);
    print("D");

      GetexamsResultControllerList=[];
    print("D");

      GetexamsResultControllerList.add(sdata) ;
    print("D");

      examResultModel.value=ExamResultModel.fromJson(sdata);
    print("D");

      if (sdata["status"] == true ) {
    print("D");

       
        loadingStudentList1.value =true;
         loadingStudentList.value=true;
         if(examResultModel.value!.response.examResult.isEmpty){
           loadingStudentList.value=false;
           loadingStudentList1.value =true;
         }
        print("massage");
      }
      else  {
         loadingStudentList.value=false;
         loadingStudentList1.value =true;
        print("invalid cccid");
      } }
    else {
         loadingStudentList.value=false;
         loadingStudentList1.value =true;
      print("School ID Invailid");
    }
 } catch (e) {
     loadingStudentList.value=false;
         loadingStudentList1.value =true;
   print(e);
 }
  }
}