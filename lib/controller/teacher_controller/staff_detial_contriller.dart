import 'dart:convert';

import 'package:ecom_desgin/model/Teacher_model/staff_detail_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';

class StaffDetailController extends GetxController{

  Rxn<StaffDetailModel> staffDetailModel = Rxn<StaffDetailModel>();

RxBool isloding =false.obs;

void staffDetail(id) async {
try {
   var box = Hive.box("schoolData");
    var company_key = box.get("company_key");

    var body = json.encode({
      "company_key":company_key,
      "staff_id":id});
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getstaffdetailUrl);
    var response = await http.post(urlapi, body: body);

    if (response.statusCode == 200) {
      var tdata = jsonDecode(response.body);
        staffDetailModel.value=StaffDetailModel.fromJson(tdata);
        print("tdataall");

      if (tdata["status"] == true) {
        isloding.value=true;

// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
      } else {

      } }else {
    }
} catch (e) {
  print(e);
  print("Something Error");
}
   
    }
  
}