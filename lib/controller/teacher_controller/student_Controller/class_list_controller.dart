import 'dart:convert';


import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/controller/getSylabusStatus_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_section_controller.dart';
import 'package:ecom_desgin/model/student/Class_attendaceModel.dart';
import 'package:ecom_desgin/model/student/attendenceTypeP_model.dart';
import 'package:ecom_desgin/model/student/class_section_timetable_model.dart';
import 'package:ecom_desgin/model/student/class_timetable_model.dart';
import 'package:ecom_desgin/model/student/student_listModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

class ClassListController extends GetxController{
  ClassSectionController sectionTimeTableController =Get.put(ClassSectionController());
  GetSylabusStatusController sylabusStatusController =Get.put(GetSylabusStatusController());
  Rxn<ClassListModel> classListModel = Rxn<ClassListModel>();
  Rxn<ClassSectionModel>classSectionModel = Rxn<ClassSectionModel>();
 Rxn<ClassAttendenceListModal> classAttendenceListModal = Rxn<ClassAttendenceListModal>();
 Rxn<AttendenceTypeModal> attendenceTypeModal = Rxn<AttendenceTypeModal>();
 Rxn<StudentListModel> studentListModel = Rxn<StudentListModel>();

  RxBool isloding =false.obs;
  RxBool isloding2 =true.obs;
  RxBool isloding3 =true.obs;
  RxBool isloding4 =true.obs;
  RxBool islodingSave =true.obs;
  RxBool islodingstudentlist =true.obs;
  RxBool isSearch =true.obs;
  RxBool  listisempty=false.obs;

  RxList<String> classList = <String>[].obs;
  RxList<String> classSection = <String>[].obs;
  RxList<String> attendaceType = <String>[].obs;
  RxList<String> studentListDrop = <String>[].obs;

String classId="";
String sectionID="";

List<dynamic> addAttendanceList= [];
 RxList myList =[].obs;
///////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
  void classListapi() async {
    try {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");

      var body = json.encode({
        "company_key":company_key,
      });
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.classlistUrl);
      var response = await http.post(urlapi, body: body);
      print("class list responce");
            print(response.body);
      if (response.statusCode == 200) {
        var tdata = jsonDecode(response.body);
        classListModel.value=ClassListModel.fromJson(tdata);
         
        if (tdata["status"] == true) {
          classList = <String>[].obs;
          print("Staff Name");

          print(classListModel.value?.response[0].id);

      classListModel.value?.response.forEach((element) {
        classList.add(element.name.toString());
      });
         
isloding.value=true;


// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {

        } }else {
      }
    } catch (e) {
      print("Something Error");
    }
  }

/////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

    void classSectionapi(selectdrop) async {
       isloding2.value =false;
    print(selectdrop);
       classListModel.value?.response.forEach((element) {
           if(element.name.toString().toLowerCase()==selectdrop.toString().toLowerCase()){
            classId=element.id;
            print(classId);
           }
      });
print("loop end");
    try {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");

      var body = json.encode({
        "company_key":company_key,
        "class_id":classId,
      });
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.classsectionUrl);
      var response = await http.post(urlapi, body: body);
      print("class list responce");
            print(response.body);
      if (response.statusCode == 200) {
        var tdata = jsonDecode(response.body);
        classSectionModel.value=ClassSectionModel.fromJson(tdata);

        if (tdata["status"] == true) {
          isloding.value=true;
          print("Staff Name");
        classSection = <String>[].obs;
          print(classListModel.value?.response[0].id);

      classSectionModel.value?.response.forEach((element) {
        classSection.add(element.sectionName.toString());
        sectionID=element.sectionId;
      });
        isloding2.value=true;  

  
// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {

        } }else {
      }
    } catch (e) {
      print(e);
      print("Something Error");
    }

  }

///////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


  void classAttendenceListapi(selectSection) async {
      classSectionModel.value?.response.forEach((element) {
     if(element.sectionName.toLowerCase()==selectSection.toString().toLowerCase()){
               sectionID=element.sectionId;
     }
        
      });
    classAttendenceTypeapi();
    try {
     if(classId.isNotEmpty&&sectionID.isNotEmpty){
       var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
      var currentTime  =formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd]);
      print(currentTime);
      var body = json.encode({
        "class_id":classId,
        "section_id":sectionID,
        "date":currentTime.toString(),
        "company_key":company_key
      });
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.classAttendanceListUrl);
      var response = await http.post(urlapi, body: body);
      print("class attendace responce");
            print(response.body);
     
      if (response.statusCode == 200) {
         classAttendenceListModal = Rxn<ClassAttendenceListModal>();
        var tdata = jsonDecode(response.body);
       
        if (tdata["status"] == true) {
          
       isSearch.value=true;
       isloding3.value=true;
         classAttendenceListModal.value=ClassAttendenceListModal.fromJson(tdata);
          attendencetypelsit();
                var i=0;
        classAttendenceListModal.value!.response.forEach((element) {
          
          print(element.attendenceId);
          i++;
        }) ;
        print("^^^^^^^^^^^^^^^^^^^^^^^^");
        print(i);
        if(i==0){
          listisempty.value=true;
          
        }else{
          listisempty.value=false;
        }
// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {
          listisempty.value=true;
           classAttendenceListModal = Rxn<ClassAttendenceListModal>();
         isSearch.value=true;
        isloding3.value=true;
        isloding4.value=false;
        } }else {
          isSearch.value=true;
          isloding3.value=true;
          isloding4.value=false;
           classAttendenceListModal = Rxn<ClassAttendenceListModal>();
      }

     }
    } catch (e) {
       print(e);
        classAttendenceListModal = Rxn<ClassAttendenceListModal>();
       isloding3.value=true;
       isloding4.value=false;
          isSearch.value=true;
      print("Something Error");
    }
  }

