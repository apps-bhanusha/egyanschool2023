import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/Teacher_model/staff_presentMonthly_summary_model.dart';
import 'package:ecom_desgin/model/monthly_summry_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
class StaffMonthlyPresentSummaryController extends GetxController {

  List <dynamic> MonthlyPresentSummaryControllerList = [].obs;
  Rxn<StaffMonthlyPresentSummaryModel > staffMonthlyPresentSummaryModel =Rxn<StaffMonthlyPresentSummaryModel >();
  RxBool loadingMonthlyPresentSummary =false.obs;
  Future<List<StaffMonthlyPresentSummaryController>?> StaffMonthlyPresentSummaryapi(company_key,staff_id) async {

    var body = json.encode({
      "company_key":company_key,
      "staff_id": staff_id
    });

    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.staffmonthlypresentsummaryUrl);
    print(urlapi);
    var response = await http.post(urlapi, body: body);
    print("###################################");
    print(response.body);
    print("###################################");

    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      MonthlyPresentSummaryControllerList=[];
      staffMonthlyPresentSummaryModel.value=StaffMonthlyPresentSummaryModel.fromJson(sdata);
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