import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_list_controller.dart';
import 'package:ecom_desgin/model/student_profile_model.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:http/http.dart' as http;

class StudentFeesController extends GetxController {
  StudentListController studentListController=Get.put(StudentListController());
  Rxn<StudentProfileModel> studentProfileModel= Rxn<StudentProfileModel>();
  List <dynamic> FeeControllerList = [].obs;
  String studentId="";
  String studentId1="";
  RxBool loadingfees =false.obs;
  RxBool loadingfees123 =true.obs;
  RxBool isloading=true.obs;

  Future<List<StudentFeesController>?> StudentFeesapi(selectdata, company_key) async {
    studentListController.studentListModel.value?.response.forEach((element) {
      if (element.studentName.toString() == selectdata) {
        studentId = element.studentId;
        print(studentId);
      }
    });
    var box = Hive.box("schoolData");
    var body = json.encode({
      "company_key":company_key,
      "student_id": studentId
    });

    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.feeUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);
      FeeControllerList=[];
      FeeControllerList.add(sdata) ;
      if (sdata["status"] == true ) {
        loadingfees.value=true;
        print("massage");

      }
      else  {
        print("invalid cccid");
      } }
    else {

      print("School ID Invailid");
    }
  }
  void studentProfileupdatedApi(selectdata) async {
    studentListController.studentListModel.value?.response.forEach((element) {
      if (element.studentName.toString() == selectdata) {
        studentId1 = element.studentId;
        print(studentId);
      }
    });
    RxBool isloading=false.obs;
    var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "company_key":company_key,
      "student_id":studentId1,
    });
    print(body);
    try {
      final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.studentProfileUrl);

      var response = await http.post(urlapi, body: body);
      print(response.body);
      if (response.statusCode == 200) {
        var profileData = jsonDecode(response.body);
        print("student profile data");
        print(profileData);
        isloading.value=true;
        studentProfileModel.value= StudentProfileModel.fromJson(profileData);

        print("is loading value true");
        print(studentProfileModel.value);
      }
      else {

      }
    } catch (e) {
      print("some ERROR");
    }
  }
}