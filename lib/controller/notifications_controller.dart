import 'dart:convert';
import 'dart:developer';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/model/download_model.dart';
import 'package:ecom_desgin/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http; 

class NotificationController extends GetxController{



  List<String> dropdata = ["Assinment","Syllebus","other"].obs;
  List<String> Assinment = ["english", "submit date","submit to ","other"].obs;
  List<String>  timeTable = ["hindi ", "10:00::","3 hours","marks :100"].obs;
  List<String> Syllebus = ["english", "hindi","math","computer"].obs;
  List<String> other = ["envent", "hollyday","othe program","meeting"].obs;
  RxList showDataList = [].obs;
  RxString selectDrop = "Download Section".obs;
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());
    
     Rxn<NotificationModel> notificationList=Rxn<NotificationModel>();
    RxBool isloading =false.obs;
       var id="";
       var companyKey='';
       var roleflag='';
  RxString  getnotificationcount="0".obs;
       

@override
  void onInit() {
    super.onInit();
       var box = Hive.box("schoolData");
        id = "${studentProfileController.studentProfileModel.value?.response.studentId}";

     companyKey= box.get("company_key");
     roleflag = box.get("role_flag");
  }

void notifactionApi() async {
    id = "${studentProfileController.studentProfileModel.value?.response.studentId}";

    var body = json.encode({"company_key":companyKey,"id":id,"role_flag":roleflag});
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+ApiUrl.notificationUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
         if (homeWorkData["status"] == true ) {
           notificationList.value = NotificationModel.fromJson(homeWorkData);
           isloading.value=true;
      } else {print("invalid id");}
    } else {print("errror");}
  }
  void getnotificationcountmethod() async {
    id = "${studentProfileController.studentProfileModel.value?.response.studentId}";
    var box = Hive.box("schoolData");
    var companyKey = box.get("company_key");
     
    var body = json.encode({"company_key":companyKey,"id":id,"role_flag":roleflag});
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+ApiUrl.getnotificationcountUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
         if (homeWorkData["status"] == true ) {
           getnotificationcount.value=homeWorkData["response"][0]["count"];
      } else {print("invalid id");}
    } else {print("errror");}
  }

void setnotificationread(notiid) async {
    id = "${studentProfileController.studentProfileModel.value?.response.studentId}";
    var box = Hive.box("schoolData");
    var companyKey = box.get("company_key");
    
    var body = json.encode({"company_key": companyKey, "noti_id":notiid});
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+ApiUrl.setnotificationreadUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
       isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
         if (homeWorkData["status"] == true ) {
          
          getnotificationcountmethod();
          notifactionApi();
          //  assignmentDownloadModel.value = DownloadModel.fromJson(homeWorkData);
      } else {print("invalid id");}
    } else {print("errror");}
  }




}


