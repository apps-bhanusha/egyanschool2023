import 'dart:async';
import 'dart:convert';

import 'package:ecom_desgin/model/Teacher_model/class_section_timetable_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_url.dart';

class ClassSsemfgklsdmgvsmgvlsdmlectionController extends GetxController{

  Rxn<ClassSectionModel>classSectionModel = Rxn<ClassSectionModel>();

  RxBool isloding =false.obs;
  static RxList  countries1 = [].obs;
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

          addclasssection();


// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {

        } }else {
      }
    } catch (e) {
      print(e);
      print("Something Error");
    }

  }

  void addclasssection() {
    countries1.value = [];

    classSectionModel.value?.response.forEach((
        element) {
      var sectionName = '${element.sectionName}';
      print("sectionname------------------------ddd");
      print(sectionName);
      final timer = Timer(
        const Duration(seconds: 3),
            () {
              countries1.add(sectionName);
        },

      );

    });
  }

}