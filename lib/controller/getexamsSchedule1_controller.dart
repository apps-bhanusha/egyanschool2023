import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
class GetexamsSchedule1Controller extends GetxController {

  List <dynamic> GetexamsSchedule1ControllerList = [].obs;
  late DateTime examtimes;
  late DateTime examtimedate;
  var starttime;

  RxBool loadingGetexamsSchedule1 = false.obs;

  Future<List<GetexamsSchedule1Controller>?> GetexamsSchedule1api(company_key,
      exam_id,sID) async {
    var body = json.encode({
      "company_key": company_key,
      "exam_id": exam_id,
      "student_id": sID,
    });
    final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.getexamsScheduleUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var sdata = jsonDecode(response.body);

      GetexamsSchedule1ControllerList = [];
      GetexamsSchedule1ControllerList.add(sdata);

      // print(GetschoolsettingControllerList[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true) {
        loadingGetexamsSchedule1.value = true;

        groupid();

        print("massage");
      }
      else {
        print("invalid cccid");
      }
    }
    else {
      print("School ID Invailid");
    }
  }

  void groupid() {
    for (var i = 0; i <
        GetexamsSchedule1ControllerList[0]["response"]["examSchedule"]
            .length; i++) {
      var box = Hive.box("schoolData");

      box.put("exam_id", GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][i]["exam_group_id"]);

    }
  }

}
