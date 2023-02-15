import 'dart:convert';
import 'dart:developer';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/model/Teacher_model/teacher_notification_model.dart';
import 'package:ecom_desgin/model/download_model.dart';
import 'package:ecom_desgin/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class TeacherNotificationController extends GetxController{

  List<String> dropdata = ["Assinment","Syllebus","other"].obs;
  List<String> Assinment = ["english", "submit date","submit to ","other"].obs;
  List<String>  timeTable = ["hindi ", "10:00::","3 hours","marks :100"].obs;
  List<String> Syllebus = ["english", "hindi","math","computer"].obs;
  List<String> other = ["envent", "hollyday","othe program","meeting"].obs;
  RxList showDataList = [].obs;
  RxString selectDrop = "Download Section".obs;
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

  Rxn<TeacherNotificationModel> teachernotificationList=Rxn<TeacherNotificationModel>();
  RxBool isloading =false.obs;
  var id="";
  var companyKey='';
  var roleflag='';
  RxString  getnotificationcount="0".obs;


  @override
  void onInit() {
    super.onInit();
    var box = Hive.box("schoolData");
    id=box.get("staff_id");

    companyKey= box.get("company_key");
    roleflag = box.get("role_flag");
  }

  void teachernotifactionApi() async {
    var box = Hive.box("schoolData");
    id = box.get("staff_id");

    var body = json.encode({"company_key":companyKey,"id":id,"role_flag":roleflag});
    final urlapi = Uri.parse(
        ApiUrl.baseUrl+ApiUrl.teachernotificationUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
      if (homeWorkData["status"] == true ) {
        teachernotificationList.value = TeacherNotificationModel.fromJson(homeWorkData);
        isloading.value=true;
      } else {print("invalid id");}
    } else {print("errror");}
  }
  void teachernotificationcountmethod() async {


    var box = Hive.box("schoolData");
    id = box.get("staff_id");
    var companyKey = box.get("company_key");

    var body = json.encode({"company_key":companyKey,"id":id,"role_flag":roleflag});
    final urlapi = Uri.parse(
        ApiUrl.baseUrl+ApiUrl.teachernotificationcountUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
      if (homeWorkData["status"] == true ) {
        getnotificationcount.value=homeWorkData["response"][0]["count"];
      } else {print("invalid id");}
    } else {print("errror");}
  }

  void teachersetnotificationread(notiid) async {
    var box = Hive.box("schoolData");
   id = box.get("staff_id");
    var companyKey = box.get("company_key");

    var body = json.encode({"company_key": companyKey, "noti_id":notiid});
    final urlapi = Uri.parse(
        ApiUrl.baseUrl+ApiUrl.teachersetnotificationreadUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
      if (homeWorkData["status"] == true ) {
        teachernotificationcountmethod();
        teachernotifactionApi();
        //  assignmentDownloadModel.value = DownloadModel.fromJson(homeWorkData);
      } else {print("invalid id");}
    } else {print("errror");}
  }




}


