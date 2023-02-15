import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/Teacher_model/teacher_leave_record_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class StaffLeaveRecordController extends GetxController {

  List <dynamic> StaffLeaveRecordControllerList = [].obs;
  Rxn<StaffLeaveRecordModel> staffLeaveRecordList=Rxn<StaffLeaveRecordModel>();
  RxBool loadingStaffLeaveRecord =false.obs;
  RxBool isloading =false.obs;
  Future<List<StaffLeaveRecordController>?> StaffLeaveRecordapi(company_key,staff_id,) async {

    var body = json.encode({
      "company_key":company_key,
      "staff_id": staff_id,
    });
 
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.staffLeaveRecordUrl);
    var response = await http.post(urlapi, body: body);

    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);
      StaffLeaveRecordControllerList=[];
      StaffLeaveRecordControllerList.add(sdata) ;

      // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {
        staffLeaveRecordList.value = StaffLeaveRecordModel.fromJson(sdata);


        loadingStaffLeaveRecord.value=true;
        print("massage");
      }else  {
        isloading.value=true;
      } }
    else {

      print("School ID Invailid");
    }
  }
}