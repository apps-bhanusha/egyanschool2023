import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class GetclassTimeTableController extends GetxController {

  List <dynamic> GetclassTimeTableControllerList = [].obs;

  RxBool loadingGetclassTimeTable =false.obs;
  Future<List<GetclassTimeTableController>?> GetclassTimeTableapi( company_key,id) async {

    var body = json.encode({
      "company_key":company_key,
      "id": id
    });
    print("4rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getclassTimeTableUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);
    
      GetclassTimeTableControllerList=[];
      GetclassTimeTableControllerList.add(sdata) ;
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmvvvvvvvvvvvvvvv");
      print(GetclassTimeTableControllerList);
       loadingGetclassTimeTable.value=true;
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