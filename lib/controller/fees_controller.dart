import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:http/http.dart' as http;

class FeeController extends GetxController {

  List <dynamic> FeeControllerList = [].obs;

  RxBool loadingfees =false.obs;
  Future<List<FeeController>?> Feesapi(id, company_key) async {
var box = Hive.box("schoolData");
    var body = json.encode({
      "company_key":company_key,
      "student_id": id
    });

    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.feeUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);
      FeeControllerList=[];
      FeeControllerList.add(sdata) ;
      if (sdata["status"] == true ) {
        loadingfees.value=true;
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