////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

  void classAttendenceTypeapi() async {
    try {
     
       var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
      var body = json.encode({
        "company_key":company_key
      });
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.getstudentattendanceTypeUrl);
      var response = await http.post(urlapi, body: body);
      print("class attendace responce");
            print(response.body);
      if (response.statusCode == 200) {
        attendaceType = <String>[].obs;
        var tdata = jsonDecode(response.body);
        attendenceTypeModal.value=AttendenceTypeModal.fromJson(tdata);
         
        if (tdata["status"] == true) {
         
      attendenceTypeModal.value?.response.forEach((element) {
         attendaceType.add(element.type);
         
      });

        } else {
          

        } }else {
      }
    
    } catch (e) {
       print(e);
         
    }
  }
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
addAttendancelist(type,sesionId){
       String attendence_type_id="";
      attendenceTypeModal.value?.response.forEach((element) {
         if(type.toString()==element.type.toString()){
          attendence_type_id=element.id;
         }
      });

         addAttendanceList.add({
        "attendence_type_id":attendence_type_id,
        "remark":"",
        "student_session_id":sectionID,
        },);

}
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
attendencetypelsit(){
         print("6666666666666666666666666666666666666");
                       myList.value = List.generate(classAttendenceListModal.value?.response.length ?? 0, (index) {
         return  "Select Type";
             });
             isloding.value=true;
}


///////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
  void saveStudentAttendance() async {
     
    print("%%%%%%%%%%%%%%%%%%%%%%%%%%");
    print(addAttendanceList);
    
    try {
       var currentTime  =formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd]);
       var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
      var body = json.encode({
      
"company_key":company_key,
"date":currentTime,
"flag":0,
"class_id":classId,
"section_id":sectionID,
"attendance":addAttendanceList

      });
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.savestudentattendanceUrl);
      var response = await http.post(urlapi, body: body);
      print("Add attendace responce ............................");
            print(response.body);
      if (response.statusCode == 200) {
        attendaceType = <String>[].obs;
        var tdata = jsonDecode(response.body);
      
         
        if (tdata["status"] == true) {
          Get.snackbar(tdata["message"],"",
          snackPosition: SnackPosition.BOTTOM
          );
            attendenceTypeModal.value=AttendenceTypeModal.fromJson(tdata);

        } else {
          

        } }else {
      }
    islodingSave.value=true;
    addAttendanceList=[];
    } catch (e) {
         islodingSave.value=true;
       print(e);
         
    }

  }
///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

 void studentList(selectSection) async {
  islodingstudentlist.value=false;
      classSectionModel.value?.response.forEach((element) {
     if(element.sectionName.toLowerCase()==selectSection.toString().toLowerCase()){
               sectionID=element.sectionId;
     }
        
      });
    try {
     if(classId.isNotEmpty&&sectionID.isNotEmpty){
       var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
     print("Student List.............for drop");
      var body = json.encode(
        {
"company_key":company_key,
"class_id":classId.toString(),
"section_id":sectionID.toString()
}
      );
      print(body);
      final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.getStudentListByClassSectionUrl);
      var response = await http.post(urlapi, body: body);
      print("class attendace responce");
            print(response.body);
      if (response.statusCode == 200) {
        studentListDrop = <String>[].obs;
        var tdata = jsonDecode(response.body);
        studentListModel.value=StudentListModel.fromJson(tdata);
        if (tdata["status"] == true) {
          
      islodingstudentlist.value=true;
             studentListModel.value?.response.forEach((element) {
              studentListDrop.add(element.studentName);
            
      });
// print('${ApiUrl.imagesUrl.toString()}${staffDetailModel.value?.response["image"]}');
        } else {
          islodingstudentlist.value=true;

        } }else {
      }

     }
    } catch (e) {
       print(e);
          islodingstudentlist.value=true;
      print("Something Error");
    }
  }









}

