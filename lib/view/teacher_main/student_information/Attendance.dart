
import 'dart:convert';

import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_list_controller.dart';
import 'package:ecom_desgin/model/student/student_calendar_List_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class AttandanceAdd extends StatefulWidget {
  const AttandanceAdd({super.key});

  @override
  State<AttandanceAdd> createState() => _AttandanceAddState();
}

class _AttandanceAddState extends State<AttandanceAdd> {

   final ClassListController classListController = Get.put(ClassListController());
   
 List<String> countries = ["1st", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
List<String> countries1 = ["A", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
 bool value = false;
String selectDrop="Select Class";
String selectSection="Select Section";
String selectType="Select Type";
String selectaction="Select Type";
String selectStudent="Select Student";
int dropindex=0;
bool getyear=false;
bool isFdrop=false;
bool isSdrop=false;
bool isTdrop=false;
bool isCalendarActivet=true;
bool isCalendarloading=true;

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

   List <dynamic> AttendanceControllerList = [];
  List<dynamic> presentDates = [

  ];
 Rxn<StudentcalenderlistModal> studentcalenderlistModal = Rxn<StudentcalenderlistModal>();



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    classListController.classListapi();
  }


    void attendanceapi(student_id) async {
      var box = Hive.box("schoolData");
      var company_key = box.get("company_key");
    var body = json.encode({
      "company_key": company_key,
      "student_id": student_id,

    });
    print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.monthlyattendenceUrl);
    var response = await http.post(urlapi, body: body);
    print("student responce data ");
    print(response.body);
    if (response.statusCode == 200) {
      var sdata = jsonDecode(response.body);
        studentcalenderlistModal.value=StudentcalenderlistModal.fromJson(sdata);

      AttendanceControllerList = [];
      AttendanceControllerList.add(sdata);
      print(AttendanceControllerList);

      if (sdata["status"] == true) {
 
        getyear=true;
        var box = Hive.box("schoolData");

      }
      else {
        print("invalid cccid");
      }
      addcalendardata();

    }
    else {
      print("School ID Invailid");
    }
  }

  void addcalendardata(){
              
   
    studentcalenderlistModal.value?.response.forEach((element) {
      print(element.title.toString());
      print(element.date);
        _markedDateMap.add(
        DateFormat("yyyy-MM-dd").parse("${element.date}"),

        Event(
          date:DateFormat("yyyy-MM-dd").parse("${element.date}"),
          title: "event 5",
          icon: _presentIcon(
              DateFormat("yyyy-MM-dd").parse("${element.date}").day.toString(),"${element.title}"
            // presentDates[i].date.day.toString(),
          ),
        ),
      );
       
    });
setState(() {
  isCalendarloading=true;
  classListController.isSearch.value=true;
});
    // for(var i=0; i<AttendanceControllerList[0]["response"].length; i++){

    //   presentDates.add(
    //       {
    //         "date": AttendanceControllerList[0]["response"][i]["date"],
    //         "title": AttendanceControllerList[0]["response"][i]["title"]
    //       }

    //   );
    // }
    // setState(() {
    //   markedDatedMap();
    // });
  }

  // void markedDatedMap(){
  //   for (int i = 0; i <presentDates.length; i++) {

  //     _markedDateMap.add(
  //       DateFormat("yyyy-MM-dd").parse(presentDates[i]["date"]),

