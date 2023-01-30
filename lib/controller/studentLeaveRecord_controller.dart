import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class StudentLeaveRecordController extends GetxController {
 
  List <dynamic> StudentLeaveRecordControllerList = [].obs;
  RxBool loadingStudentLeaveRecord =false.obs;
  RxBool isloading =false.obs;
  Future<List<StudentLeaveRecordController>?> StudentLeaveRecordapi(company_key,id,) async {

    var body = json.encode({
      "company_key":company_key,
      "id": id,

    });
    print("leavddddddddddddddddddddddddddddddddddgfffffffffffffffff");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.studentLeaveRecordUrl);
    print("Reeeeeeeeeeeeeeeeeeeeee");
    var response = await http.post(urlapi, body: body);
    print("Reeeeeeeeeeeeeeeeeeeeee");
    print(response);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);
      StudentLeaveRecordControllerList=[];
      StudentLeaveRecordControllerList.add(sdata) ;
        // loadingStudentLeaveRecord.value=true;

      print("leavjhjjjjjjjjjjjjjjjjjjsssjjjjjj");
      print(StudentLeaveRecordControllerList);

      // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {
        loadingStudentLeaveRecord.value=true;
        print("massage");
      }else  {
       isloading.value=true;
      } }
    else {

      print("School ID Invailid");
    }
  }
}