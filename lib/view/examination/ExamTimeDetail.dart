import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getexamsSchedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
class ExamTimeDetail extends StatefulWidget {
  const ExamTimeDetail({super.key});

  @override
  State<ExamTimeDetail> createState() => _ExamTimeDetailState();
}

class _ExamTimeDetailState extends State<ExamTimeDetail> {
  late DateTime  examtimes;
 late DateTime examtimedate;
var  starttime;
  GetexamsScheduleController getexamview=Get.put(GetexamsScheduleController());
  @override
  void initState() {

    super.initState();
    for (int i = 0; i < getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"].length; i++) {
      examtimes = DateFormat("HH:mm:ss").parse(getexamview
          .GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["time_from"]
          .toString());
      examtimedate = examtimes.add(Duration(hours: int.parse(getexamview
          .GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["duration"]
          .toString())));
      print(
          "rbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbxxxxxxxxxxxvvvvvvvvvvvvvvvvvvvnnnnnnnnnnnnaaaaaaaaaaaan");
      print(examtimedate);

      starttime = formatDate(examtimedate, [HH, ':', nn, ':', ss]);

      print(examtimedate.hour);
      print(examtimedate.minute);
      print(examtimedate.second);
    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AgentColor.appbarbackgroundColor,
        title: Text("Exam schedule",style: MyGoogeFont.mydmSans),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) {
              return <PopupMenuEntry<int>>[
                const PopupMenuItem(value: 0, child: Text('0')),
                const PopupMenuItem(value: 1, child: Text('1')),
              ];
            },
          ),
        ],
      ),

      body: Container(
        // height: 0.61.sh,
        // decoration: const BoxDecoration(
        //   color: Colors.white,
        // ),
        child: SizedBox.expand(
          child: Column(
            children: [
              for (int i = 0; i < getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"].length; i++)

                Padding(
                  padding: const EdgeInsets.all(0).r,
                  child: Center(
                    child: InkWell(
                      child: Card(
                        elevation: 10,
                        child: Container(
                          width: 0.96.sw,
                          height: 0.15.sh,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffE3F2FB),
                          ),
                          child: Stack(

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 19,top: 5
                                ).r,
                                child: Row(
                                  children:  [
                                    Obx(
                                    () =>
                                       Text(
                                         getexamview.loadingGetexamsSchedule.value?"${getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["subject_name"].toString().capitalize}":"",
                                         style: GoogleFonts.dmSans(
                                           fontStyle: FontStyle.normal,
                                           fontSize: 20.sp,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.black,
                                         ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 14,bottom: 10),
                                      child: Row(
                                        children: [
                                          Text("Room No:",style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),),
                                          Obx(
                                                () => Text(
                                              getexamview.loadingGetexamsSchedule.value?getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["room_no"]:CircularProgressIndicator(),
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               Positioned(
                                top: 0.033.sh,

                                child: Row(
                                  children: [
                                    Padding(
                                   padding: EdgeInsets.only(top: 20).r,
                                      child: Icon(
                                        Icons.date_range,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.015.sw,
                                      height: 0.12.sh,
                                    ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 20).r,
                                      child: Obx(
                                            () => Text(
                                        getexamview.loadingGetexamsSchedule.value?MyDateFormat.dateformatmethod1(getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["date_from"]):CircularProgressIndicator(),
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                    // const Icon(Icons.timelapse),
                                    SizedBox(
                                      width: 0.034.sw,
                                    ),
                                    Container(
                                      width: 0.62.sw,
                                      height: 0.070.sh,
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
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                color: Colors.black,
                                                width: 0.24.sw,
                                                height: 0.001.sh,
                                              ),
                                              Obx(
                                                    () => Text(
                                                  getexamview.loadingGetexamsSchedule.value?getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["time_from"]:CircularProgressIndicator(),
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
                                            width: 0.005.sw,
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
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                          ),),
                                        Container(
                                          color: Colors.black,
                                          width: 0.24.sw,
                                          height: 0.001.sh,
                                        ),
                                       Text('${starttime??""}',
                                          style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),),
                                      ],
                                    ),
                                        ],
                                      ),
                                    ),

                                  ],
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
    );
  }


}