  //       Event(
  //         date:DateFormat("yyyy-MM-dd").parse(presentDates[i]["date"]),
  //         title: "event 5",
  //         icon: _presentIcon(
  //             DateFormat("yyyy-MM-dd").parse(presentDates[i]["date"]).day.toString(),presentDates[i]["title"]
  //           // presentDates[i].date.day.toString(),
  //         ),
  //       ),
  //     );
  //   }
  //   setState(() {
  //     print(_markedDateMap);
  //   });
  // }
 Widget _presentIcon(String day,String title) => ClipRect(
     
    child: title!=""?Container(
      height: 0.40.sh,
      width: 0.40.sw,
      alignment: Alignment.center,
      color: title=="Present"?Colors.green:title=="Holiday"?Colors.grey:title=="Late"?Colors.yellow:title=="Half Day"?Colors.orange:Color.fromARGB(255, 206, 204, 204),
      child: Text(
        day,
        style: const TextStyle(
          color: Colors.white,

        ),
      ),
    ):Container(),
  );




  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
       backgroundColor: Theme.of(context).primaryColor,
        title:  Text("Attandance",style: MyGoogeFont.mydmSans,),),

        
      body:  Column(
        children: [
          const SizedBox(height: 15,),
        Center(
          child: Container(
      
       width: 0.95.sw,
       height: 0.23.sh,
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
              const SizedBox( height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
     Container( height: 0.050.sh,
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
         hint: classListController.isloding.value? SizedBox(width: 110,height:20,child: Text(selectDrop)):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
          items: classListController.classList.map((country){
          return DropdownMenuItem( 
              value: country, 
              child: Text(country),
          );
          }).toList(),
          onChanged: (dynamic country){
            selectDrop=country;
          
           classListController.classSectionapi(country);
           setState(() {
              isFdrop=true;
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
               iconSize: 35,
               underline: const SizedBox(),
         
                 alignment: Alignment.center,
             hint:  classListController.isloding2.value ?SizedBox(width: 110,height:20, child: Text(selectSection)):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,))),),
                 items: classListController.classSection.map((country){
                 return DropdownMenuItem( 
              value: country, 
              child: Text(country),
                 );
                 }).toList(),
                 onChanged: (dynamic country){
               selectSection=country;
               setState(() {
                 isSdrop=true;
                 classListController.islodingstudentlist.value=false;
                 classListController.studentList(country);
               });
                 },
               )),
         ),
                ],
              ),
              const SizedBox(height: 10,),
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
         hint:  classListController.islodingstudentlist.value ?SizedBox(width: 110,height:20, child: Text(selectStudent)):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
          items: classListController.studentListDrop.map((country){
          return DropdownMenuItem( 
              value: country, 
              child: Text(country),
          );
          }).toList(),
          onChanged: (dynamic country){
        selectStudent=country;
        setState(() {
          isTdrop=true;
        });
          },
        )),
     ),
              const SizedBox( height: 20,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Search Criterial ",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
              InkWell(
                  onTap: (){
                     classListController.isSearch.value=true;
                   if(isFdrop==true&&isSdrop==true&&isTdrop==true){
                   setState(() {
                    isCalendarloading=false;
                   classListController.studentListModel.value?.response.forEach((element) {
                     if(element.studentName.toString().toLowerCase()==selectStudent.toString().toLowerCase()){
                      attendanceapi(element.studentId);
                      print(element.studentName);
                     }
                   });
                     isTdrop=false;
                     isCalendarActivet=false;
                   });
                   
                   }else{
                   isCalendarActivet=true;
                   classListController.isloding3.value=false;
                   classListController.isSearch.value=false;
                   classListController.classAttendenceListapi(selectSection);
                     setState(() {
                     isTdrop==false;
                   });
                   }
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 30,
                    alignment: Alignment.center,
                  child: Obx(() => classListController.isSearch.value? const Text("Search",style: TextStyle(color: Colors.white),):const Center(child: SizedBox(width: 20,height: 20, child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,)),)),
                  ),
                )
            ],
           )
      
            ],
          ),
          ),
        ),
           const SizedBox(height: 15,),
     isCalendarActivet?    Container(
        color: const Color.fromARGB(255, 255, 241, 117),
        width: double.infinity,
        height: 0.11.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                              value: this.value,
                              onChanged: ( value) {
                                setState(() {
                                  this.value = value!;
                                });
                              },
                            ),
                            const Text("Holiday",style: TextStyle(fontSize: 18),)
              ],
            ),
           const SizedBox(height:3 ,),
      
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                   Text("Roll No.",style: TextStyle(fontSize: 18),),
                   Text("Student Name",style: TextStyle(fontSize: 18),),
                   Text("Attandance",style: TextStyle(fontSize: 18),),
                ],
              ),
            ) 
          ],
        ),
         ):const SizedBox(),
           const SizedBox(height: 15,),
         
      
        Expanded(
          child:
        isCalendarActivet? SingleChildScrollView(
            child: Obx(
              () =>  SizedBox(
               height: 0.44.sh,
                child: classListController.isloding3.value? classListController.listisempty.value? const Center(child: Text("Record not available!!"),):ListView.builder(
                  shrinkWrap: true,
                  itemCount: classListController.classAttendenceListModal.value?.response.length??0 ,
                  itemBuilder:(context, index) {
             
                  return   Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 0.97.sw,
                        height: 0.055.sh,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 247, 241, 241),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3
                        )
                      ]
                      ),
                      child:    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               SizedBox(
                              width: 100,
                                child: Text("${classListController.classAttendenceListModal.value?.response[index].rollNo}",style: TextStyle(fontSize: 15),)),
                               
                               SizedBox(
                                width: 100,
                                 child: Center(child: Text("${classListController.classAttendenceListModal.value?.response[index].firstname}",style: TextStyle(fontSize: 15),)),
                               ),
                             
                              SizedBox(
                                width: 150,
                                child: Obx(() =>   Center(
                                  child: DropdownButton(
                                    iconSize: 35,
                                      alignment: Alignment.center,
                                  hint:  classListController.isloding2.value ?  SizedBox(width: 90, child: Text(dropindex==index?selectType:classListController.myList[index])):const SizedBox(width: 20,height: 20, child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,),),
                                      items: classListController.attendaceType.map((country){
                                      return DropdownMenuItem( 
                                          value: country, 
                                          child: Text(country),
                                      );
                                      }).toList(),
                                      onChanged: (dynamic country){
                                   selectType =country;
                                    setState(() {
                                      dropindex=index;
                                      selectaction=country;
                                      print(index);
                                      classListController.myList[index]=country;
                                   classListController.addAttendancelist(selectType, "${classListController.classAttendenceListModal.value?.response[index].studentSessionId}");
                                    });
                                      },
                                    ),
                                )),
                              )
                            ],
                          ) ,
                      ),
                    );
                },):const Center(child: CircularProgressIndicator(color: Colors.blue,),)
              ),
            )
              
              ,
          )
          : isCalendarloading ?Column(
            children: [
              Container(
                         margin: const EdgeInsets.symmetric(horizontal: 16.0).r,
                        child: CalendarCarousel<Event>(
                          height: 0.56.sh,
                          // height: cHeight * 0.54,
                          weekendTextStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          todayButtonColor: Colors.blue,
                          markedDatesMap: _markedDateMap,
                          daysHaveCircularBorder: false,
                          markedDateShowIcon: true,
                          showOnlyCurrentMonthDate: true,
                          markedDateIconMaxShown: 1,
                          // markedDateMoreShowTotal: true,
                          // minSelectedDate:DateFormat("yyyy-MM-dd").parse( AttendanceControllerList[0]["year_date"]["start_date"]),
                          // maxSelectedDate:DateFormat("yyyy-MM-dd").parse(AttendanceControllerList[0]["year_date"]["end_date"]),
                          thisMonthDayBorderColor: const Color.fromARGB(255, 206, 204, 204),// null for not showing hidden events indicator
                          markedDateIconBuilder: (event) {
                            return event.icon;
                          },
                        ),
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.red),
                          Text("Absent",style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize:12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.green),

                          Text("Present",style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize:12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.yellow),
                          Text("Late",style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize:12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.orange),
                          Text("HalfDay",style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize:12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.grey),
                          Text("Holiday",
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize:12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),),
                        ],
                      ),
            ],
          ):Center(child: CircularProgressIndicator(),),
        ),
     isCalendarActivet?   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Press Save After Checking attandane  "),
                InkWell(
                    onTap: (){
                      
                    classListController.saveStudentAttendance();
                    },
                    child: Container(
                      color: Colors.blue,
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                    child: Obx(() => classListController.islodingSave.value? Text("Save",style: TextStyle(color: Colors.white),):Center(child: SizedBox(width: 20,height: 20, child: CircularProgressIndicator(strokeWidth: 2,color: Colors.white,)),))
                    ),
                  )
            ],
          ),
        ):SizedBox()
        ],
      )
    );
  }
}