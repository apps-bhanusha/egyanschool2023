import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
class GetexamsScheduleController extends GetxController {

  List <dynamic> GetexamsScheduleControllerList = [].obs;
  late DateTime examtimes;
  late DateTime examtimedate;
  var starttime;
  RxList<String> endtimeList = <String>[].obs;
  RxBool loadingGetexamsSchedule = false.obs;
  RxBool loadingtime = false.obs;
RxBool loadingExam=false.obs;
  Future<List<GetexamsScheduleController>?> GetexamsScheduleapi(company_key,
      exam_id) async {
    var body = json.encode({
      "company_key": company_key,
      "exam_id": exam_id
    });
    print(
        "4ffffffffffffffffffffgggggggggggggggggggggggggggggggggggggggbbbbbbbbbbbbbbb");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.getexamsScheduleUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var sdata = jsonDecode(response.body);

      GetexamsScheduleControllerList = [];
      GetexamsScheduleControllerList.add(sdata);
      print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
      print(GetexamsScheduleControllerList);
      print(
          GetexamsScheduleControllerList[0]["response"]["examSchedule"][0]["subject_name"]);

      // print(GetschoolsettingControllerList[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true) {
        loadingGetexamsSchedule.value = true;
        loadingExam.value = false;
        loadingtime.value=true;
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
        GetexamsScheduleControllerList[0]["response"]["examSchedule"]
            .length; i++) {
      var box = Hive.box("schoolData");

      box.put("exam_id",
          GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["exam_group_id"]);
      examtimes = DateFormat("HH:mm:ss").parse(
          GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["time_from"]
              .toString());
      examtimedate = examtimes.add(Duration(hours: int.parse(
          GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["duration"]
              .toString())));
      print(
          "rbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbxxxxxxxxxxxvvvvvvvvvvvvvvvvvvvnnnnnnnnnnnnaaaaaaaaaaaan");
      // print(examtimedate);
      loadingtime.value=true;
      starttime = formatDate(examtimedate, [HH, ':', nn, ':', ss]);
      print("start time");
// print(starttime);
//       print(starttime);
      endtimeList.add(starttime);
      print(endtimeList);

    }

  }

}