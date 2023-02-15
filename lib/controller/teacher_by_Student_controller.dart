import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class GetTeacherByStudentController extends GetxController {

  List <dynamic> GetTeacherByStudentControllerList = [].obs;
  List<String> dropdata = [];


  RxBool loadingGetTeacherByStudent =false.obs;
  Future<List<GetTeacherByStudentController>?> GetTeacherByStudentapi(company_key,student_id) async {

    var body = json.encode({
      "company_key":company_key,
      "student_id": student_id
    });
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.getteacherbystudentUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);

      GetTeacherByStudentControllerList=[];
      GetTeacherByStudentControllerList.add(sdata) ;
adddrop();
      // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {
        loadingGetTeacherByStudent.value=true;
        print("massage");
      }
      else  {
        print("invalid cccid");
      } }
    else {
      print("School ID Invailid");
    }
  }

adddrop(){
   dropdata = [];
      if(GetTeacherByStudentControllerList.isNotEmpty){
for(var i=0; i<GetTeacherByStudentControllerList[0]["response"].length; i++) {
  dropdata.add(GetTeacherByStudentControllerList[0]["response"][i]["staff_name"]);
}
    }
}

}