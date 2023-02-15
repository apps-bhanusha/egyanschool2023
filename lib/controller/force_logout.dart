
import 'dart:convert';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/view/login/School_id_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ForceLogout extends GetxController{

  RxBool forceistrue =false.obs;


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   
  }

// parentloginrecall(){
//  
// }

  void forceLogout(id,context) async {

  var box = Hive.box("schoolData");
  var roleflag = box.get("role_flag");
    var company_key = box.get("company_key");
    var body = json.encode({
     "company_key":company_key,
    "role_flag":roleflag,
    "id":id
      
    });
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.forcelogoutUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
        var pdata = jsonDecode(response.body); 
       if (pdata["status"] == true) {
          if(pdata["response"][0]["force_logout"].toString()=="1"){
             await SessionManager().remove("name");
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
           SimpleLogin()), (Route<dynamic> route) => false);
          }
       }
      } 
    else {

    }
  }
}




