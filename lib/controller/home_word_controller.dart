import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;  
class HomeWorkController extends GetxController {
  RxBool isloading =false.obs;
  List homeWorkControllerList =[].obs;

  void homeworkapi() async {
    var body = json.encode({"company_key": "Od9EFRCPo8ach2Hk", "id": "10"});
    final urlapi = Uri.parse(
        "https://e-gyan.co.in/api/parentwebservices/student_homework");
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var homeWorkData = jsonDecode(response.body);
      print(homeWorkData);    
      if (homeWorkData["status"] == true) {
        isloading.value=true;
        homeWorkControllerList.add(homeWorkData["response"]["homeworklist"]);
      } else {print("invalid id");}
    } else {print("errror");}
  }
}
