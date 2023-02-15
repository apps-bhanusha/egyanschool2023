import 'dart:convert';
import 'dart:developer';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;  
class HomeWorkController extends GetxController {
  RxBool isloading =false.obs;
  RxBool isdownloadin=true.obs;
  RxBool isdownloadinIndex=true.obs;
  bool noMoreData = false;
  RxList homeWorkControllerList =[].obs;

  void homeworkapi(student_id) async {
    var box = Hive.box("schoolData");
    var company_key = box.get("company_key");

    var body = json.encode({"company_key": company_key, "student_id":student_id});
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+ApiUrl.homeWorkUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var homeWorkData = jsonDecode(response.body);
         if (homeWorkData["status"] == true ) {
           isloading.value=true;
         homeWorkControllerList.add(homeWorkData["response"]);



      } else {print("invalid id");}
    } else {print("errror");}
  }

  void isdownloadinmethod(){
        isdownloadin.value=false;

   }

}



class EmptyListWidget {
}
