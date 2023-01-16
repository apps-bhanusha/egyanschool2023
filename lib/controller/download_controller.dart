import 'dart:convert';
import 'dart:developer';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/download_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http; 

class DownloadAllController extends GetxController{



  List<String> dropdata = ["Assinment","Syllebus","other"].obs;
  List<String> Assinment = ["english", "submit date","submit to ","other"].obs;
  List<String>  timeTable = ["hindi ", "10:00::","3 hours","marks :100"].obs;
  List<String> Syllebus = ["english", "hindi","math","computer"].obs;
  List<String> other = ["envent", "hollyday","othe program","meeting"].obs;
  RxList showDataList = [].obs;
  RxString selectDrop = "Download Section".obs;
    
     Rxn<DownloadModel> assignmentDownloadModel=Rxn<DownloadModel>();
    RxBool isloading =true.obs;
       var id="";

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
       var box = Hive.box("schoolData");
    id = box.get("student_id").toString();
  }

void assignmentDownload(url) async {
  print("call assingment select");
    var box = Hive.box("schoolData");
    var companyKey = box.get("company_key");
     
    var body = json.encode({"company_key": companyKey, "id":id });
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+url);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
      log(homeWorkData.toString());
         if (homeWorkData["status"] == true ) {
           assignmentDownloadModel.value = DownloadModel.fromJson(homeWorkData);
           isloading.value=true;
      } else {print("invalid id");}
    } else {print("errror");}
  }
  void otherDownload(url) async {
  print("call time table select");
    var box = Hive.box("schoolData");
    var companyKey = box.get("company_key");
     
    var body = json.encode({"company_key": companyKey, "id":id });
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+url);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
      log(homeWorkData.toString());
         if (homeWorkData["status"] == true ) {
           assignmentDownloadModel.value = DownloadModel.fromJson(homeWorkData);
      } else {print("invalid id");}
    } else {print("errror");}
  }

void syllebusDownload(url) async {
  print("call syllebus select");
    var box = Hive.box("schoolData");
    var companyKey = box.get("company_key");
    
    var body = json.encode({"company_key": companyKey, "id":id });
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+url);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
       isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
      log(homeWorkData.toString());
         if (homeWorkData["status"] == true ) {
           assignmentDownloadModel.value = DownloadModel.fromJson(homeWorkData);
      } else {print("invalid id");}
    } else {print("errror");}
  }


  selectDropdown(selectdropdata){
    print("controller");   
    print(selectdropdata);
    selectDrop.value=selectdropdata;
    if(selectdropdata=="Assinment"){
        assignmentDownload(ApiUrl.assignmentDownloadurl);
    }else if(selectdropdata=="Syllebus"){
          syllebusDownload(ApiUrl.syllabusDownloadurl);
    }else if(selectdropdata=="other"){
           assignmentDownload(ApiUrl.otherDownloadurl);
    }
  }


}


