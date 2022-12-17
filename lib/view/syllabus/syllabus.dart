import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Syllabus extends StatefulWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  int totalSecs = 90;
  int secsRemaining = 90;
  double progressFraction = 0.6;
  int percentage = 0;
  late Timer timer;

  get progress => progressFraction;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 20), (_) {
      if(secsRemaining == 40){
        return;
      }
      setState(() {
        secsRemaining -= 1;
        progressFraction = (totalSecs - secsRemaining) / totalSecs;
        percentage = (progressFraction*100).floor();

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xff8DD0E5),
        title: Text("Syllabus Status"),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 0.020.sh),
            Container(


              child: CircularPercentIndicator(
                radius: 90.0,
                lineWidth: 35.0,

                reverse: true,
                // backgroundColor: Colors.grey,
                percent: progress,
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
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
radius: 45,
                    backgroundColor: Colors.white,

                    child: Text('$percentage%',  style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color:Colors.green
                    ),),
                  ),
                ),
                progressColor: Colors.blue,

              ),
            ),
            Container(

              child: Column(children: [

                Container(
                  child: Text(
                    "English (001)",
                    style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(height: 0.005.sh,width: 0.90.sw,color: Colors.grey[300],),
                SizedBox(height: 0.040.sh,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Text(
                      "Subject-Lession-Topic Status",
                      style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 0.020.sh,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(


                            child: Text(
                              "1. happy Three little child",
                              style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            ),

                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20).r,
                        child: Container(

                          child: Text(
                            "55% Completed",
                            style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10).r,
                        child: Container(


                          child: Text(
                            "1.1  Read Lession",

                            style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),

                      Container(



                        child: Text(
                          "55% Completed",
                          style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 0.010.sh,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(


                        child: Text(
                          "1. Qustaion and Answer",

                          style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30).r,
                        child: Container(

                          child: Text(
                            "5% Completed",
                            style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),

                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }

}
