import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_list_controller.dart';
import 'package:ecom_desgin/model/Teacher_model/all_content_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';


import 'package:ecom_desgin/constant/api_url.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
class StudentLeaveController extends GetxController{


   final ClassListController cListController = Get.put(ClassListController());
   Rxn<AllContentModal> allContentModal = Rxn<AllContentModal>();

  List <dynamic> StudentLeaveRecordControllerList = [].obs;
  RxBool loadingStudentLeaveRecord =false.obs;
  RxBool isloading =false.obs;
  RxBool isloading2 =true.obs;
RxBool isSearchbutton=true.obs;
RxBool  listisempty=false.obs;
RxBool  saveisloading=false.obs;
String sectionID='';
String studentId="";


 var box = Hive.box("schoolData");

 studentLeaveRecord(selectdrop) async {
    cListController.studentListModel.value?.response.forEach((element) {
                     if(element.studentName.toString().toLowerCase()==selectdrop.toString().toLowerCase()){
                      print(element.studentName);
                      studentId=element.studentId;
                     }
                   });

 var company_key = box.get("company_key");
    var body = json.encode({
      "company_key":company_key,
      "id": studentId,

    });
    print("leave start");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.studentLeaveRecordUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var  sdata = jsonDecode(response.body);
      StudentLeaveRecordControllerList=[];
      StudentLeaveRecordControllerList.add(sdata) ;
        // loadingStudentLeaveRecord.value=true;
      // print(GetschoolsettingControllerLexam_idist[0]["response"]["total_discount_amount"]);
      if (sdata["status"] == true ) {
       
        print("data loaded");
        isloading2.value=true;
        loadingStudentLeaveRecord.value=true;
        isloading.value=true;
      }else  {
      isloading2.value=false;
       isloading.value=true;
      } }
    else {
 isloading2.value=false;
      print("School ID Invailid");
      isloading.value=true;
    }
  }



    void studentleaveapi() async {
    try {
     
       var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
      var currentTime  =formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd]);
      print(currentTime);
      var body = json.encode({
        "company_key":company_key,
      });
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.getallcontentUrl);
      var response = await http.post(urlapi, body: body);
      print("student search attendace responce");
            print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      allContentModal.value =AllContentModal.fromJson(data);
      print("SSSSSSSSSSSSSSSSSSSMMMMMMMMMMMMMMMMMMMMMMM");
      print(allContentModal.value?.response[0].title);
        if (data["status"] == true) {
          
       isloading.value=true;
         
        } else {
         isloading.value=true;

        } }else {
          isloading.value=true;
      }

     
    } catch (e) {
       print(e);
          isloading.value=true;
      print("Something Error");
    }
  }

  Future<String?> saveStudentLeave(selectdrop,visibility,title,type,note,file) async {
       cListController.classSectionModel.value?.response.forEach((element) {
     if(element.sectionName.toLowerCase()==selectdrop.toString().toLowerCase()){
               sectionID=element.sectionId;
               print("@@@@@@@@@@@@@@@@@@@@@");         
     }   
      });
    try {
       var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
      var staff_id = box.get("staff_id");
      var currentTime  =formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd]);
      print(currentTime);
      var body = json.encode({
        "company_key":company_key.toString(),
        "visibility":visibility.toString(),
        "class_id":cListController.classId.toString(),
        "section_id":sectionID.toString(),
        "content_title":title.toString(),
        "content_type":type.toString(),
        "note":note.toString(),
        "upload_date":currentTime.toString(),
        "file":file,
        "teacher_id":staff_id.toString(),
      });
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.saveUploadContentUrl);
      var response = await http.post(urlapi, body: {
        "company_key":company_key.toString(),
        "visibility":visibility.toString(),
        "class_id":cListController.classId.toString(),
        "section_id":sectionID.toString(),
        "content_title":title.toString(),
        "content_type":type.toString(),
        "note":note.toString(),
        "upload_date":currentTime.toString(),
        "file":file,
        "teacher_id":staff_id.toString(),
      });
      print("student search attendace responce");
            print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
 
        if (data["status"] == true) {
          studentleaveapi() ;
       saveisloading.value=false;
            Get.snackbar(
        data["message"].toString(),
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
      return "true";
        } else {
              Get.snackbar(
        "Upload Error",
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
         saveisloading.value=false;

        } }else {
                  Get.snackbar(
        "Upload Error",
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
          saveisloading.value=false;
      }
     
    } catch (e) {
              Get.snackbar(
        "Upload Error",
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
       print(e);
          saveisloading.value=false;
      print("Something Error");
    }
  }


//  
}