
import 'dart:async';

import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getclasstimetable_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_time_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
class TeacherTimeTable extends StatefulWidget {
  const TeacherTimeTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TeacherTimeTableState createState() => _TeacherTimeTableState();
}

class _TeacherTimeTableState extends State<TeacherTimeTable> {
  TeacherTimeTableController teacherTimeTableController = Get.put(
      TeacherTimeTableController());


  var company_key;
  var id;
  var days;
  var current;
  var classId;
  var sectionId;
 var teacherid;

  List <dynamic>datalist = [];


  List<dynamic> timeTable = [];

  List<String> weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

  Color activeCardColor = Colors.white;
  Color inactiveCardColor = Colors.black26;

  Color activeTextColor = Colors.black;
  Color inactiveTextColor = Colors.white;

  List<List<Color>> cardColorList = [
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
  ];
  var box = Hive.box("schoolData");

  @override
  void initState() {
    print("ddddddddddddddddddssxx");
    DateTime date = DateTime.now();
    var day = DateFormat('EEEE').format(date);
    print(day.substring(0, 3).toUpperCase());
    current = day.substring(0, 3).toUpperCase();
    company_key = box.get("company_key");
    teacherid = box.get("staff_id");
    teacherTimeTableController.TeacherTimeTableapi(company_key, teacherid);
    print("ddddddddddddddddddsddsdsddddsxx");

    super.initState();
    currentdays();

  }

