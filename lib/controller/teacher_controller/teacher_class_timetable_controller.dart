import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/teacher_controller/class_list_controller.dart';
import 'package:ecom_desgin/model/Teacher_model/teacher_class_timetable_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class TeacherclassTimeTableController extends GetxController {
  ClassListController classListController = Get.put(ClassListController());
  List <dynamic> TeacherclassTimeTableControllerList = [].obs;
  // Rxn<ClassTimeTableModel> classtimetableModel = Rxn<ClassTimeTableModel>();
  String classId = "";
  String sectionId = "";

  RxBool loadingclassTimeTable =true.obs;
  RxBool empty =false.obs;
  Future<List<TeacherclassTimeTableController>?> TeacherclassTimeTableapi(selectdata,selectdata1) async {
    loadingclassTimeTable.value=false;

  classListController.classListModel.value?.response.forEach((element) {
  if (element.name.toString() == selectdata) {
  classId = element.id;
  print(classId);
  }
  });
  classListController.classSectionModel.value?.response.forEach((element) {
    if (element.sectionName.toString() == selectdata1) {
      sectionId = element.sectionId;
      print(sectionId);
    }
  });
    var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({"company_key":company_key,"class_id":classId,"section_id":sectionId});
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.teacherclassTimeTableUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);
      TeacherclassTimeTableControllerList=[];
      TeacherclassTimeTableControllerList.add(sdata) ;
      if (sdata["status"] == true ) {
      loadingclassTimeTable.value=true;
       empty.value=false;
        print("massage");
      }else  {
         empty.value=true;
        print("invalid cccid");
      } }
    else {
      empty.value=false;
loadingclassTimeTable.value=true;
      print("School ID Invailid");
    }
  }
}