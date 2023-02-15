import 'dart:convert';
import 'dart:developer';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/download_model.dart';
import 'package:ecom_desgin/model/notic_model.dart';
import 'package:ecom_desgin/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class NoticController extends GetxController{



  // List<String> dropdata = ["Assinment","Syllebus","other"].obs;
  // List<String> Assinment = ["english", "submit date","submit to ","other"].obs;
  // List<String>  timeTable = ["hindi ", "10:00::","3 hours","marks :100"].obs;
  // List<String> Syllebus = ["english", "hindi","math","computer"].obs;
  // List<String> other = ["envent", "hollyday","othe program","meeting"].obs;
  List <dynamic> showDataList = [].obs;
  RxString selectDrop = "Download Section".obs;

  Rxn<NoticModel> noticlist=Rxn<NoticModel>();

  RxBool isloading =false.obs;
  var id="";
  var companyKey='';
  var roleflag='';
  RxString  getnoticcount="0".obs;


  @override
  void onInit() {
    super.onInit();
    var box = Hive.box("schoolData");
    id = box.get("student_id").toString();
    companyKey= box.get("company_key");
    roleflag = box.get("role_flag");
  }

  void noticControllerApi() async {
    var body = json.encode({"company_key":companyKey,"role_flag":roleflag});
    final urlapi = Uri.parse(
        ApiUrl.baseUrl+ApiUrl.noticUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      isloading.value=true;
      var notic = jsonDecode(response.body);

      if (notic["status"] == true ) {
        noticlist.value = NoticModel.fromJson(notic);
        showDataList=[];
        showDataList.add(notic);

        isloading.value=true;
      } else {print("invalid id");}
    } else {print("errror");}
  }

}


