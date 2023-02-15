 import 'dart:convert';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/About.dart';
import 'package:ecom_desgin/model/student_profile_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
class AboutController extends GetxController{
  Rxn<AboutModel> aboutModel= Rxn<AboutModel>();
  RxBool isloading = false.obs;



  void aboutSchool() async {
  var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "company_key":company_key,
    });
   try {
      final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.aboutusSchools);
   
    var response = await http.post(urlapi, body: body);
    print("responce about school");
    if (response.statusCode == 200) {
      aboutModel= Rxn<AboutModel>();
        var profileData = jsonDecode(response.body);
        isloading.value=true;
       aboutModel.value= AboutModel.fromJson(profileData);
  }
    else {
      
    }
   } catch (e) {
     print("some ERROR");
   }
  }

  void aboutEgyan() async {
  var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "company_key":company_key,
    });
   try {
      final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.aboutusEgyan);
   
    var response = await http.post(urlapi, body: body);
    print("responce about school");
    if (response.statusCode == 200) {
        var profileData = jsonDecode(response.body);
        print(profileData);
        isloading.value=true;
       aboutModel.value= AboutModel.fromJson(profileData);
  }
    else {
      
    }
   } catch (e) {
     print("some ERROR");
   }
  }

 } 