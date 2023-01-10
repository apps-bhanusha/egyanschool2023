import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AttendanceController extends GetxController {
  List <dynamic> AttendanceControllerList = [].obs;
  List<DateTime> presentDates = [

  ];

  RxBool loadingattendance = false.obs;

  Future<List<AttendanceController>?> Attendanceapi(year, month, id,
      company_key) async {
    var body = json.encode({
      "company_key": company_key,
      "student_id": id,
      "month": month,
      "year": year,
    });
    print("46555555555555555555555554444444444444444444fgggggggggg55544444444");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.attendanceUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var sdata = jsonDecode(response.body);

      AttendanceControllerList = [];
      AttendanceControllerList.add(sdata);
      print(AttendanceControllerList);
      print(AttendanceControllerList[0]["response"][0]["date"]);
      print(AttendanceControllerList[0]["response"][0]["title"]);
      print(
          "555555555555555555555jjjjjjjj444444444444444444444444ggggggggggjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      var box = Hive.box("schoolData");
      print("5555555555555555555555555555554444444444444");


      box.put("date", AttendanceControllerList[0]["response"][0]["date"]);

      if (sdata["status"] == true) {
        print("massage");
      }
      else {
        print("invalid cccid");
      }
      addcalendardata();
      loadingattendance.value=true;
    }
    else {
      print("School ID Invailid");
    }
  }
  void addcalendardata(){
    for(var i=0; i<AttendanceControllerList[0]["response"][i].length-1; i++){
      print("4444444444444444444444444444kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
      print(AttendanceControllerList[0]["response"][i]["date"]);
      presentDates.add(DateFormat("yyyy-MM-dd").parse(AttendanceControllerList[0]["response"][i]["date"]));
    }
  }
}
