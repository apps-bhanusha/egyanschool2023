
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getclasstimetable_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  GetclassTimeTableController GetclassTimeTable=Get.put(GetclassTimeTableController());
// final List<String> _options = ["Sun ", "Mon ", "Tue ","Wed ","Thu ","Fri ","Sat "];
// List<String> dataset1=["09.00-09.00 AM ","09.00 AM-09.00 AM ","09.00-09.00 AM ","09.00-09.00 AM","09.00-09.00 AM "];
// List<String> dataset2=["English","Hindi","Mathematics","Science","Social Studies"];
// List<String> dataset3=["101","102","103","104","105"];
List <dynamic>datalist=[];
// List<dynamic>  timeTable= [
//   {
//     "time":"09:00 AM 09:45 AM",
//     "subject":"hindi",
//     "RoomNo.":"101",
//   },
//    {
//     "time":"09:00 AM 09:45 AM",
//     "subject":"math",
//     "RoomNo.":"102",
//   },
//    {
//     "time":"12:05 PM 12:45 PM",
//     "subject":"english",
//     "RoomNo.":"103",
//   }
//
// ];
List<dynamic>  timeTable= [
  // {
  //   "starttime":"09:00 AM",
  //   "endtime":"09:45 AM",
  //   "subject":"hindi",
  //   "TeacherName":"Rahul Sharma",
  //   "RoomNo":"RoomNo 101",
  //
  // },
  // {
  //   "starttime":"10:00 AM",
  //   "endtime":"10:45 AM",
  //   "subject":"english",
  //   "TeacherName":"Mohan Sharma",
  //   "RoomNo":"RoomNo 102",
  //
  // },
  // {
  //   "starttime":"11:00 AM",
  //   "endtime":"11:45 AM",
  //   "subject":"math",
  //   "TeacherName":"Sahul Sharma",
  //   "RoomNo":"RoomNo 103",
  //
  // },

];

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
@override
  void initState() {
  print("4444444444444ss4444444333");
  print(datalist);
  print(timeTable);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor:AgentColor.appbarbackgroundColor,
        title: Text('Class Time Table',style: MyGoogeFont.mydmSans),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) {
              return <PopupMenuEntry<int>>[
                const PopupMenuItem(child: Text('0'), value: 0),
                const PopupMenuItem(child: Text('1'), value: 1),
              ];
            },
          ),
        ],
      ),
      body: Column( 
        children: [
          const SizedBox(height: 20,),
          SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekdays.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
             onTap: () {
              setState(() {
                for (int i = 0; i < cardColorList.length; i++) {
                  cardColorList[i][0] = inactiveCardColor;
                  cardColorList[i][1] = inactiveTextColor;
                }

                cardColorList[index][0] = activeCardColor;
                cardColorList[index][1] = activeTextColor;
              });
             if(index==0){
               datalist=GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][0]["timetable"];
             }
             else if(index==1){
               datalist=GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][1]["timetable"];
             }
             else if(index==2){
               datalist=GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][2]["timetable"];
             }
             else if(index==3){
               datalist=GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][3]["timetable"];
             }
             else if(index==4){
               datalist=GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][4]["timetable"];
             }
             else if(index==5){
               datalist=GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][5]["timetable"];
             }
             else if(index==6){
               datalist=GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][6]["timetable"];
             }
             else if(index==7){
               datalist=[];
             }
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
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
        Text("Time",style: TextStyle(color: Colors.white,fontSize: 18),),
        Text("Subject",style: TextStyle(color: Colors.white,fontSize: 18),),
        Text("Room No.",style: TextStyle(color: Colors.white,fontSize: 18),),
      ],),
    ),
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

                                                  Obx(
                                                        () =>Text(
                                                      GetclassTimeTable.loadingGetclassTimeTable.value?GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][0]["timetable"][index]["subject_name"]:CircularProgressIndicator(),
                                                      style: GoogleFonts.dmSans(
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 20.sp,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
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

                                                          Obx(
                                                                () =>SizedBox(
                                                                  width:0.32.sw,
                                                                  child: Text(
                                                              GetclassTimeTable.loadingGetclassTimeTable.value?GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][0]["timetable"][index]["teacher_name"]:CircularProgressIndicator(),
                                                              style: GoogleFonts.dmSans(
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 12.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black,
                                                              ),
                                                                    overflow: TextOverflow.ellipsis,
                                                            ),
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
                                                              Obx(
                                                                    () =>Text(
                                                                  GetclassTimeTable.loadingGetclassTimeTable.value?GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][0]["timetable"][index]["room_no"]:CircularProgressIndicator(),
                                                                  style: GoogleFonts.dmSans(
                                                                    fontStyle: FontStyle.normal,
                                                                    fontSize: 13.sp,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.black,
                                                                  ),
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
                                                              Obx(
                                                                    () =>Text(
                                                                  GetclassTimeTable.loadingGetclassTimeTable.value?GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][0]["timetable"][index]["time_from"]:CircularProgressIndicator(),
                                                                  style: GoogleFonts.dmSans(
                                                                    fontStyle: FontStyle.normal,
                                                                    fontSize: 15.sp,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                  ),
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
                                                              Obx(
                                                                    () =>Text(
                                                                  GetclassTimeTable.loadingGetclassTimeTable.value?GetclassTimeTable.GetclassTimeTableControllerList[0]["response"]["result"][0]["timetable"][index]["time_to"]:CircularProgressIndicator(),
                                                                  style: GoogleFonts.dmSans(
                                                                    fontStyle: FontStyle.normal,
                                                                    fontSize: 15.sp,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                  ),
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
      ),
    );
}
}
