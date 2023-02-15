import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_list_controller.dart';
import 'package:ecom_desgin/model/student/Teacher_syllebus_model.dart';
import 'package:ecom_desgin/model/student/studeny_information_model.dart';
import 'package:get/get.dart';
import 'dart:convert';


import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/student/Class_attendaceModel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
class TeacherSyllebusController extends GetxController{


   final ClassListController classListController = Get.put(ClassListController());
   Rxn<TeacherSyllebusModal> teacherSyllebusModal = Rxn<TeacherSyllebusModal>();
RxBool isSearchbutton=false.obs;
RxBool loadingTeacherSylabusStatus=true.obs;
 String sectionID='';

    void classSectiontSyllebusapi(selectdrop) async {
         classListController.classSectionModel.value?.response.forEach((element) {
     if(element.sectionName.toLowerCase()==selectdrop.toString().toLowerCase()){
               sectionID=element.sectionId;
               print("@@@@@@@@@@@@@@@@@@@@@");
               
     }
        
      });
    try {
     if(classListController.classId.isNotEmpty&&sectionID.isNotEmpty){
       var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
      var currentTime  =formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd]);
      print(currentTime);
      var body = json.encode({
        "company_key":company_key,
        "class_id":classListController.classId,
        "section_id":sectionID,
        
      });
      print("student information ...................");
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.teacherSyllebuschUrl);
      var response = await http.post(urlapi, body: body);
      print("class attendace responce");
            print(response.body);

      if (response.statusCode == 200) {
        
        var data = jsonDecode(response.body);
        if (data["status"] == true) {
          teacherSyllebusModal = Rxn<TeacherSyllebusModal>();
           teacherSyllebusModal.value =TeacherSyllebusModal.fromJson(data);
          loadingTeacherSylabusStatus.value=true;
          isSearchbutton.value=true;
// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {
         loadingTeacherSylabusStatus.value=true;
           teacherSyllebusModal.value =TeacherSyllebusModal.fromJson(       {
    "status": true,
    "message": "Success",
    "response": {
        "title": "Sylabus Status",
        "subjects_data": [
          
        ]
    }
});

  

        } }else {
          loadingTeacherSylabusStatus.value=true;
                    teacherSyllebusModal.value =TeacherSyllebusModal.fromJson(       {
    "status": true,
    "message": "Success",
    "response": {
        "title": "Sylabus Status",
        "subjects_data": [
          
        ]
    }
});
      }

     }
    } catch (e) {
       print(e);
                 teacherSyllebusModal.value =TeacherSyllebusModal.fromJson(       {
    "status": true,
    "message": "Success",
    "response": {
        "title": "Sylabus Status",
        "subjects_data": [
          
        ]
    }
});
          loadingTeacherSylabusStatus.value=true;
      print("Something Error");
    }
  }
}