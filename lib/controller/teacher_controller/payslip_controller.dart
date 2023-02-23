import 'dart:convert';

import 'package:ecom_desgin/model/Teacher_model/payslip_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';

class PaySlipController extends GetxController{

  Rxn<PaySlipModel> paySlipModel = Rxn<PaySlipModel>();

  RxBool isloding =false.obs;
  RxBool isSelectMonth =false.obs;

  void PaySlipapi(id,year,month) async {
    try {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");

      var body = json.encode({
        "company_key":company_key,
        "staff_id":id,
        "year":year,
        "month":month
      });
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.payslipUrl);
      var response = await http.post(urlapi, body: body);

      if (response.statusCode == 200) {
        paySlipModel = Rxn<PaySlipModel>();
        isloding.value=true;
        var tdata = jsonDecode(response.body);
        print("PPPPPPPPPPPPPP");
        print(tdata);
        paySlipModel.value=PaySlipModel.fromJson(tdata);
        
        if (tdata["status"] == true) {
          isloding.value=true;
         isSelectMonth.value =false;
          
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