
import 'package:ecom_desgin/controller/teacher_controller/class_list_controller.dart';
import 'package:ecom_desgin/view/teacher_main/home_work/evaluate_homework.dart';
import 'package:ecom_desgin/view/teacher_main/home_work/teacher_add_homwork.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeWork extends StatefulWidget {
  const HomeWork({super.key});

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {

  ClassListController classListController=Get.put(ClassListController());
  List<String> countries = ["1st", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
  List<String> countries1 = ["A", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blue,
          title: Text("Home Work", style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),),
        ),
        //       Padding(
        //   padding: const EdgeInsets.only(top: 0, right: 15, left: 0),

        //   /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
        //   /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
        //   child: AnimSearchBar(
        //     // color: Colors.white,
        //     // searchIconColor: Colors.white,
        //     width: 350,
        //   helpText: "Search Student",
        //     textController: textController,
        //     onSuffixTap: () {
        //       setState(() {
        //         textController.clear();
        //       });
        //     }, onSubmitted: (String search ) {
        //        print(search);
        //     },

        //   ),
        // ),

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
                        const Text("Content List ",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
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
                  Text("Cls",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                  Text("Sec",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
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
                  Text("Evn Date",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                  Text("Sub Group",style: GoogleFonts.dmSans(
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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  SizedBox( width: 90, child: Text("Text Other",style: GoogleFonts.dmSans(
                fontStyle: FontStyle.normal,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),)),
                  SizedBox( width: 60,child: Text("syllabus",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),)),
                  SizedBox(width: 90,child: Text("30-01-2023",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),)),
                  SizedBox(width: 40,child: Text("1st",style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),)),
                  Row(
                    children: [
                      InkWell(onTap:(){
                        Get.to(EvaluatehomeWork());
                      },
                          child: Icon(Icons.menu)),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(Icons.close)
                    ],
                  ),
                ],
              ),
            ) ,
          ],
        )
    );
  }
}