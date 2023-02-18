
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/teacher_controller/class_list_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_homework_controller.dart';
import 'package:ecom_desgin/view/teacher_main/Teacher_home_work/evaluate_homework.dart';
import 'package:ecom_desgin/view/teacher_main/Teacher_home_work/teacher_add_homwork.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TeacherHomeWorkDiplay extends StatefulWidget {
  const TeacherHomeWorkDiplay({super.key});

  @override
  State<TeacherHomeWorkDiplay> createState() => _TeacherHomeWorkDiplayState();
}

class _TeacherHomeWorkDiplayState extends State<TeacherHomeWorkDiplay> {
  var id;
  var companyKey;

  TeacherHomeWorkController teacherHomeWorkController=Get.put(TeacherHomeWorkController());
  ClassCLSController classListController=Get.put(ClassCLSController());
  List<String> countries = ["1st", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
  List<String> countries1 = ["A", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
  bool value = false;
  @override
  void initState() {
    var box = Hive.box("schoolData");
    id=box.get("staff_id");

    teacherHomeWorkController.teacherhomeworkapi(id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
      backgroundColor: Theme.of(context).primaryColor,
          title: Text("Home Work",style: MyGoogeFont.mydmSans,),
        ),
       

        body:  Column(
          children: [
            const SizedBox(height: 15,),
            Center(
              child: Container(

                width: 0.95.sw,
                height: 0.14.sh,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey
                      )
                    ]
                ),
                child: Column(
                  children: [
                    Container(
                        height: 10,
                        width: 0.95.sw,
                        color:Colors.blue
                    ),
                    // const SizedBox( height: 10,),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    // DropdownButton(
                    // iconSize: 35,
                    //   alignment: Alignment.center,
                    //   value: countries[0],
                    //   items: countries.map((country){
                    //   return DropdownMenuItem(
                    //       child: Text(country),
                    //       value: country,
                    //   );
                    //   }).toList(),
                    //   onChanged: (country){
                    //  print("You selected: $country");
                    //   },
                    // ),
                    // DropdownButton(
                    //  iconSize: 35,
                    //    alignment: Alignment.center,
                    //   value: countries1[0],
                    //   items: countries1.map((country){
                    //   return DropdownMenuItem(
                    //       child: Text(country),
                    //       value: country,
                    //   );
                    //   }).toList(),
                    //   onChanged: (country){
                    //  print("You selected: $country");
                    //   },
                    // )
                    //           ],
                    //         ),
                    const SizedBox( height: 35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                        InkWell(
                          onTap: (){
                              Get.to(TeacherAddHomeWork());
      } ,
                          child: Container(
                            color: Colors.blue,
                            width: 100,
                            height: 30,
                            alignment: Alignment.center,
                            child: Text("Create",style: TextStyle(color: Colors.white),),
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Class",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                  // Text("Sec",style: GoogleFonts.dmSans(
                  //   fontStyle: FontStyle.normal,
                  //   fontSize: 13.sp,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.black,
                  // ),),
                  Text("Hwk Date",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                  Text("Sbn Date",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                  // Text("Evn Date",style: GoogleFonts.dmSans(
                  //   fontStyle: FontStyle.normal,
                  //   fontSize: 13.sp,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.black,
                  // ),),
                  Text("Subject",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                  Text("Action",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                ],
              ),
            ) ,
            const SizedBox( height: 10,),
            Obx(()=>teacherHomeWorkController.isloadingshomework.value?
            Expanded(
                 child: teacherHomeWorkController.teacherHomeWorkModel.value!=null?ListView.builder(
                   scrollDirection: Axis.vertical,
                   shrinkWrap:true,
                   // physics: const NeverScrollableScrollPhysics(),
                   itemBuilder: (context, index) {

                     return SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       physics: NeverScrollableScrollPhysics(),
                       child: Padding(
                         padding: const EdgeInsets.all(5.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,

                           children: [
                             SizedBox(width: 55,
                                 child: Text('${teacherHomeWorkController.teacherHomeWorkModel.value?.response[index].responseClass} ${teacherHomeWorkController.teacherHomeWorkModel.value?.response[index].section}', style: GoogleFonts.dmSans(
                                   fontStyle: FontStyle.normal,
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black,
                                 ),)),
                             SizedBox(width: 85,
                                 child: Text('${MyDateFormat.dateformatmethod1(teacherHomeWorkController.teacherHomeWorkModel.value?.response[index].homeworkDate.toString())}', style: GoogleFonts.dmSans(
                                   fontStyle: FontStyle.normal,
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black,
                                 ),)),
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: SizedBox(width: 90,
                                   child: Text('${MyDateFormat.dateformatmethod1(teacherHomeWorkController.teacherHomeWorkModel.value?.response[index].submitDate.toString())}', style: GoogleFonts.dmSans(
                                     fontStyle: FontStyle.normal,
                                     fontSize: 14.sp,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                   ),)),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: SizedBox(
                                   width:80, child: Text('${teacherHomeWorkController.teacherHomeWorkModel.value?.response[index].subjectName}', style: GoogleFonts.dmSans(
                                 fontStyle: FontStyle.normal,
                                 fontSize: 14.sp,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black,
                               ),)),
                             ),
                             Row(
                               children: [
                                 InkWell(onTap: () {

                                   teacherHomeWorkController
                                       .isdownloadinevaluation.value=false;
                                   Get.to(const EvaluatehomeWork(),arguments: ['${teacherHomeWorkController.teacherHomeWorkModel.value?.response[index].id}']);
                                 },
                                     child: Icon(Icons.menu)),
                                 SizedBox(
                                   width: 5,
                                 ),
                                 // Icon(Icons.close)
                               ],
                             ),

                           ],
                         ),
                       ),
                     );
                 },
                   itemCount: teacherHomeWorkController.teacherHomeWorkModel.value?.response.length??0,
                 ):const Center(child:Text("Record Is Not Found")),
               ):Center(child: CircularProgressIndicator()),
            ),
          ],
        )
    );
  }
}
