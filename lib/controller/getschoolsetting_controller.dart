import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class GetSchoolSettingController extends GetxController {
  List <dynamic> GetSchoolSettingControllerList = [].obs;

 RxBool loadingimage =false.obs;
  Future<List<GetSchoolSettingController>?> GetSchoolSettingapi(id, ) async {

    var body = json.encode({
      "company_key":id,

    });
    print("465555555555555555555555555544444444");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getschoolsettingUrl);
    print("SETINGGGGGGGGGGGGGGG");
    var response = await http.post(urlapi, body: body);
    print(response.body);
    if (response.statusCode == 200) {
     var  sdata = jsonDecode(response.body);
      print("fddddddddddddddddddd33333333333344444433333333");
      print(sdata);
   GetSchoolSettingControllerList=[];
   GetSchoolSettingControllerList.add(sdata) ;
      print(GetSchoolSettingControllerList);
// print(GetSchoolSettingControllerList[0]["response"]["image"]);
// print(GetSchoolSettingControllerList[0]["response"]["name"]);
//      var box = Hive.box("schoolData");
//      box.put("schoolname", GetSchoolSettingControllerList[0]["response"]["name"],);
//      box.put("session", GetSchoolSettingControllerList[0]["response"]["session"],);
      if (sdata["status"] == true ) {
        loadingimage.value=true;
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