import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;  
class HomeWorkController extends GetxController {
  RxBool isloading =false.obs;
  RxBool isdownloadin=true.obs;
  bool noMoreData = false;
  RxList homeWorkControllerList =[].obs;

  void homeworkapi(id) async {
    var box = Hive.box("schoolData");
    var company_key = box.get("company_key");

    var body = json.encode({"company_key": company_key, "id":id });
    print("4444444444444444444444444444444444444444433333333333");
    print(body);
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+ApiUrl.homeWorkUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var homeWorkData = jsonDecode(response.body);
      print( homeWorkData);
         if (homeWorkData["status"] == true ) {
           isloading.value=true;

           print("44444444444444444444444444444444433ddddddd333333333333333333333333222222333333332");
           homeWorkControllerList.add(homeWorkData["response"]["homeworklist"]);
        print("44444444444444444444444444444444433ddddddd3333333333333333333333332222222");
        print(homeWorkControllerList);
      } else {print("invalid id");}
    } else {print("errror");}
  }

  void isdownloadinmethod(){
        isdownloadin.value=false;
       
      
   }
}



class EmptyListWidget {
}
