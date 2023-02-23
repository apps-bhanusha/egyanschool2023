import 'dart:async';
import 'package:ecom_desgin/Widgets/DropDown_widget.dart';
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getclasstimetable_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/class_list_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_class_timetable_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
class TeacherClassTimeTable extends StatefulWidget {
  const TeacherClassTimeTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TeacherClassTimeTableState createState() => _TeacherClassTimeTableState();
}

class _TeacherClassTimeTableState extends State<TeacherClassTimeTable> {
  ClassCLSController classListController = Get.put(ClassCLSController());
  GetclassTimeTableController GetclassTimeTable = Get.put(
      GetclassTimeTableController());
  final TeacherclassTimeTableController teacherclassTimeTableController = Get.put(TeacherclassTimeTableController());
  var selectdata="Select Class";
  var selectdata1="Select Section";
  var dropdata;
  var dropdata1;
  var company_key;
  var id;
  var days;
  var current;


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
    classListController.classListapi();
    // teacherclassTimeTableController.TeacherclassTimeTableapi(selectdata,selectdata1);
    print("ddddddddddddddddddsddsdsddddsxx");

    super.initState();


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
      datalist = teacherclassTimeTableController
          .TeacherclassTimeTableControllerList[0]["response"]["result"][0]["timetable"];

Future.delayed(Duration(seconds: 2),(){

    setState(() {
  if(datalist.isEmpty){
              teacherclassTimeTableController.empty.value=false;
            }
      });
     });
    


    }
    else if(currentindex==1){

      Future.delayed(Duration(seconds: 2),(){
  setState(() {
        datalist=teacherclassTimeTableController
            .TeacherclassTimeTableControllerList[0]["response"]["result"][1]["timetable"];
            if(datalist.isEmpty){
              teacherclassTimeTableController.empty.value=false;
            }
      });
      });
    
    }
    else if(currentindex==2){
 
      Future.delayed(Duration(seconds: 2),(){
  setState(() {
        datalist=teacherclassTimeTableController
            .TeacherclassTimeTableControllerList[0]["response"]["result"][2]["timetable"];
            if(datalist.isEmpty){
              teacherclassTimeTableController.empty.value=false;
            }
      });
      });
    }
    else if(currentindex==3){

      Future.delayed(Duration(seconds: 2),(){
  setState(() {
        datalist=teacherclassTimeTableController
            .TeacherclassTimeTableControllerList[0]["response"]["result"][3]["timetable"];
            if(datalist.isEmpty){
              teacherclassTimeTableController.empty.value=false;
            }
      });
      });
    }
    else if(currentindex==4){
  
      Future.delayed(Duration(seconds: 2),(){
  setState(() {
        datalist=teacherclassTimeTableController
            .TeacherclassTimeTableControllerList[0]["response"]["result"][4]["timetable"];
            if(datalist.isEmpty){
              teacherclassTimeTableController.empty.value=false;
            }
      });
      });
    }
    else if(currentindex==5){
  
      Future.delayed(Duration(seconds: 2),(){
  setState(() {
        datalist=teacherclassTimeTableController
            .TeacherclassTimeTableControllerList[0]["response"]["result"][5]["timetable"];
            if(datalist.isEmpty){
              teacherclassTimeTableController.empty.value=false;
            }
      });
      });
    }
    else if(currentindex==6){
 
      Future.delayed(Duration(seconds: 2),(){
  setState(() {
        datalist=teacherclassTimeTableController
            .TeacherclassTimeTableControllerList[0]["response"]["result"][6]["timetable"];
            if(datalist.isEmpty){
              teacherclassTimeTableController.empty.value=false;
            }
      });
      });
    }
    else if(currentindex==7) {
      datalist = [];
      setState(() {
  if(datalist.isEmpty){
              teacherclassTimeTableController.empty.value=false;
            }
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
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Class Time Table',style: MyGoogeFont.mydmSans),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text:  TextSpan(
                        text: 'Class',
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                        ],
                      ),
                    ),
