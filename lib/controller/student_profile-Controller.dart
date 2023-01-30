 import 'dart:convert';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/student_profile_model.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
class StudentProfileController extends GetxController{
  Rxn<StudentProfileModel> studentProfileModel= Rxn<StudentProfileModel>();
  RxBool isloading = false.obs;
       void studentProfileApi(studentId) async {
  var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "company_key":company_key,
      "student_id":studentId,
    });
    print(body);
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
  }

 } 