import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class TeacherTimeTableController extends GetxController {

  List <dynamic> TeacherTimeTableControllerList = [].obs;

  RxBool loadingTimeTable =false.obs;
  Future<List<TeacherTimeTableController>?> TeacherTimeTableapi(company_key,teacher_id) async {

    var body = json.encode({"company_key":company_key,"teacher_id":teacher_id});
    print("4rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getteacherTimeTableUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      TeacherTimeTableControllerList=[];
      TeacherTimeTableControllerList.add(sdata) ;
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmvvvvvvvvvvvvvvv");
      print(TeacherTimeTableControllerList);
      loadingTimeTable.value=true;
      // print(GetschoolsettingControllerList[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {

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