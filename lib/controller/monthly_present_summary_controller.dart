import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/monthly_summry_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
class MonthlyPresentSummaryController extends GetxController {

  List <dynamic> MonthlyPresentSummaryControllerList = [].obs;
  Rxn<MonthlyPresentSummary > monthlyPresentSummaryModel =Rxn<MonthlyPresentSummary >();
  RxBool loadingMonthlyPresentSummary =false.obs;
  Future<List<MonthlyPresentSummaryController>?> MonthlyPresentSummaryapi(student_id, company_key) async {

    var body = json.encode({
      "company_key":company_key,
      "student_id": student_id
    });


    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.monthlyattendencesummaryUrl);;
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      MonthlyPresentSummaryControllerList=[];
      monthlyPresentSummaryModel.value=MonthlyPresentSummary.fromJson(sdata);
      MonthlyPresentSummaryControllerList.add(sdata) ;





      if (sdata["status"] == true ) {
        loadingMonthlyPresentSummary.value=true;

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