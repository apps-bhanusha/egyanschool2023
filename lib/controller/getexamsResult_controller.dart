import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class GetexamsResultController extends GetxController {

  List <dynamic> GetexamsResultControllerList = [].obs;



  RxBool loadingGetexamsResult =false.obs;
  Future<List<GetexamsResultController>?> GetexamsResultapi( company_key,id,exam_id) async {

    var body = json.encode({
      "company_key":company_key,
      "id": id,
      "exam_id":exam_id
    });

    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getexamsResultUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      GetexamsResultControllerList=[];
      GetexamsResultControllerList.add(sdata) ;
      // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {
        loadingGetexamsResult.value=true;
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