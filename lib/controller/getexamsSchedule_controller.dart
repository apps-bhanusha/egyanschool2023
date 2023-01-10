import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class GetexamsScheduleController extends GetxController {

  List <dynamic> GetexamsScheduleControllerList = [].obs;



   RxBool loadingGetexamsSchedule =false.obs;
  Future<List<GetexamsScheduleController>?> GetexamsScheduleapi( company_key,exam_id) async {

    var body = json.encode({
      "company_key":company_key,
      "exam_id": exam_id
    });
    print("4ffffffffffffffffffffgggggggggggggggggggggggggggggggggggggggbbbbbbbbbbbbbbb");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getexamsScheduleUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      GetexamsScheduleControllerList=[];
      GetexamsScheduleControllerList.add(sdata) ;
      print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
      print(GetexamsScheduleControllerList);
      print(GetexamsScheduleControllerList[0]["response"]["examSchedule"][0]["subject_name"]);
      // print(GetschoolsettingControllerList[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {
        loadingGetexamsSchedule.value=true;
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