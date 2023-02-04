import 'package:ecom_desgin/controller/parent_Student_List_Controller.dart';
import 'package:ecom_desgin/controller/student_login_update_controller.dart';
import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/model/parent_student_model.dart';
import 'package:ecom_desgin/model/student_login_model.dart';
import 'package:ecom_desgin/view/parent/parent_student_list_change.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/fees_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/school_id_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecom_desgin/view/dashboard/home.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ParentLoginController extends GetxController{
 var studentpro;
  final SchoolIdController all = Get.put(SchoolIdController());
  final StudentLoginUpdateController loginUpdateControllers =Get.put( StudentLoginUpdateController());
  final FeeController _feesController = Get.put(FeeController());
  Rxn<ParentStudentListModel> parentStudentListModel= Rxn<ParentStudentListModel>();
  Rxn<ParentStudentListController> parentStudentListController= Rxn<ParentStudentListController>();
  

  
  List  SchoolIdControllerList = [].obs;
  RxBool loadingdata =true.obs;
  RxBool parentLogin =  false.obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   
  }

// parentloginrecall(){
//  
// }

  void parentapi( username,password,context) async {
  var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
      "password":password,
      "company_key":company_key,
      "username":username,
      
    });

    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.parentLoginUrl);
    var response = await http.post(urlapi, body: body);
    print("parent login responce");
    if (response.statusCode == 200) {
        var pdata = jsonDecode(response.body); 
      if (pdata["status"] == true) {
        box.put("role_flag","P");
        box.put("username",username);
        box.put("password",password);
        box.put("student_login","Parent_login");
          await sessionManager.set("name", username);
          await sessionManager.set("parentlogin", "parentlogin");
          await sessionManager.set("passward", password);
        await sessionManager.set("teacherlogin", "studentlogin");
          final userIsStored =  await saveUser(jsonEncode(response.body));
        parentStudentListModel= Rxn<ParentStudentListModel>();
    
      parentStudentListModel.value=ParentStudentListModel.fromJson(pdata);
    //  loginUpdateControllers.studentLoginModelList.value = StudentLoginModel.fromJson(pdata);
       print("parent responce data ");
       print(parentStudentListModel.value?.parentInfo?["parent_id"]);
        box.put("parent_id",parentStudentListModel.value?.parentInfo?["parent_id"]);
      loadingdata.value=true;
      parentLogin.value=true;
           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
           ParentStudentList()), (Route<dynamic> route) => false);
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const ParentStudentList()));
      }

      else  {


         loadingdata.value=true;
        ScaffoldMessenger.of (context).showSnackBar(SnackBar(content: Text(pdata["message"], style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
        ),
        ),
          backgroundColor: Colors.white,
        ),
        );
      } }
    else {
    

       loadingdata.value=true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank Field Not Allowed",style: GoogleFonts.dmSans(fontStyle: FontStyle.normal,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),),
        backgroundColor:Colors.white,
      )
      );
      print("School ID Invailid");
    }
  }

  saveUser(String jsonEncode) {}
}




