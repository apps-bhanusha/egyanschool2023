import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class GetSylabusStatusController extends GetxController {

  List <dynamic> GetSylabusStatusControllerList = [].obs;



  RxBool loadingGetSylabusStatus =false.obs;
  Future<List<GetSylabusStatusController>?> GetSylabusStatusapi(company_key,student_id) async {

    var body = json.encode({
      "company_key":company_key,
      "student_id": student_id
    });
    print("fdddddddddddddddddddddddddddddddddddgetsylaubus");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getSylabusStatustUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      GetSylabusStatusControllerList=[];
      GetSylabusStatusControllerList.add(sdata) ;
      print("getSyladsssddddddddddddddddddddddddddddsdbus");
      print(GetSylabusStatusControllerList);
      print(GetSylabusStatusControllerList[0]["response"]["subjects_data"][0]["lebel"]);
      // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {
        loadingGetSylabusStatus.value=true;
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