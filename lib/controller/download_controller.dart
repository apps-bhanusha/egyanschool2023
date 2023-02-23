import 'dart:convert';
import 'dart:developer';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
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
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());
    
     Rxn<DownloadModel> assignmentDownloadModel=Rxn<DownloadModel>();
     
    RxBool isloading =true.obs;
    RxBool norecord =true.obs;
       var id="";

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
       var box = Hive.box("schoolData");
    id = "${studentProfileController.studentProfileModel.value?.response.studentId}";
  }

void assignmentDownload(url) async {
    id = "${studentProfileController.studentProfileModel.value?.response.studentId}";
    var box = Hive.box("schoolData");
    var companyKey = box.get("company_key");
     
    var body = json.encode({"company_key": companyKey, "id":id });
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+url);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
         if (homeWorkData["status"] == true ) {
           assignmentDownloadModel.value = DownloadModel.fromJson(homeWorkData);
           isloading.value=true;
      } else {print("invalid id");}
    } else {print("errror");}
  }
  void otherDownload(url) async {
    print("othercall");
    id = "${studentProfileController.studentProfileModel.value?.response.studentId}";
    var box = Hive.box("schoolData");
    var companyKey = box.get("company_key");
     
    var body = json.encode({"company_key": companyKey, "id":id });
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+url);
    var response = await http.post(urlapi, body: body);
    print(response.body);
    if (response.statusCode == 200) {
        isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
         if (homeWorkData["status"] == true ) {
      
           assignmentDownloadModel.value = DownloadModel.fromJson(homeWorkData);
           if(assignmentDownloadModel.value!.response!.list!.isEmpty){
            norecord.value=false;
           }
      } else {
        norecord.value=false;
        print("invalid id");}
    } else {print("errror");
    norecord.value=false;
    }
  }

void syllebusDownload(url) async {
    id = "${studentProfileController.studentProfileModel.value?.response.studentId}";
    var box = Hive.box("schoolData");
    var companyKey = box.get("company_key");
    
    var body = json.encode({"company_key": companyKey, "id":id });
    final urlapi = Uri.parse(
       ApiUrl.baseUrl+url);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
       isloading.value=true;
      var homeWorkData = jsonDecode(response.body);
         if (homeWorkData["status"] == true ) {
           assignmentDownloadModel.value = DownloadModel.fromJson(homeWorkData);
      } else {print("invalid id");}
    } else {print("errror");}
  }


  selectDropdown(selectdropdata){
    selectDrop.value=selectdropdata;
    if(selectdropdata=="Assinment"){
      print(selectdropdata);
        assignmentDownload(ApiUrl.assignmentDownloadurl);
    }else if(selectdropdata=="Syllebus"){
      print(selectdropdata);
          syllebusDownload(ApiUrl.syllabusDownloadurl);
    }else if(selectdropdata=="other"){
      print(selectdropdata);
          otherDownload(ApiUrl.otherDownloadurl);
    }
  }


}


