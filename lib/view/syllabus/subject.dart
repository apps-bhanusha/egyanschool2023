import 'dart:async';

import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getSylabusStatus_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';


class SubjectLession extends StatefulWidget {
  const SubjectLession({super.key});

  @override
  State<SubjectLession> createState() => _SubjectLessionState();
}

class _SubjectLessionState extends State<SubjectLession> with TickerProviderStateMixin {
  GetSylabusStatusController GetSylabusStatus=Get.put(GetSylabusStatusController());
  final bool _visible = true;
 late AnimationController _controller;
  late Animation<double> _animation;
  double value = 1.0;
  
 @override
 int totalSecs = 90;
  int secsRemaining = 90;
  double progressFraction = 0.0;
  int percentage = 0;
 late Timer timer;

  get progress => progressFraction;
  // List GetSylabusStatusList=[];
// List sylabusStatus=[];

  @override
  void initState() {
    print(GetSylabusStatus.GetSylabusStatusControllerList);

    //
    // for (int i = 0; i <GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"].length; i++){
    //   GetSylabusStatusList.add(GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"]);
//       print(GetSylabusStatusList[0]["$i"]);
//       // print(GetSylabusStatusList[i]);
// sylabusStatus.add(GetSylabusStatusList[0]["$i"]);

    // }
    // print("444444444444444444444442222222222222");
// print(sylabusStatus);
//     timer = Timer.periodic(Duration(milliseconds: 20), (_) {
//       if(secsRemaining == 40){
//         return;
//       }
//       setState(() {
//         secsRemaining -= 1;
//         progressFraction = (totalSecs - secsRemaining) / totalSecs;
//         percentage = (progressFraction*100).floor();
//       });
//     });
//     timer = Timer.periodic(Duration(milliseconds: 20), (_) {
//       if(secsRemaining == 40){
//         return;
//       }
//       setState(() {
//         secsRemaining -= 1;
//         progressFraction = (totalSecs - secsRemaining) / totalSecs;
//         percentage = (progressFraction*100).floor();
//       });
//     });

    percentage = (progressFraction*100).floor();
    print("333333333ccccc333331111");
    print(progress);
 print(percentage);

    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:AgentColor.appbarbackgroundColor,
        title: Text('Syllabus Status',style: MyGoogeFont.mydmSans),
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
      body: SafeArea(
          child: Container(
        color: const Color.fromARGB(255, 238, 232, 232),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              crossAxisSpacing: 3.0,
              childAspectRatio: 1,
            ),
          children: [
    for (int i = 0; i <GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"].length-1; i++)


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

                               // Padding(
                               //   padding: const EdgeInsets.only(left: 8.0),
                               //   child: Align(
                               //     alignment: Alignment.topLeft,
                               //     child: Obx(
                               //           () =>
                               //           GetSylabusStatus.loadingGetSylabusStatus.value?
                               //    Text(
                               //      GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i]["lebel"].toString(),
                               //         style: GoogleFonts.dmSans(
                               //           fontStyle: FontStyle.normal,
                               //           fontSize: 15.sp,
                               //           fontWeight: FontWeight.bold,
                               //           color: Colors.black,
                               //         ),
                               //       ):Text("")
                               //     ),
                               //   ),
                               // ),

                               // Column(
                               //   children: [
                               //     Text(
                               //       "Subject-Lession-Topic Status",
                               //       style: GoogleFonts.dmSans(
                               //           fontStyle: FontStyle.normal,
                               //           fontSize: 15.sp,
                               //           fontWeight: FontWeight.bold,
                               //         color: Colors.black,),
                               //     ),
                               //     Text(
                               //       "1. happy Three little child",
                               //       style: GoogleFonts.dmSans(
                               //           fontStyle: FontStyle.normal,
                               //           fontSize: 15.sp,
                               //           fontWeight: FontWeight.bold,
                               //         color: Colors.black,),
                               //     ),
                               //     Padding(
                               //       padding: const EdgeInsets.only(left: 5).r,
                               //       child: Text(
                               //         "1.1  Read Lession",
                               //
                               //         style: GoogleFonts.dmSans(
                               //             fontStyle: FontStyle.normal,
                               //             fontSize: 15.sp,
                               //             fontWeight: FontWeight.bold,
                               //           color: Colors.black,),
                               //       ),
                               //     ),
                               //     Padding(
                               //       padding: const EdgeInsets.only(left: 5).r,
                               //       child: Text(
                               //         "1.2  Read Lession",
                               //
                               //         style: GoogleFonts.dmSans(
                               //             fontStyle: FontStyle.normal,
                               //             fontSize: 15.sp,
                               //             fontWeight: FontWeight.bold,
                               //           color: Colors.black,),
                               //       ),
                               //     ),
                               //     Text(
                               //       "2. Qustaion and Answer",
                               //
                               //       style: GoogleFonts.dmSans(
                               //           fontStyle: FontStyle.normal,
                               //           fontSize: 15.sp,
                               //           fontWeight: FontWeight.bold,
                               //         color: Colors.black,),
                               //     ),
                               //     Padding(
                               //       padding: const EdgeInsets.only(left: 5).r,
                               //       child: Text(
                               //         "2.1  Read Lession",
                               //
                               //         style: GoogleFonts.dmSans(
                               //             fontStyle: FontStyle.normal,
                               //             fontSize: 15.sp,
                               //             fontWeight: FontWeight.bold,
                               //           color: Colors.black,),
                               //       ),
                               //     ),
                               //     Padding(
                               //       padding: const EdgeInsets.only(left: 5).r,
                               //       child: Text(
                               //         "2.2  Read Lession",
                               //
                               //         style: GoogleFonts.dmSans(
                               //             fontStyle: FontStyle.normal,
                               //             fontSize: 15.sp,
                               //             fontWeight: FontWeight.bold,
                               //           color: Colors.black,),
                               //       ),
                               //     ),
                               //   ],
                               // ),
                               // Container(
                               //   // decoration: BoxDecoration(
                               //   //     boxShadow: const [
                               //   //
                               //   //     ],
                               //   //     borderRadius: BorderRadius.circular(10),
                               //   //     gradient: const LinearGradient(colors: [
                               //   //       Color.fromARGB(255, 156, 163, 226),
                               //   //       Color.fromARGB(255, 132, 194, 229)
                               //   //     ]
                               //   //     )
                               //   // ),
                               //   child: Column(
                               //     children: [
                               //      Obx(
                               //               () =>
                               //           GetSylabusStatus.loadingGetSylabusStatus.value?
                               //           Text(
                               //          i==0?   GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i]["lebel"].toString():GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i+1]["lebel"].toString(),
                               //             style: GoogleFonts.dmSans(
                               //               fontStyle: FontStyle.normal,
                               //               fontSize: 15.sp,
                               //               fontWeight: FontWeight.bold,
                               //               color: Colors.black,
                               //             ),
                               //           ):Text("")
                               //       ),
                               //       CircularPercentIndicator(
                               //         radius: 50.0,
                               //         lineWidth: 0.065.sw,
                               //
                               //         reverse: true,
                               //         // backgroundColor: Colors.grey,
                               //         percent:progress,
                               //         animateFromLastPercent: true,
                               //         circularStrokeCap: CircularStrokeCap.round,
                               //         addAutomaticKeepAlive: true,
                               //         animation: true,
                               //         animationDuration: 1000,
                               //
                               //         center: Container(
                               //
                               //
                               //           decoration: BoxDecoration(
                               //             color: Colors.white,
                               //             shape: BoxShape.circle,
                               //             boxShadow: [
                               //               BoxShadow(
                               //                 color: Colors.grey.withOpacity(0.5),
                               //                 spreadRadius: 5,
                               //                 blurRadius: 7,
                               //                 offset: Offset(0, 1), // changes position of shadow
                               //               ),
                               //             ],
                               //           ),
                               //           child: CircleAvatar(
                               //             radius: 30,
                               //             backgroundColor: Colors.white,
                               //
                               //             child:
                               //             // Text('$percentage%',  style: GoogleFonts.dmSans(
                               //             //     fontStyle: FontStyle.normal,
                               //             //     fontSize: 20.sp,
                               //             //     fontWeight: FontWeight.bold,
                               //             //     color:Colors.green
                               //             // ),),
                               //             Obx(
                               //                     () =>
                               //                     GetSylabusStatus.loadingGetSylabusStatus.value?
                               //                 Text(  i==0? GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i+1]["complete"].toString():GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i+1]["complete"].toString(),
                               //                   // GetSylabusStatusList[0]["$i"]["complete"].toString(),
                               //                   style: GoogleFonts.dmSans(
                               //                     fontStyle: FontStyle.normal,
                               //                     fontSize: 15.sp,
                               //                     fontWeight: FontWeight.bold,
                               //                     color: Colors.black,
                               //                   ),
                               //                 ):Text("")
                               //             ),
                               //           ),
                               //         ),
                               //         progressColor: Colors.blue,
                               //
                               //       ),
                               //
                               //       // SizedBox(
                               //       //   width: 0.3.sw,
                               //       // ),
                               //       // const Text(
                               //       //   "Code No. 20",
                               //       //   style: TextStyle(
                               //       //       color: Colors.white, fontSize: 18),
                               //       // )
                               //
                               //     ],
                               //   ),
                               // ),
                               Container(
                                 // decoration: BoxDecoration(
                                 //     boxShadow: const [
                                 //
                                 //     ],
                                 //     borderRadius: BorderRadius.circular(10),
                                 //     gradient: const LinearGradient(colors: [
                                 //       Color.fromARGB(255, 156, 163, 226),
                                 //       Color.fromARGB(255, 132, 194, 229)
                                 //     ]
                                 //     )
                                 // ),
                                 child: Column(
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
                                             GetSylabusStatus.loadingGetSylabusStatus.value?
                                             Text(
                                               GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i+1]["lebel"].toString(),
                                               style: GoogleFonts.dmSans(
                                                 fontStyle: FontStyle.normal,
                                                 fontSize: 15.sp,
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.black,
                                               ),
                                             ):Text("")
                                         ),
                                       ],
                                     ),
                                     CircularPercentIndicator(
                                       radius: 50.0,
                                       lineWidth: 0.065.sw,

                                       reverse: true,
                                       // backgroundColor: Colors.grey,
                                       percent:(GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i]["complete"]) / 100,
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
                                               offset: Offset(0, 1), // changes position of shadow
                                             ),
                                           ],
                                         ),
                                         child: CircleAvatar(
                                           radius: 30,
                                           backgroundColor: Colors.white,

                                           child:
                                           // Text('$percentage%',  style: GoogleFonts.dmSans(
                                           //     fontStyle: FontStyle.normal,
                                           //     fontSize: 20.sp,
                                           //     fontWeight: FontWeight.bold,
                                           //     color:Colors.green
                                           // ),),
                                           Obx(
                                                   () =>
                                               GetSylabusStatus.loadingGetSylabusStatus.value?
                                               Text(GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i]["complete"].toString(),
                                                 // GetSylabusStatusList[0]["$i"]["complete"].toString(),
                                                 style: GoogleFonts.dmSans(
                                                   fontStyle: FontStyle.normal,
                                                   fontSize: 15.sp,
                                                   fontWeight: FontWeight.bold,
                                                   color: Colors.black,
                                                 ),
                                               ):Text("")
                                           ),
                                         ),
                                       ),
                                       progressColor: Colors.blue,

                                     ),

                                     // SizedBox(
                                     //   width: 0.3.sw,
                                     // ),
                                     // const Text(
                                     //   "Code No. 20",
                                     //   style: TextStyle(
                                     //       color: Colors.white, fontSize: 18),
                                     // )
                                     Row(

                                       children: [
                                         Image.asset("assets/images/teacher.png",width: 20,height: 20,),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 5.0).r,
                                           child:  Obx(
                                                   () =>
                                               GetSylabusStatus.loadingGetSylabusStatus.value?
                                               Text(GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i]["teacher_name"].toString(),
                                                 // GetSylabusStatusList[0]["$i"]["complete"].toString(),
                                                 style: GoogleFonts.dmSans(
                                                   fontStyle: FontStyle.normal,
                                                   fontSize: 12.sp,
                                                   fontWeight: FontWeight.normal,
                                                   color: Colors.black,

                                                 ),

                                                 overflow: TextOverflow.ellipsis,
                                               ):Text("")
                                           ),
                                         )
                                       ],
                                     )
                                   ],
                                 ),
                               ),

                             ],
                           ),
                         ),
                         // Padding(
                         //   padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0).r,
                         //   child: Row(
                         //
                         //     children: [
                         //       Padding(
                         //         padding: const EdgeInsets.only(right: 10).r,
                         //         child: Image.asset(
                         //           "assets/images/book.png",
                         //           width: 0.030.sw,
                         //           height: 0.030.sh,
                         //         ),
                         //       ),
                         //        Obx(
                         //               () =>
                         //           GetSylabusStatus.loadingGetSylabusStatus.value?
                         //           Text("",
                         //             // GetSylabusStatusList[0]["$i"]["name"] ,
                         //             style: GoogleFonts.dmSans(
                         //               fontStyle: FontStyle.normal,
                         //               fontSize: 15.sp,
                         //               fontWeight: FontWeight.bold,
                         //               color: Colors.black,
                         //             ),
                         //           ):Text("")
                         //       ),
                         //

                         //     ],
                         //   ),
                         // ),
                       ],
                     ),
                   ),
                 ),
               ),

          ],
        ),
      )
      ),
    );
  }
}
