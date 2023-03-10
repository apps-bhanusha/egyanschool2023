 import 'dart:convert';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/getexamsSchedule1_controller.dart';
import 'package:ecom_desgin/model/student_profile_model.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
class StudentProfileController extends GetxController{
  Rxn<StudentProfileModel> studentProfileModel= Rxn<StudentProfileModel>();
    GetexamsSchedule1Controller getexamview1=Get.put(GetexamsSchedule1Controller());
  RxBool isloading = false.obs;
  void studentProfileApi(studentId) async {
  var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "company_key":company_key,
      "student_id":studentId,
    });
   try {
      final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.studentProfileUrl);
   
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
        var profileData = jsonDecode(response.body);
        isloading.value=true;
       studentProfileModel.value= StudentProfileModel.fromJson(profileData);
        getexamview1.GetexamsSchedule1api( company_key, 0,studentProfileModel.value?.response.studentId);
  }
    else {
      
    }
   } catch (e) {
     print("some ERROR");
   }
  }

 } 