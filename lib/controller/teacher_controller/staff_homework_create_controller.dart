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
class StaffHomeWorkCreateController extends GetxController {
  final HomeWorkController _homeWorkController = Get.put(HomeWorkController());
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

  var sdata;
  List <dynamic> StaffHomeWorkCreateControllerList = [].obs;
  RxBool loadingHomeWorkCreate =false.obs;
  Future<List<StaffHomeWorkCreateController>?> StaffHomeWorkCreateapi(company_key,staff_id,class_id,section_id,subject_id,homework_date,submit_date,description,userfile) async {
    var headers = {
      'Cookie': 'ci_session=b240b7bedd208d10965a1bfd00ded3767a410928'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiUrl.baseUrl+ApiUrl.homeworkAddUrl));
    request.fields.addAll({
      'company_key': company_key,
      'staff_id': staff_id,
      'class_id': '1',
      'section_id': '1',
      'subject_id': '2',
      'homework_date': homework_date,
      'submit_date': submit_date,
      'description': description
    });
    print("ddffffffffffff");
    print(request.fields);
    print(request.files);
    request.files.add(await http.MultipartFile.fromPath('userfile', userfile));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      print("dddddddddddddddsss usetfile");
      loadingHomeWorkCreate.value=true;
      var  sdata=await response.stream.bytesToString();

      print(sdata);
      var  alldata =jsonDecode(sdata);
      StaffHomeWorkCreateControllerList.add(sdata);
      var box = Hive.box("schoolData");
      late  var student_id = box.get("student_id");
      _homeWorkController.homeworkapi(student_id);
      print(alldata.toString());
      Get.snackbar(
        alldata["message"].toString(),
        "",
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