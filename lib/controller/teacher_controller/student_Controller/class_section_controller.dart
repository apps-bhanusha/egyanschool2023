import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/student/class_section_timetable_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;


class ClassSectionController extends GetxController{

  Rxn<ClassSectionModel>classSectionModel = Rxn<ClassSectionModel>();

  RxBool isloding =false.obs;
  // static List<String>  countries1 = <String>[];
  RxList<String> sectionList = <String>[].obs;
  void classsectionapi(class_id) async {
    try {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");

      var body = json.encode({
        "company_key":company_key,
        "class_id":class_id
      });
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.classsectionUrl);
      var response = await http.post(urlapi, body: body);

      if (response.statusCode == 200) {
        var tdata = jsonDecode(response.body);


        if (tdata["status"] == true) {
          classSectionModel.value=ClassSectionModel.fromJson(tdata);
          isloding.value=true;
          print("Staff Name");
          addclasssection();
          print(classSectionModel.value?.response[0].sectionName);

// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {

        } }else {
      }
    } catch (e) {
      print("Something Error");
    }

  }

  void addclasssection() {
    sectionList.value = [];

    classSectionModel.value?.response.forEach((
        element) {
      var sectionName = '${element.sectionName}';
      print("sectionname------------------------dd");
      print(sectionName);

      sectionList.add(sectionName);

    });
  }

}