  void currentdata(currentindex) {
    setState(() {
      for (int i = 0; i < cardColorList.length; i++) {
        cardColorList[i][0] = inactiveCardColor;
        cardColorList[i][1] = inactiveTextColor;
      }

      cardColorList[currentindex][0] = activeCardColor;
      cardColorList[currentindex][1] = activeTextColor;
    });

    if (currentindex == 0) {
      datalist = teacherTimeTableController.TeacherTimeTableControllerList[0]["response"]["result"][0]["timetable"];

      setState(() {

      });


    }
    else if(currentindex==1){

      setState(() {
        datalist=teacherTimeTableController.TeacherTimeTableControllerList[0]["response"]["result"][1]["timetable"];

      });

    }
    else if(currentindex==2){
      setState(() {
        datalist=teacherTimeTableController.TeacherTimeTableControllerList[0]["response"]["result"][2]["timetable"];

      });
    }
    else if(currentindex==3){
      setState(() {
        datalist=teacherTimeTableController.TeacherTimeTableControllerList[0]["response"]["result"][3]["timetable"];

      });
    }
    else if(currentindex==4){
      setState(() {
        datalist=teacherTimeTableController.TeacherTimeTableControllerList[0]["response"]["result"][4]["timetable"];

      });
    }
    else if(currentindex==5){
      setState(() {
        datalist=teacherTimeTableController.TeacherTimeTableControllerList[0]["response"]["result"][5]["timetable"];

      });
    }
    else if(currentindex==6){
      setState(() {
        datalist=teacherTimeTableController.TeacherTimeTableControllerList[0]["response"]["result"][6]["timetable"];

      });
    }
    else if(currentindex==7) {
      datalist = [];
      setState(() {

      });
    }

  }
  void currentdays(){

    var index=0;

    for (var i=0; i<weekdays.length; i++) {
      print(weekdays[i]);
      print(weekdays);
      if(current == weekdays[i]){
        print("sss");
        index=i;

        print(index);

      }
      final timer = Timer(
        const Duration(seconds: 3),
            () {
          currentdata(index);
        },

      );
      print(timer);

    }
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor:AgentColor.appbarbackgroundColor,
          title: Text('Teacher Time Table',style: MyGoogeFont.mydmSans),
        ),
        body:Obx(()=>teacherTimeTableController.TeacherTimeTableControllerList.isNotEmpty?
      teacherTimeTableController.loadingTimeTable.value  ? Column(
          children: [
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weekdays.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(()=> teacherTimeTableController.loadingTimeTable.value?
                  GestureDetector(
                    onTap: () {
                      currentdata(index);
                      teacherTimeTableController.loadingTimeTable.value = true;
                      setState(() {

                      });
                    },

                    child: Container(
                      margin: const EdgeInsets.only(left: 4,),
                      height: 60,
                      width: 50,
                      decoration: BoxDecoration(
                          color: cardColorList[index][0],
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 15,),
                          Text(weekdays[index], style: TextStyle(fontSize: 12, color: cardColorList[index][1], fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ):const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: const [
            //     Text("Time",style: TextStyle(color: Colors.white,fontSize: 18),),
            //     Text("Subject",style: TextStyle(color: Colors.white,fontSize: 18),),
            //     Text("Room No.",style: TextStyle(color: Colors.white,fontSize: 18),),
            //   ],),
            // ),
            SizedBox(height: 0.050.sh,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    boxShadow: [BoxShadow(blurRadius: 10.0)]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30).r,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 0.15.sh,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: SizedBox.expand(
                          child: Column(
                            children: [
                              // for (int i = 0; i <GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][0]["timetable"].length; i++)

                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Center(
                                  child: InkWell(
                                    child: Card(
                                      elevation: 10,
                                      child: Container(
                                        width: 0.99.sw,
                                        height: 0.13.sh,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0xffE3F2FB),
                                        ),
                                        child: Stack(

                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 19,top: 0
                                              ),
                                              child: Row(
                                                children: [

                                                  Text(
                                                    datalist[index]["subject_name"]??"",
                                                    style: GoogleFonts.dmSans(
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 20.sp,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),

                                                  Spacer(),
                                                  // Padding(
                                                  //   padding:  EdgeInsets.only(right: 14,bottom: 15),
                                                  //   child: Text(
                                                  //     "Room No. 12",
                                                  //
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 0.033.sh,

                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: 5,
                                                ).r,
                                                child: Row(
                                                  children: [
                                                    Image.asset("assets/images/teacher.png",width: 0.050.sw,),
                                                    SizedBox(
                                                      width: 0.01.sw,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 10).r,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [

                                                          SizedBox(
                                                            width:0.32.sw,
                                                            child: Text(
                                                              datalist[index]["teacher_name"]??"",

                                                              style: GoogleFonts.dmSans(
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.black,
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),


                                                          Row(
                                                            children: [
                                                              Text(
                                                                "RoomNo",
                                                                style: GoogleFonts.dmSans(
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 13.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                              SizedBox(width: 0.010.sw,),
                                                              Text( datalist[index]["room_no"]??"",

                                                                style: GoogleFonts.dmSans(
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 13.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black,
                                                                ),
                                                              ),

                                                            ],
                                                          ),


                                                        ],
                                                      ),
                                                    ),
                                                    // const Icon(Icons.timelapse),
                                                    SizedBox(
                                                      width: 0.045.sw,
                                                    ),
                                                    Container(
                                                      width: 0.52.sw,
                                                      height: 0.08.sh,
                                                      decoration: BoxDecoration(
                                                          color: const Color(0xff828181),
                                                          borderRadius:
                                                          BorderRadius.circular(10)),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.center,
                                                            children: [
                                                              Text("Start Time",
                                                                style: GoogleFonts.dmSans(
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                ),),
                                                              Container(
                                                                color: Colors.black,
                                                                width: 0.24.sw,
                                                                height: 0.001.sh,
                                                              ),
                                                              Text(datalist[index]["time_from"]??"",

                                                                style: GoogleFonts.dmSans(
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                          Container(
                                                            width:0.002.sw,
                                                            height: 0.1.sh,
                                                            color: Colors.white,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.center,
                                                            children: [
                                                              Text("End Time",
                                                                style: GoogleFonts.dmSans(
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                ),),
                                                              Container(
                                                                color: Colors.black,
                                                                width: 0.24.sw,
                                                                height: 0.001.sh,
                                                              ),
                                                              Text(datalist[index]["time_to"]??"",

                                                                style: GoogleFonts.dmSans(
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      //                 Container(
                      //
                      //                   decoration: BoxDecoration(
                      //                     color:Color.fromARGB(255, 74, 150, 173),
                      //                     borderRadius: BorderRadius.circular(30)
                      //                   ),
                      //                   width: 0.05.sw,
                      //                   height: 0.05.sh,
                      //                   child: Row(
                      //
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children:  [
                      //   Text(datalist[index]["time"],style: TextStyle(color: Colors.white,fontSize: 18),),
                      //   Text(datalist[index]["subject"],style: TextStyle(color: Colors.white,fontSize: 18),),
                      //   Text(datalist[index]["RoomNo."],style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 18),),
                      // ],),
                      //                 ),
                    );
                  },
                    itemCount: datalist.length,
                    // GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][0]["timetable"].length,
                  ),
                ),
              ),
            ),
          ],
        ):Center(child: Text("", style: GoogleFonts.dmSans(
          fontStyle: FontStyle.normal,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),)):Center(child: CircularProgressIndicator(color: Colors.white,)),
        ),
      ),
      onRefresh: () async {
        teacherTimeTableController.TeacherTimeTableapi(company_key,teacherid);
      },
    );
  }
}