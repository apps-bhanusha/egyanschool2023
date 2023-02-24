import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getexamsSchedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamTimeDetail extends StatefulWidget {
  const ExamTimeDetail({super.key});

  @override
  State<ExamTimeDetail> createState() => _ExamTimeDetailState();
}

class _ExamTimeDetailState extends State<ExamTimeDetail> {



  GetexamsScheduleController getexamview=Get.put(GetexamsScheduleController());




  @override
  void initState() {

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Exam schedule",style: MyGoogeFont.mydmSans),
       
      ),

      body:Obx(()=>
    getexamview.loadingGetexamsSchedule.value? Container(
        // height: 0.61.sh,
        // decoration: const BoxDecoration(
        //   color: Colors.white,
        // ),
        child: SizedBox.expand(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 8).r,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('${getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][0]["exam_group_name"].toString().capitalize} ${getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][0]["exam"].toString().capitalize}', style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                ),
              ),
SizedBox(height: 0.010.sh,),
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
                                              getexamview.loadingGetexamsSchedule.value?getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["room_no"]:"",
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
                                   padding: const EdgeInsets.only(top: 20).r,
                                      child: const Icon(
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
                                        getexamview.loadingGetexamsSchedule.value?MyDateFormat.dateformatmethod1(getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["date_from"]):"",
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
                                                  getexamview.loadingGetexamsSchedule.value?getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["time_from"]:"",
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
                                       Obx(()=>getexamview.loadingtime.value?
                                         Text('${getexamview.endtimeList[i]}',
                                            style: GoogleFonts.dmSans(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),):Text('',
                                         style: GoogleFonts.dmSans(
                                           fontStyle: FontStyle.normal,
                                           fontSize: 15.sp,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white,
                                         ),),
                                       ),
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
                ),

      ],
          ),
        ),
    ):Center(child: CircularProgressIndicator()),
      ) );
  }


}