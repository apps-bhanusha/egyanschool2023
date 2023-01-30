import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/home_word_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeWorkCreateController extends GetxController {
  final HomeWorkController _homeWorkController = Get.put(HomeWorkController());
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

var sdata;
  List <dynamic> HomeWorkCreateControllerList = [].obs;
  RxBool loadingHomeWorkCreate =false.obs;
  Future<List<HomeWorkCreateController>?> HomeWorkCreateapi(company_key,student_id,content_title,note,file,homework_id) async {
    var headers = {
      'Cookie': 'ci_session=b240b7bedd208d10965a1bfd00ded3767a410928'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiUrl.baseUrl+ApiUrl.homeworkcreateUrl));
    request.fields.addAll({
      'company_key': company_key,
      'student_id': '${studentProfileController.studentProfileModel.value?.response.studentId}',
      'content_title': content_title,
      'note': note,
      'homework_id': homework_id});
    print("ddddzzz");
    print(request.fields);
    print(request.files);
    request.files.add(await http.MultipartFile.fromPath('file', file));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      print("dddddddddddddddsss");
      loadingHomeWorkCreate.value=true;
    var  sdata=await response.stream.bytesToString();
print(sdata);
var  alldata =jsonDecode(sdata);
      HomeWorkCreateControllerList.add(sdata);
      // print(await response.stream.bytesToString());
      var box = Hive.box("schoolData");
      late  var student_id = box.get("student_id");
      _homeWorkController.homeworkapi(student_id);
     print(alldata.toString());
      Get.snackbar(
        alldata["status"].toString(),
        alldata["message"].toString(),
        duration: 5.seconds, // it could be any reasonable time, but I set it lo-o-ong
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true,

        isDismissible: true,
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
        mainButton: TextButton(
            onPressed: Get.back,
            child: const Text(
                "Close"

            )),
      );

    }

    else {

    }
  }
}