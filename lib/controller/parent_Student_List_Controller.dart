import 'dart:convert';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/model/parent_s_List_model.dart';
import 'package:ecom_desgin/model/parent_s_List_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ParentStudentListController extends GetxController{
  var studentpro;
  Rxn<ParentSListModel> parentSListModel= Rxn<ParentSListModel>();
  

  
  List  SchoolIdControllerList = [].obs;
  RxBool loadingdata =false.obs;
  RxBool parentLogin =  false.obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   
  }

// parentloginrecall(){
//  
// }

  void parentStudentListMethod( pid) async {
  var box = Hive.box("schoolData");
    var company_key = box.get("company_key");
    var body = json.encode({
       "company_key":company_key,
      "parent_id":pid
    });

    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl+ApiUrl.parentProfile);
    var response = await http.post(urlapi, body: body);
    print("parent student list Respomnce");
    print(response.body);
    if (response.statusCode == 200) {
        parentSListModel= Rxn<ParentSListModel>();
      var pdata = jsonDecode(response.body);
      parentSListModel.value=ParentSListModel.fromJson(pdata);
    //  loginUpdateControllers.studentLoginModelList.value = StudentLoginModel.fromJson(pdata);
    
      
       print("parent list data ");
      if (pdata["status"] == true) {
      loadingdata.value=true;
      parentLogin.value=true;
      }

      else  {

      } }
    else {
      print("School ID Invailid");
    }
  }
}