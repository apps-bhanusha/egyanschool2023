import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/teacher_by_Student_controller.dart';
import 'package:ecom_desgin/controller/teacher_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class TeacherReview extends StatefulWidget {
  const TeacherReview({Key? key}) : super(key: key);

  @override
  State<TeacherReview> createState() => _TeacherReviewState();
}

class _TeacherReviewState extends State<TeacherReview> {
  TeacherRatingController teacherRatings=Get.put(TeacherRatingController());
  GetTeacherByStudentController teacherbystudentController=Get.put(GetTeacherByStudentController());
   final StudentProfileController studentProfileController =  Get.put(StudentProfileController());
 bool  selectteacher=false;
  var company_key;
  var staff_id;
var comment;
var  rate;
var student_id;
var title;
var show;
  List datesetall=[];//api
 var rating = 0.0;
  var box = Hive.box("schoolData");
  int _index = 0 ;
  @override
  void initState() {
    student_id = box.get("student_id");
    company_key = box.get("company_key");
    teacherbystudentController.loadingGetTeacherByStudent.value=false;
    teacherbystudentController.GetTeacherByStudentapi(company_key, studentProfileController.studentProfileModel.value?.response.studentId);


    super.initState();
  }

  var commentController = TextEditingController();
  String _selectdrop = "Select Teacher";


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).primaryColor,
        title: Text('Teacher Reviews ',style: MyGoogeFont.mydmSans),
   
      ),
body: SingleChildScrollView(
  child:   Obx(
    () => teacherbystudentController.loadingGetTeacherByStudent.value? Column(
    
      children: [
  SizedBox(height: 0.050.sh,),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15).r,
          child: Container(
             height: 0.050.sh,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: DropdownButton<String>(
                iconSize: 35,
                isExpanded: true,
                isDense: false,
                underline: Container(), //empty line
                style:   GoogleFonts.dmSans(
                fontStyle: FontStyle.normal,
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              
              ),
                dropdownColor: Colors.white,
                iconEnabledColor: Colors.white,
                hint: Text(_selectdrop,
                    style: const TextStyle(color: Colors.black)),
                items: teacherbystudentController.dropdata.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.capitalize.toString(),
                      style:const TextStyle(color: Colors.blueAccent),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  print(newValue);
                  setState(() {
                    _selectdrop = newValue!;
                    dataset(newValue);
                  });
            
                },
            
              ),
            
            ),
          ),
        ),
  
        Column(
          children: [
    
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
    
                      text: const TextSpan(
    
                        text: 'Description',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.0,
    
                        ),
                      ),
                      child:  TextField(
                        controller:commentController,
                        // maxLength: 4,
  
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: show,
                        ),
                      ),
                    ),
                  ],
                )),
    
            Center(
            child: Column(
              children: [
                SmoothStarRating(
                
                  rating: selectteacher?rating:0.0,
                  size: 40,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: false,
                  spacing: 2.0,
                  onRatingChanged: (value) {
                    setState(() {
                      rating = value;
                      rate=rating;
                    });
    
    
    
                  },
                ),
              Text('${rating.toDouble()}'),
              ],
            ),
    
            ),
        Padding(
          padding:  const EdgeInsets.all(15),
          child: Center(
            child: InkWell(
              onTap:() {
            comment = commentController.text;
           if(selectteacher==true){
             if(comment.toString().isNotEmpty){
              teacherRatings.TeacherRatingapi(company_key,staff_id,comment,rate,studentProfileController.studentProfileModel.value?.response.studentId);
            }
            else{
              show="Please Enter comment";
  
            }
           }else{
             Get.snackbar(
        "Please Select Teacher"
        ,"",
        duration: 2.seconds, // it could be any reasonable time, but I set it lo-o-ong
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
           }
          },
    

              child:  Container(
                alignment: Alignment.center,
                width: 0.3.sw,
                height: 0.06.sh,
                // color: Colors.green,
                decoration:  BoxDecoration(
                  color:selectteacher? Colors.green:Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
    
    
      ],
    )
      ],
    ):Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 300),
            child: CircularProgressIndicator(color: Colors.blue),
          )
        ],
      ),
    ),
  ),
),
    );

  }
  void dataset(datset1){


  // dropdata1 =dataset;
   for (var i=0; i<teacherbystudentController.GetTeacherByStudentControllerList[0]["response"].length; i++){
     print(datset1);
 if(datset1==teacherbystudentController.GetTeacherByStudentControllerList[0]["response"][i]["staff_name"].toString()){
  selectteacher=true;
   // datesetall.add(teacherbystudentController.GetTeacherByStudentControllerList[0]["response"][i]["staff_name"]);
   print(teacherbystudentController.GetTeacherByStudentControllerList[0]["response"][i]["staff_id"]);
  staff_id=teacherbystudentController.GetTeacherByStudentControllerList[0]["response"][i]["staff_id"];
 }

   }
}
}
