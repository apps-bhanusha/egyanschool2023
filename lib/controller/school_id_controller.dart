import 'dart:convert';
import 'package:get/get.dart';
import 'package:ecom_desgin/view/children/Student_Login.dart';
import 'package:ecom_desgin/view/teacher/Teacher_Login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

 class SchoolIdController {

  List SchoolIdControllerList2 = [];

  Future<List<SchoolIdController>?> apicall(id ,_radioVal,context) async {
    var body = json.encode({
      "school_id": id,
    });
    final urlapi =
    Uri.parse("https://e-gyan.co.in/api/parentwebservices/getProjectKey");
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var sdata = jsonDecode(response.body);
      print("fddddddddddddddddddd33333333333333333333");
      print(sdata);
      SchoolIdControllerList2.add(sdata);

      // SchoolIdModel.fromJson(sdata);
      if (sdata["status"] == true) {
        if (_radioVal == "Student") {
          Get.to(() => StudentLogin());
          print("Student");
        }
        if (_radioVal == "Teacher") {
          Get.to(() => TeacherLogin());
          print("teacher");
          // all.apicall(id.text);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(sdata["message"], style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          ),
            backgroundColor: Colors.white,
          ),
        );
        print("invalid id");
      }
    }
  }}
// void postData(id) async {
//     print("fdddddddddddddddddddd44444444444444555555555555555555444");
//     //    var headers = {
//     //   'Content-Type': 'text/plain',
//     //   'Cookie': 'ci_session=72ad09608320993a07938376d6296f08fb88ea49'
//     // };
//     var request = http.Request('POST', Uri.parse('https://e-gyan.co.in/api/parentwebservices/getProjectKey'));
//     request.body = {  "school_id":id,
//     } as String;
//     // request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       String _model=await response.stream.bytesToString();
//      print( _model);
//      print("777777777777777777777777777");
//
//         // SchoolIdControllerList.add(_model["response"]);
//       final decodedMap = json.decode(_model);
//       SchoolIdControllerList.add(decodedMap["response"]);
//       print("4444444444444444444444442222222222222222222222222222");
//         print(SchoolIdControllerList);
// print(id);
//         print(SchoolIdControllerList[0]["company_key"]);
//       // print(SchoolIdControllerList[0]["response"][0]["company_key"]);
//
//       // print(await response.stream.bytesToString());
//
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//
//   }}
