import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class FeeController extends GetxController {

  List <dynamic> FeeControllerList = [].obs;

  RxBool loadingfees =false.obs;
  Future<List<FeeController>?> Feesapi(id, company_key) async {

    var body = json.encode({
      "company_key":company_key,
      "student_id": id
    });
    print("46555555555555555555555554444444444444444444fgggggggggg55544444444");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.feeUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      FeeControllerList=[];
      FeeControllerList.add(sdata) ;
      print("555555555555555555555jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      print(FeeControllerList);
      print(FeeControllerList[0]["response"]["total_amount"]);
      print(FeeControllerList[0]["response"]["total_discount_amount"]);
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