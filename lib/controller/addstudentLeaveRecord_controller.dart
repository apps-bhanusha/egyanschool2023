import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class AddStudentLeaveRecordController extends GetxController {

  List <dynamic> AddStudentLeaveRecordControllerList = [].obs;

  RxBool loadingAddStudentLeaveRecord =false.obs;
  Future<List<AddStudentLeaveRecordController>?> AddStudentLeaveRecordapi(company_key,student_id,from_date,to_date,message,userfile) async {
    print("dddddddddddddccccccccccsss");
    print(userfile);
    var headers = {
      'Cookie': 'ci_session=8e6de003d84c4a149a3c80a6be1fff63b6c73cfa'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://e-gyan.co.in/api/leavewebservices/addstudentLeaveRecord'));
    request.fields.addAll({
      'company_key': company_key,
      'student_id': student_id,
      'from_date': from_date,
      'to_date': to_date,
      'message': message,

    });
    request.files.add(await http.MultipartFile.fromPath('userfile', userfile));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
      print(response.stream.toList());
    }
  // var  body = json.encode({
  //     "company_key":company_key,
  //     "student_id": student_id,
  //     "from_date":from_date,
  //     "to_date":to_date,
  //     "message":message,
  //     "userfile":userfile
  //   });
  //   print("leavddddddddddddddddddddddddddddddddddgfffffffffffffffff");
  //   print(body);
  //   final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.addstudentLeaveRecordUrl);
  //   var response = await http.post(urlapi, body: body);
  //   if (response.statusCode == 200) {
  //     var  sdata = jsonDecode(response.body);
  //
  //     AddStudentLeaveRecordControllerList=[];
  //     AddStudentLeaveRecordControllerList.add(sdata) ;
  //     print("dddddddddddddddddddggggggggggggg");
  //     print(AddStudentLeaveRecordControllerList);
  //
  //     // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
  //     if (sdata["status"] == true ) {
  //       loadingAddStudentLeaveRecord.value=true;
  //       print("massage");
  //     }
  //     else  {
  //       print("invalid cccid");
  //     } }
  //   else {
  //
  //     print("School ID Invailid");
  //   }
  }
}