import 'dart:async';

import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getSylabusStatus_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';


class SubjectLession extends StatefulWidget {
  const SubjectLession({super.key});

  @override
  State<SubjectLession> createState() => _SubjectLessionState();
}

class _SubjectLessionState extends State<SubjectLession> with TickerProviderStateMixin {
  GetSylabusStatusController GetSylabusStatus=Get.put(GetSylabusStatusController());
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

var student_id;
var company_key;
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
  var box = Hive.box("schoolData");
  @override
  void initState() {
    student_id = box.get("student_id");
    company_key = box.get("company_key");
    GetSylabusStatus.GetSylabusStatusapi(company_key,studentProfileController.studentProfileModel.value?.response.studentId );


    percentage = (progressFraction*100).floor();


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
    return RefreshIndicator(
      child: Scaffold(

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
        body: Obx(()=>
          GetSylabusStatus.loadingGetSylabusStatus.value?SafeArea(
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


                                   Container(

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
                                                   offset: const Offset(0, 1), // changes position of shadow
                                                 ),
                                               ],
                                             ),
                                             child: CircleAvatar(
                                               radius: 30,
                                               backgroundColor: Colors.white,

                                               child:

                                               Obx(
                                                       () =>
                                                   GetSylabusStatus.loadingGetSylabusStatus.value?
                                                   Text('${GetSylabusStatus.GetSylabusStatusControllerList[0]["response"]["subjects_data"][i]["complete"].toString()}%',
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

                           ],
                         ),
                       ),
                     ),
                   ),

              ],
            ),
          )
          ):Center(child: CircularProgressIndicator()),
        ),
      ),

      onRefresh: () async {
        AlwaysScrollableScrollPhysics();
        setState(() {
          GetSylabusStatus.GetSylabusStatusapi(company_key,studentProfileController.studentProfileModel.value?.response.studentId );
        });
      },
    );
  }
}
