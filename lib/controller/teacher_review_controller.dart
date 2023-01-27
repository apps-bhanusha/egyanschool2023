import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class TeacherRatingController extends GetxController {

  List <dynamic> TeacherRatingControllerList = [].obs;
  RxBool loadingTeacherRating =false.obs;
  RxBool isloading =false.obs;

  get title => TeacherRatingControllerList;
  Future<List<TeacherRatingController>?> TeacherRatingapi(company_key,staff_id,comment,rate,student_id) async {

    var body = json.encode({
      "company_key":company_key.toString(),
      "staff_id":staff_id.toString(),
      "comment":comment.toString(),
      "rate":rate.toString(),
      "student_id":student_id.toString()});
    print("leavddddddddddddddddddddddddddddddddddgfffffffffffffffff");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.teacherratingUrl);
    print("Reeeeeeeeeeeeeeeesseeeeee");
    var response = await http.post(urlapi, body: body);
    print("Reeeeeeeeeeeeeessseeeeeeee");
    print(response);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);
      TeacherRatingControllerList=[];
      TeacherRatingControllerList.add(sdata) ;
      Get.snackbar(
        sdata["status"],
        sdata["message"],
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
      print("leavjhjjjjjjjjjjjjjjjjjjsssssssssssssssjjjjjj");
      print(TeacherRatingControllerList);

      // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {
        loadingTeacherRating.value=true;
        print("massage");



      }

      else  {
        print("invalid cccid");
      } }
    else {


    }
  }
}