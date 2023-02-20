import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getSylabusStatus_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_Controller/Teacher_syllebus_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_list_controller.dart';
import 'package:ecom_desgin/model/student/Teacher_syllebus_model.dart';
import 'package:ecom_desgin/view/syllabus/Syllebus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TeacherSyllebus extends StatefulWidget {
  const TeacherSyllebus({super.key});

  @override
  State<TeacherSyllebus> createState() => _TeacherSyllebusState();
}

class _TeacherSyllebusState extends State<TeacherSyllebus> {
   final ClassListController classListController = Get.put(ClassListController());
   final TeacherSyllebusController teacherSyllebusController = Get.put(TeacherSyllebusController());
String selectClass="select Class";
String selectSection="select Section";

@override
  void initState() {
    super.initState();
 teacherSyllebusController.isSearchbutton.value=false;
        classListController.classListapi();
  }



@override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Scaffold(

        appBar: AppBar(
         backgroundColor: Theme.of(context).primaryColor,
          title: Text('Syllabus Status',style: MyGoogeFont.mydmSans),

        ),
        body: Column(
          children: [

             Container(
                 decoration: const BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                       blurRadius: 5.0,
                                       color: Color.fromARGB(255, 78, 78, 78),
                                     ),
                                     BoxShadow(
                                       blurRadius: 5.0,
                                       color: Color.fromARGB(255, 235, 235, 235),
                                     )
                                   ],
                                  //  borderRadius: BorderRadius.circular(20),
                                   gradient: LinearGradient(colors: [
                                     Color.fromARGB(255, 246, 243, 243),
                                     Color.fromARGB(255, 217, 248, 233),
                                        
                                   ])),
              height: 0.11.sh,
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Container(
                     height: 0.050.sh,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                    child: Obx(() =>   DropdownButton(
                      underline: const SizedBox(),
                     iconSize: 35,
                       alignment: Alignment.center,
                                   hint:  classListController.isloding.value? SizedBox( width: 110,height:20,child: Text(selectClass)):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
                       items:  classListController.classList.map((country){
                       return DropdownMenuItem( 
                           value: country, 
                           child: Text(country),
                       );
                       }).toList(),
                       onChanged: (dynamic country){
                         selectClass=country;
                       
                        classListController.classSectionapi(country);
                        setState(() {
                          
                        });
                               
                       },
                     ),),
                  ),
                      Container(
                         height: 0.050.sh,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                        child: Obx(() =>   DropdownButton(
                          underline: const SizedBox(),
                                         iconSize: 35,
                                           alignment: Alignment.center,
                                       hint:  classListController.isloding2.value ?SizedBox(width: 110,height:20,child: Text(selectSection)):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
                                           items: classListController.classSection.map((country){
                                           return DropdownMenuItem( 
                           value: country, 
                           child: Text(country),
                                           );
                                           }).toList(),
                                           onChanged: (dynamic country){
                                         selectSection=country;
                                         setState(() {
                                        
                                           teacherSyllebusController.loadingTeacherSylabusStatus.value=false;
                                           teacherSyllebusController.classSectiontSyllebusapi(country);
                                         });
                                           },
                                         )),
                      ),
                  ],
                ),
             ),
             const Divider( color: Colors.blue,),
            Expanded(
              child: Obx(()=>
                teacherSyllebusController.loadingTeacherSylabusStatus.value?teacherSyllebusController.isSearchbutton.value?teacherSyllebusController.teacherSyllebusModal.value!.response.subjectsData.isNotEmpty?Container(
                 
                  color: const Color.fromARGB(255, 233, 233, 233),
                  child: GridView(
                    shrinkWrap: true,
                    
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300.0,
                        crossAxisSpacing: 3.0,
                        childAspectRatio: 1,
                        
                      ),
                    children: [
                  //  \   for (int i = 0; i <GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"].length-1; i++)
                    for (int i = 0; i <teacherSyllebusController.teacherSyllebusModal.value!.response.subjectsData.length; i++)
                     Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: InkWell(
                             // onTap: () => Get.toNamed(RoutesName.syllabus),
                             child: Container(
                               height: 0.35.sh,
                               // width: 0.50.sw,
                               decoration: BoxDecoration(
                                   boxShadow: const [
                                     BoxShadow(
                                       blurRadius: 5.0,
                                       color: Color.fromARGB(255, 78, 78, 78),
                                     ),
                                     BoxShadow(
                                       blurRadius: 5.0,
                                       color: Color.fromARGB(255, 235, 235, 235),
                                     )
                                   ],
                                   borderRadius: BorderRadius.circular(20),
                                   gradient: const LinearGradient(colors: [
                                     Color.fromARGB(255, 246, 243, 243),
                                     Color.fromARGB(255, 217, 248, 233),
                                        
                                   ])),
                               child: Column(
                                        
                                 children: [
                                  Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                        
                                        
                                         Column(
                                           children: [
                                             Row(
                                               children: [
                                             Padding(
                                                     padding: const EdgeInsets.only(right: 10).r,
                                                     child: Image.asset(
                                                       "assets/images/book.png",
                                                       width: 0.030.sw,
                                                       height: 0.030.sh,
                                                     ),
                                                   ),
                                                 Obx(
                                                         () =>
                                                    
                                                     Text(
                                                      teacherSyllebusController.teacherSyllebusModal.value!.response.subjectsData[i].lebel,
                                                       style: GoogleFonts.dmSans(
                                                         fontStyle: FontStyle.normal,
                                                         fontSize: 15.sp,
                                                         fontWeight: FontWeight.bold,
                                                         color: Colors.black,
                                                       ),
                                                     )
                                                 ),
                                               ],
                                             ),
                                             CircularPercentIndicator(
                                               radius: 50.0,
                                               lineWidth: 0.065.sw,
                                        
                                               reverse: true,
                                               // backgroundColor: Colors.grey,
                                               percent:(teacherSyllebusController.teacherSyllebusModal.value!.response.subjectsData[i].complete) / 100,
                                               animateFromLastPercent: true,
                                               circularStrokeCap: CircularStrokeCap.round,
                                               addAutomaticKeepAlive: true,
                                               animation: true,
                                               animationDuration: 1000,
                                        
                                               center: Container(
                                        
                                        
                                                 decoration: BoxDecoration(
                                                   color: Colors.white,
                                                   shape: BoxShape.circle,
                                                   boxShadow: [
                                                     BoxShadow(
                                                       color: Colors.grey.withOpacity(0.5),
                                                       spreadRadius: 5,
                                                       blurRadius: 7,
                                                       offset: const Offset(0, 1), // changes position of shadow
                                                     ),
                                                   ],
                                                 ),
                                                 child: CircleAvatar(
                                                   radius: 30,
                                                   backgroundColor: Colors.white,
                                        
                                                   child:
                                        
                                                   Obx(
                                                           () =>
                                                    
                                                       Text('${teacherSyllebusController.teacherSyllebusModal.value!.response.subjectsData[i].complete}%',
                                                         // GetSylabusStatusList[0]["$i"]["complete"].toString(),
                                                         style: GoogleFonts.dmSans(
                                                           fontStyle: FontStyle.normal,
                                                           fontSize: 15.sp,
                                                           fontWeight: FontWeight.bold,
                                                           color: Colors.black,
                                                         ),
                                                       )
                                                   ),
                                                 ),
                                               ),
                                               progressColor: Colors.blue,
                                        
                                             ),
                                        
                                        
                                             Row(
                                        
                                               children: [
                                                 Image.asset("assets/images/teacher.png",width: 20,height: 20,),
                                                 Padding(
                                                   padding: const EdgeInsets.only(left: 5.0).r,
                                                   child:  Obx(
                                                           () =>
                                                       
                                                       Text(teacherSyllebusController.teacherSyllebusModal.value!.response.subjectsData[i].teacherName,
                                                         // GetSylabusStatusList[0]["$i"]["complete"].toString(),
                                                         style: GoogleFonts.dmSans(
                                                           fontStyle: FontStyle.normal,
                                                           fontSize: 12.sp,
                                                           fontWeight: FontWeight.normal,
                                                           color: Colors.black,
                                        
                                                         ),
                                        
                                                         overflow: TextOverflow.ellipsis,
                                                       )
                                                   ),
                                                 )
                                               ],
                                             )
                                           ],
                                         ),
                                        
                                       ],
                                     ),
                                   ),
                                        
                                 ],
                               ),
                             ),
                           ),
                         )
                    
                        // ListView.builder(
                          
                        //   itemCount: teacherSyllebusController.teacherSyllebusModal.value?.response.subjectsData.length??0,
                        //   shrinkWrap: true,
                        //   itemBuilder: (context, i) {
                        //   return  
                        // },)
                    
                    ],
                  ),
                ):Center(child: Text("No Record Found")):SizedBox():Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),

      onRefresh: () async {
        const AlwaysScrollableScrollPhysics();
        setState(() {
          
        });
      },
    );
  }
}
