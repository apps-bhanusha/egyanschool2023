import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class GetSylabusStatusController extends GetxController {

  List <dynamic> GetSylabusStatusControllerList = [].obs;



  RxBool loadingGetSylabusStatus =false.obs;
  RxBool loadingTeacherSylabusStatus =false.obs;
  Future<List<GetSylabusStatusController>?> GetSylabusStatusapi(company_key,student_id) async {
try {
  
    var body = json.encode({
      "company_key":company_key,
      "student_id": student_id
    });
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getSylabusStatustUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      GetSylabusStatusControllerList=[];
      GetSylabusStatusControllerList.add(sdata) ;
  
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
} catch (e) {
  print(e);
}
  }

   Future<List<GetSylabusStatusController>?> classSectionSyllebus(company_key,studendId,setionsID) async {

    var body = json.encode({
      "company_key":company_key,
      "student_id": studendId,
      "section_id": setionsID
    });
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getSylabusStatustUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      GetSylabusStatusControllerList=[];
      GetSylabusStatusControllerList.add(sdata) ;
  
      // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {
        loadingTeacherSylabusStatus.value=true;
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