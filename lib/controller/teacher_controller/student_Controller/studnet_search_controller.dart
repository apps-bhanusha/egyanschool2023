import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_list_controller.dart';
import 'package:ecom_desgin/model/student/studeny_information_model.dart';
import 'package:get/get.dart';
import 'dart:convert';


import 'package:ecom_desgin/constant/api_url.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
class StudentSearchController extends GetxController{


   final ClassListController classListController = Get.put(ClassListController());
   Rxn<StudentInformationListModal> studentInformationListModal = Rxn<StudentInformationListModal>();





RxBool isSearch=true.obs;
RxBool isSearchbutton=true.obs;
RxBool  listisempty=false.obs;
 String sectionID='';




    void studentSearchapi(searchname) async {
    try {
     if(searchname.toString().isNotEmpty){
       var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
      var currentTime  =formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd]);
      print(currentTime);
      var body = json.encode({
        "company_key":company_key,
        "search":"search_full",
        "search_text":searchname
      });
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.studentsearchUrl);
      var response = await http.post(urlapi, body: body);
      print("student search attendace responce");
            print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      studentInformationListModal.value =StudentInformationListModal.fromJson(data);
      print("SSSSSSSSSSSSSSSSSSSMMMMMMMMMMMMMMMMMMMMMMM");
      print(studentInformationListModal.value?.response[0].studentName);
        if (data["status"] == true) {
          listisempty.value=false;
       isSearchbutton.value=true;
         
        } else {
         isSearchbutton.value=true;
          listisempty.value=true;
        } }else {
          isSearchbutton.value=true;
          listisempty.value=true;
      }

     }
    } catch (e) {
       print(e);
       listisempty.value=true;
        isSearchbutton.value=true;
          isSearch.value=true;
      print("Something Error");
    }
  }


    void classSectiontInfoapi(selectdrop) async {
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
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.getStudentListByClassSectionUrl);
      var response = await http.post(urlapi, body: body);
      print("class attendace responce");
            print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      studentInformationListModal.value =StudentInformationListModal.fromJson(data);
        if (data["status"] == true) {
          var i=0;
        studentInformationListModal.value!.response.forEach((element) {
          
          print(element.studentId);
          i++;
        }) ;
        print("^^^^^^^^^^^^^^^^^^^^^^^^");
        print(i);
        if(i==0){
          listisempty.value=true;
        }else{
          listisempty.value=false;
        }
       isSearch.value=true;
        
// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {
         isSearch.value=true;

        } }else {
          isSearch.value=true;
      }

     }
    } catch (e) {
       print(e);
          isSearch.value=true;
      print("Something Error");
    }
  }
}