Obx(() => Container(
  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
  child:   DropDownWidget(droph: 0.050.sh, selectText:selectdata , item: classListController.classList, isloading: classListController.isloding.value, empaty: "", onChange: (value) {
        // print("You selected: $country");
                        selectdata = value!;
                        classListController
                            .classSectionapi(selectdata);
                        setState(() {});
  }, xpand: false,),
))

            // Obx(
            //       () => 

            //        Container(
            //       height: 0.050.sh,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.rectangle,
            //         color: Colors.white,
            //         border: Border.all(
            //           color: Colors.grey,

            //           width: 1.0,
            //         ),
            //       ),
            //       child: DropdownButton(
            //         // isExpanded: true,
            //         isDense: true,
            //         iconSize: 35,
            //         // alignment: Alignment.center,

            //         items: classListController
            //             .classList !=
            //             null
            //             ? classListController.classList
            //             .map((country) {
            //           return DropdownMenuItem(
            //             value: country,
            //             child: SizedBox(width: 110,height:20,
            //               child: Text(country,   style: GoogleFonts.dmSans(
            //                 fontStyle: FontStyle.normal,
            //                 fontSize: 14.sp,
            //                 fontWeight: FontWeight.normal,
            //                 color: Colors.black,
            //               ),),
            //             ),
            //           );
            //         }).toList()
            //             : [],
            //         hint: SizedBox(width: 110,height:20,
            //                 child: Padding(
            //                   padding: const EdgeInsets.only(left: 10),
            //                   child:classListController.isloding.value? SizedBox(
            //                     width: 110,height: 20,
            //                     child: Text(selectdata,   style: GoogleFonts.dmSans(
            //                       fontStyle: FontStyle.normal,
            //                       fontSize: 14.sp,
            //                       fontWeight: FontWeight.normal,
            //                       color: Colors.black,
            //                     ),),
            //                   ):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
            //                 ),
            //               ),
            //         onChanged: (dynamic country) {
            //           // print("You selected: $country");
            //           selectdata = country!;
            //           classListController
            //               .classSectionapi(selectdata);
            //           setState(() {});
            //         },
            //       ))
                  
            // ),
                  ],
                ),
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text:  TextSpan(
                    text: 'Section',
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '*',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                    ],
                  ),
                ),
Obx(() => Container(
   decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
  child:   DropDownWidget(droph: 0.050.sh, selectText:selectdata1 , item: classListController.classSection, isloading: classListController.isloding2.value, empaty: "", onChange: (value) {
        selectdata1 = value!;
                          teacherclassTimeTableController.TeacherclassTimeTableapi(selectdata,selectdata1);
                          setState(() {
                            currentdays();
                          teacherclassTimeTableController.loadingclassTimeTable.value=false;
                          });
  }, xpand: false,),
))
            // Container(
            //       height: 0.050.sh,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         shape: BoxShape.rectangle,
            //         border: Border.all(
            //           color: Colors.grey,
            //           width: 1.0,
            //         ),
            //       ),
            //       child:  Obx(
            //         () =>
                    
            //         DropdownButton(
            //           // isExpanded: true,
            //           isDense: true,
            //           iconSize: 35,
            //           // alignment: Alignment.center,
                     

            //           items: classListController
            //               .classSection !=
            //               null
            //               ? classListController.classSection
            //               .map((country) {
            //             return DropdownMenuItem(
            //               value: country,
            //               child: Padding(
            //                 padding:
            //                 const EdgeInsets.all(
            //                     8.0),
            //                 child: SizedBox(
            //                   width:110,
            //                   height: 20,
            //                   child: Text(country,   style: GoogleFonts.dmSans(
            //                     fontStyle: FontStyle.normal,
            //                     fontSize: 14.sp,
            //                     fontWeight: FontWeight.normal,
            //                     color: Colors.black,
            //                   ),),
            //                 ),
            //               ),
            //             );
            //           }).toList()
            //               : [],
            //           hint: SizedBox(width: 110,height:20,
            //               child: Padding(
            //                 padding: const EdgeInsets.only(left: 10),
            //                 child: classListController.isloding2.value? SizedBox(
            //                   width: 110,height: 20,
            //                   child: Text(selectdata1,   style: GoogleFonts.dmSans(
            //                     fontStyle: FontStyle.normal,
            //                     fontSize: 14.sp,
            //                     fontWeight: FontWeight.normal,
            //                     color: Colors.black,
            //                   ),),
            //                 ):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
            //               ),
            //             ),
            //           onChanged: (dynamic country) {
            //             // print("You selected: $country");
            //             selectdata1 = country!;
            //             teacherclassTimeTableController.TeacherclassTimeTableapi(selectdata,selectdata1);
            //             setState(() {
            //               currentdays();
            //             teacherclassTimeTableController.loadingclassTimeTable.value=false;
            //             });
            //           },
            //         )),
            // )
            ,],
            ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weekdays.length,
              itemBuilder: (BuildContext context, int index) {
                return
                GestureDetector(
                  onTap: () {
                    currentdata(index);
                    
                   
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
                child:  Obx(
                  () => teacherclassTimeTableController.loadingclassTimeTable.value? teacherclassTimeTableController.empty.value? ListView.builder(itemBuilder: (context, index) {
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
                                          
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                top: 0.033.sh,
                  
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
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
                    ): const Center(child: Text("No Record Found"),):const Center(child: CircularProgressIndicator(color: Colors.blue,),),
                )
              ),
            ),
          ),
        ],
      ),
      );

  }
}