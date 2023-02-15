// import 'dart:async';
// import 'package:ecom_desgin/constant/Colors.dart';
// import 'package:ecom_desgin/constant/api_url.dart';

// import 'package:ecom_desgin/constant/font.dart';
// import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
// import 'package:ecom_desgin/controller/teacher_controller/class_list_controller.dart';
// import 'package:ecom_desgin/controller/teacher_controller/noticeboard_controller.dart';
// import 'package:ecom_desgin/controller/teacher_controller/staff_detial_contriller.dart';
// import 'package:ecom_desgin/controller/teacher_controller/teacher_login_controller.dart';

// import 'package:ecom_desgin/routes/routes.dart';
// import 'package:ecom_desgin/view/examination/Exam_time_table.dart';
// import 'package:ecom_desgin/view/teacher_main/Attendance.dart';
// import 'package:ecom_desgin/view/teacher_main/exam_shadule/exam_time_table.dart';
// import 'package:ecom_desgin/view/teacher_main/exam_shadule/teacher_exam_result.dart';
// import 'package:ecom_desgin/view/teacher_main/home_work/teacher_homework.dart';
// import 'package:ecom_desgin/view/teacher_main/leave_teacher/leave_teacher.dart';
// import 'package:ecom_desgin/view/teacher_main/leave_teacher/ohter_teacher_leave.dart';
// import 'package:ecom_desgin/view/teacher_main/student%20_information.dart';
// import 'package:ecom_desgin/view/teacher_main/teacher_attendance/Teacher_attendance.dart';
// import 'package:ecom_desgin/view/teacher_main/teacher_notification/teacher_notificaion.dart';
// import 'package:ecom_desgin/view/teacher_main/teacher_payroll/teacher_payroll.dart';
// import 'package:ecom_desgin/view/teacher_main/teacher_profile/teacher_profile.dart';
// import 'package:ecom_desgin/view/teacher_main/teacher_upload_content/upload_Content_dailog.dart';
// import 'package:ecom_desgin/view/teacher_main/time_table_t/class_time_table.dart';
// import 'package:ecom_desgin/view/teacher_main/time_table_t/teacher_class_time_table.dart';
// import 'package:ecom_desgin/view/teacher_main/time_table_t/teacher_time_table.dart';
// import 'package:ecom_desgin/view/teacher_main/time_table_t/time_table.dart';
// import 'package:ecom_desgin/view/teacher_main/teacher_upload_content/upload_content.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:shrink_sidemenu/shrink_sidemenu.dart';

// import 'package:hive/hive.dart';

// class TeacherHome extends StatefulWidget {
//   const TeacherHome({super.key});

//   @override
//   State<TeacherHome> createState() => _TeacherHomeState();
// }

// class _TeacherHomeState extends State<TeacherHome>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;
//   late AnimationController _controller1;
//   late Animation<Offset> _Animation;
//   final StaffDetailController staffdetailsController = Get.put(StaffDetailController());
//   final NoticBoardController noticBoardController = Get.put(NoticBoardController());
//   final GetSchoolSettingController _schoolsetting =
//   Get.put(GetSchoolSettingController());
//   TeacherLoginController teacherLoginController=Get.put(TeacherLoginController());
//   // classListController classTimeTableController=Get.put(ClassController());
// bool teachervisible=false;
//   int totalSecs = 90;
//   int secsRemaining = 90;
//   double progressFraction = 0.6;
//   int percentage = 0;

//   var present;
//   var schoolname;
//  var id;
//  var user_type;
//   var session;

//   late Timer timer;
//   get progress => progressFraction;
//   DateTime now = DateTime.now();
//   late int lastday = DateTime(now.year, now.month + 1, 0).day;
//   late int days = lastday;
//   double progressFraction1 = 0.0;
//   double percentage1 = 0;
//   late Timer timer1;
//   get progress1 => progressFraction1;
//   var box = Hive.box("schoolData");

//   @override
//   void initState() {
//     schoolname = box.get("schoolname");
//     session = box.get("session");
//    var activatestudentInfo = box.get("activatestudentInfo");
//  if(activatestudentInfo.toString().toLowerCase()=="activatestudentInfo"){
//            teacherLoginController.activatestudentInfo.value=true; 
//         box.put("activatestudentInfo","activatestudentInfo");

//         }else{
//         box.put("activatestudentInfo","");
//  teacherLoginController.activatestudentInfo.value=false;
//         }
//    id=box.get("staff_id");
//    print("id_________________________ss");
//    print(id);
//     user_type=box.get("user_type");


//     // user_type==staffdetailsController.staffDetailModel.value?.response.userType?staffdetailsController.staffDetailModel.value?.response.id==id?
//     staffdetailsController.staffDetail(id);

//     var role_flag = box.get("role_flag");
//     noticBoardController.noticBoardapi(role_flag);
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     )..repeat(reverse: true);
//     _offsetAnimation =
//         Tween<Offset>(begin: Offset.zero, end: const Offset(0.1, 0.0))
//             .animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.linear,
//     ));
//     _controller1 = AnimationController(
//       duration: const Duration(milliseconds: 700),
//       vsync: this,
//     )..repeat(reverse: true);
//     _Animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0.1, 0.0))
//         .animate(CurvedAnimation(
//       parent: _controller1,
//       curve: Curves.linear,
//     ));
//     // _controller.repeat(reverse: true);
//     // _controller =  AnimationController(vsync: this, duration: Duration(seconds: 6));
//     // colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
//     // sizeAnimation = Tween<double>(begin: 400.0, end: 400.0).animate(controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _controller1.dispose();

//     super.dispose();
//   }

//   bool isOpened = false;
//   final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
//   final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
//   toggleMenu([bool end = false]) {
//     if (end) {
//       final _state = _endSideMenuKey.currentState!;
//       if (_state.isOpened) {
//         _state.closeSideMenu();
//       } else {
//         _state.openSideMenu();
//       }
//     } else {
//       final _state = _sideMenuKey.currentState!;
//       if (_state.isOpened) {
//         _state.closeSideMenu();
//       } else {
//         _state.openSideMenu();
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//         onRefresh: () async {
//           AlwaysScrollableScrollPhysics();
//           setState(() {});
//           Timer timer;

//           timer = Timer.periodic(Duration(seconds: 3), (t) {});

//           await Future.value({
//             Duration(seconds: 3),
//           });
//         },
//         child: SafeArea(
//             child: SideMenu(
//                 background: Colors.blue,
//                 key: _sideMenuKey,
//                 menu: buildMenu(),
//                 type: SideMenuType.shrikNRotate,
//                 onChange: (isOpened) {
//                   setState(() => isOpened = isOpened);
//                 },
//                 child: IgnorePointer(

//                     ignoring: isOpened,
//                     child: Scaffold(
//                         appBar: AppBar(
//                           // centerTitle: true,
//                           leading: IconButton(
//                             icon: const Icon(
//                               Icons.menu,
//                             ),
//                             onPressed: () => toggleMenu(),
//                           ),
//                           automaticallyImplyLeading: false,
//                           backgroundColor: AgentColor.appbarbackgroundColor,
//                           // iconTheme: IconThemeData(color: Colors.black),
//                           title: Row(
//                             children: [
//                               SizedBox(
//                                   width: 0.45.sw,
//                                   child:  Text(
//                                     schoolname??"",
//                                     // _schoolsetting.GetSchoolSettingControllerList[0]["response"]["name"],
//                                     style: MyGoogeFont.mydmSans1,
//                                     overflow: TextOverflow.ellipsis,
//                                   )

//                               ),


//                             ],
//                           ),
//                           actions: [
//                         Padding(
//                         padding: const EdgeInsets.only(left: 0, top: 10).r,
//                       child: Column(
//                         children: [
//                           Text(
//                             'Session',
//                             style: MyGoogeFont.mydmSans2,
//                           ),
//                           Text(
//                             session??"",
//                             // _schoolsetting.GetSchoolSettingControllerList[0]["response"]["session"],
//                             style: MyGoogeFont.mydmSans2,
//                           ),
//                         ],
//                       ),
//                     ),
//                             PopupMenuButton<int>(
//                               itemBuilder: (context)  {

//                                 return <PopupMenuEntry<int>>[
//                                   PopupMenuItem(
//                                       onTap:() async { await SessionManager().remove("name");
//                                       Get.toNamed(RoutesName.schoolId);
//                                       // ignore: use_build_context_synchronously
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(content: Text("logout", style: GoogleFonts.dmSans(
//                                           fontStyle: FontStyle.normal,
//                                           fontSize: 15.sp,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.red,
//                                         ),
//                                         ),
//                                           backgroundColor: Colors.white,
//                                         ),
//                                       );
//                                       },
//                                       value: 0, child: const Text('Logout')),
//                                   PopupMenuItem(child: Text('about'), value: 1),
//                                 ];
//                               },
//                             ),
//                           ],
//                         ),
//                         body:
//                         Column(children: [
//                             Stack(children: [
//                               Container(
//                                 margin:
//                                     const EdgeInsets.only(left: 0, right: 0).r,
//                                 child: ClipPath(
//                                   clipper: ClipPathClass(),
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     height: 0.220.sh,
//                                     child: Image.asset(
//                                       "assets/images/planall.png",
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                         left:18, right: 15, top: 70.0)
//                                     .r,
//                                 child:  Stack(
//                                   children: <Widget>[
//                                     Card(
//                                       color: Colors.grey[200],
//                                       child: SizedBox(
//                                         height: 0.145.sh,
//                                         width: 0.87.sw,

//                                       ),
//                                     ),

//                                     Positioned(
// left: 0.10.sw,
//                                       top: 0.015.sh,
//                                       child: Row(
//                                         children: [
//                                           FractionalTranslation(
//                                             translation: Offset(0.0, -0.0),
//                                             child: Align(
//                                                 alignment: FractionalOffset(0.5, 0.5),
//                                                 child: CircleAvatar(
//                                                     maxRadius: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width +
//                                                         39,
//                                                     minRadius: 20,
//                                                     foregroundImage: "${staffdetailsController.staffDetailModel.value?.response.image}"!="null"?
//                                                     NetworkImage("${ApiUrl.imagesUrl.toString()}${staffdetailsController.staffDetailModel.value?.response.image}")
//                                                         :  NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
//                                                     ,
//                                                     // radius: 54.0,
//                                                     backgroundImage:
//                                                     NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
//                                                 )


//                                             ),
//                                           ),


//                                           Padding(
//                                             padding:  EdgeInsets.only(left: 8.0).r,
//                                             child:Obx(()=>
//                                               staffdetailsController.isloding.value? Column(
//                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                               '${staffdetailsController.staffDetailModel.value?.response.name.toString().capitalizeFirst} ${staffdetailsController.staffDetailModel.value?.response.surname.toString().capitalizeFirst}',
//                                                     style: GoogleFonts.dmSans(
//                                                         fontStyle: FontStyle.normal,
//                                                         fontSize: 13.sp,
//                                                         fontWeight: FontWeight.bold,
//                                                         color: Colors.black),
//                                                   ),

//                                                   Text(
//                                                     '${staffdetailsController.staffDetailModel.value?.response.email}',
//                                                     style: GoogleFonts.dmSans(
//                                                         fontStyle: FontStyle.normal,
//                                                         fontSize: 13.sp,
//                                                         fontWeight: FontWeight.bold,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     '${staffdetailsController.staffDetailModel.value?.response.contactNo}',
//                                                     style: GoogleFonts.dmSans(
//                                                         fontStyle: FontStyle.normal,
//                                                         fontSize: 13.sp,
//                                                         fontWeight: FontWeight.bold,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ],
//                                               ):Text(""),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ]),

//                                   Container(
//                                     color: Colors.blue,
//                                     height: 0.080.sh,
//                                     width: MediaQuery.of(context).size.width,
//                                     child: Stack(
//                                       children: [
//                                         Positioned(
//                                           top: 0.001.sh,
//                                           left: 0.06.sw,
//                                           child: SlideTransition(
//                                             position: _offsetAnimation,
//                                             child: Icon(
//                                               Icons.arrow_right,
//                                               color: Colors.white,
//                                               size: 52.sp,
//                                             ),
//                                           ),
//                                         ),
//                                         Positioned(
//                                           left: 0.10.sw,
//                                           child: Padding(
//                                             padding: EdgeInsets.only(
//                                               bottom: 0.50.sh,
//                                             ),
//                                             child: SlideTransition(
//                                               position: _Animation,
//                                               child: Icon(
//                                                 Icons.arrow_right,
//                                                 color: Colors.white,
//                                                 size: 55.sp,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Positioned(
//                                           left: 0.22.sw,
//                                           top: 0.025.sh,
//                                           child: GestureDetector(
//                                             onTap: () => {
//                                               // Get.toNamed(RoutesName.home),
//                                             },
//                                             child: Text(
//                                               "Tap Here For E-GYAN Services",
//                                               style: GoogleFonts.dmSans(
//                                                 fontStyle: FontStyle.normal,
//                                                 fontSize: 15.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 0.010.sh,
//                                   ),
//                                   SizedBox(
//                                       height: 0.08.sh,
//                                       // width: 0.500.sw,
//                                       child: Card(
//                                         color: Color.fromARGB(255, 134, 217, 248),
//                                         child: Center(
//                                           child: ScrollLoopAutoScroll(
//                                             duration: Duration(seconds: 200),
//                                             delay: Duration(seconds: 1),
//                                             // delayAfterScrollInput: Duration(seconds: 10),
//                                             enableScrollInput: true,
//                                             scrollDirection: Axis.horizontal,

//                                             child: Row(
//                                               children: [
//                                                 // for (var i = 0; i < 3; i++)
//                                                 Obx(()=>
//                                                    noticBoardController.noticBoardModel.value?.response.length!=null?Text(
//                                                       Bidi.stripHtmlIfNeeded ('${noticBoardController.noticBoardModel.value?.response[0].title.toString().capitalizeFirst}   ${noticBoardController.noticBoardModel.value?.response[0].message.toString().capitalizeFirst}' ),
//                                                       style: GoogleFonts.dmSans(
//                                                         fontStyle: FontStyle.normal,
//                                                         fontSize: 15.sp,
//                                                         fontWeight: FontWeight.bold,
//                                                         color: Colors.black,
//                                                       ),
//                                                     ):Text("No Event"),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       )),

//                             teachervisible?Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0).r,
//                                         child: Row(

//                                           children: [
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                  "Class",
//                                                   style: GoogleFonts.dmSans(
//                                                     fontStyle: FontStyle.normal,
//                                                     fontSize: 15.sp,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.grey,
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   height: 0.070.sh,
//                                                   width: 0.45.sw,
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.grey[300],
//                                                     borderRadius: BorderRadius.circular(3),
//                                                     boxShadow: [
//                                                       BoxShadow(
//                                                         offset: Offset(0, 1),
//                                                         blurRadius: 5,
//                                                         color: Colors.black.withOpacity(0.3),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   child: Center(
//                                                     child: Text(
//                                                       "1st",
//                                                       style: GoogleFonts.dmSans(
//                                                         fontStyle: FontStyle.normal,
//                                                         fontSize: 15.sp,
//                                                         fontWeight: FontWeight.bold,
//                                                         color: Colors.black,
//                                                       ),
//                                                     )
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(width: 0.030.sw,),
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   "Section",
//                                                   style: GoogleFonts.dmSans(
//                                                     fontStyle: FontStyle.normal,
//                                                     fontSize: 15.sp,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.grey,
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   height: 0.070.sh,
//                                                   width: 0.45.sw,
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.grey[300],
//                                                     borderRadius: BorderRadius.circular(3),
//                                                     boxShadow: [
//                                                       BoxShadow(
//                                                         offset: Offset(0, 1),
//                                                         blurRadius: 5,
//                                                         color: Colors.black.withOpacity(0.3),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   child: Center(
//                                                     child: Text(
//                                                       "A",
//                                                       style: GoogleFonts.dmSans(
//                                                         fontStyle: FontStyle.normal,
//                                                         fontSize: 15.sp,
//                                                         fontWeight: FontWeight.bold,
//                                                         color: Colors.black,
//                                                       ),
//                                                     )
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),

//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(2.0).r,
//                                   child: Text(
//                                    "Total students/Total Absent",
//                                     style: GoogleFonts.dmSans(
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 15.sp,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ),
// SizedBox(height: 0.0010.sh),
//                                 Container(
//                                   height: 0.070.sh,
//                                   width: 0.45.sw,
//                                   decoration: BoxDecoration(
//                                     color:   Colors.grey[300],
//                                     borderRadius:  BorderRadius.circular(3),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         offset: Offset(0, 1),
//                                         blurRadius: 5,
//                                         color: Colors.black.withOpacity(0.3),
//                                       ),
//                                     ],
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "20/5",
//                                       style: GoogleFonts.dmSans(
//                                         fontStyle: FontStyle.normal,
//                                         fontSize: 15.sp,
//                                         fontWeight: FontWeight.bold,
//                                         color:  Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                                   SizedBox(height: 0.010.sh),
//                       SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(1.0).r,
//                                         child: Row(
//                                           children: [
//                                             for (var i = 0; i < 3; i++)
//                                               InkWell(
//                                                 onTap: () {},
//                                                 child: Card(

//                                                   elevation: 10,
//                                                   child: Container(
//                                                     height: 0.10.sh,
//                                                     width: 0.50.sw,
//                                                     color: Colors.grey[200],
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Text(
//                                                           "Mid Sem Winter Exam",
//                                                           style:
//                                                               GoogleFonts.dmSans(
//                                                             fontStyle:
//                                                                 FontStyle.normal,
//                                                             fontSize: 15.sp,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             color: Colors.black,
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           height: 0.015.sh,
//                                                         ),
//                                                         Text(
//                                                           "20 to 27 Exam ",
//                                                           style:
//                                                               GoogleFonts.dmSans(
//                                                             fontStyle:
//                                                                 FontStyle.normal,
//                                                             fontSize: 12.sp,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             color:
//                                                                 Colors.lightBlue,
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),

//         ])

//     )
//     )]


//                                   ):Obx(()=>staffdetailsController.staffDetailModel.value!=null?
//                                   Column(
//                               children: [
//                                 SizedBox(height: 0.040.sh,),
//                                 Padding(
//                                     padding: const EdgeInsets.only(left: 4.0 ,top:8.0).r,
//                                     child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         ClipRRect(
//                                           // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
//                                           child:
//                                             Image.asset(
//                                               "assets/images/man12.jpg",
//                                               fit: BoxFit.cover,
// height: 0.10.sh,
//                                               width: 0.26.sw,
//                                             ),

//                                         ),
//                                         // ClipRRect(
//                                         //   // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
//                                         //   child:   CircleAvatar(
//                                         //     radius: 25.0,
//                                         //     backgroundImage:
//                                         //     AssetImage(
//                                         //       "assets/images/watch3.png",
//                                         //
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                             children: [
//                                               Column(
//                                                 children: [
//                                                   Text(
//                                                   "Time In",
//                                                     style: GoogleFonts.dmSans(
//                                                       fontStyle: FontStyle.normal,
//                                                       fontSize: 15.sp,
//                                                       fontWeight: FontWeight.bold,
//                                                       color: Color(0xFF26C6DA),
//                                                     ),
//                                                   ),
//                                                   '${staffdetailsController.staffDetailModel.value?.inoutTime.inTime}'!="null"?Text('${staffdetailsController.staffDetailModel.value?.inoutTime.inTime}', style: GoogleFonts.dmSans(
//                                                     fontStyle: FontStyle.normal,
//                                                     fontSize: 15.sp,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Color(0xFF26C6DA),
//                                                   ),):Text("")

//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),

//                                         Row(
//                                           children: [
//                                             ClipRRect(
//                                               // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
//                                               child:
//                                             Image.asset(
//                                                   "assets/images/man13.jpg",
//                                               // fit: BoxFit.cover,
//                                               height: 0.1.sh,
//                                               width: 0.20.sw,
//                                                 ),

//                                             ),

//                                             Column(
//                                               children: [
//                                                 Text(
//                                                  "Time Out",
//                                                   style: GoogleFonts.dmSans(
//                                                     fontStyle: FontStyle.normal,
//                                                     fontSize: 15.sp,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: AgentColor.AttenanceColor,
//                                                   ),
//                                                 ),
//                                                 '${staffdetailsController.staffDetailModel.value?.inoutTime.outTime}'!="null"?Text('${staffdetailsController.staffDetailModel.value?.inoutTime.outTime}', style: GoogleFonts.dmSans(
//                                                   fontStyle: FontStyle.normal,
//                                                   fontSize: 15.sp,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: AgentColor.AttenanceColor,
//                                                 ),):Text(""),

//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                 ),
// SizedBox(height: 0.0220.sh,),
//                                 Column(
//                                     children: [
//                                       InkWell(
//                                         onTap: (){
//                                          if(teachervisible==false){
//                                            teachervisible=true;
//                                            setState(() {

//                                            });
//                                          }
//                                         },

//                                         child: Container(
//                                           height: 0.070.sh,
//                                           width: 0.55.sw,
//                                           decoration: BoxDecoration(
//                                             color: AgentColor.AttenanceColor,
//                                             borderRadius:BorderRadius.circular(60),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 offset: Offset(0, 1),
//                                                 blurRadius: 20,
//                                                 spreadRadius: 5,
//                                                 color: Colors.black.withOpacity(0.10),
//                                               ),
//                                             ],
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               "SAVE ATTENDANCE",
//                                               style: GoogleFonts.dmSans(
//                                                 fontStyle: FontStyle.normal,
//                                                 fontSize: 15.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 color:   teachervisible?Colors.black:Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 0.020.sh,),
//                                       RichText(
//                                         text: TextSpan(
//                                           text: 'Present/Days In Month',
//                                           style: GoogleFonts.dmSans(
//                                             fontStyle: FontStyle.normal,
//                                             fontSize: 15.sp,
//                                             fontWeight: FontWeight.bold,
//                                             color: AgentColor.AttenanceColor,
//                                           ),

//                                         ),
//                                       ),
//                                       Container(
//                                         height: 0.070.sh,
//                                         width: 0.55.sw,
//                                         decoration: BoxDecoration(
//                                           color:  AgentColor.AttenanceColor,
//                                           borderRadius:BorderRadius.circular(60),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               offset: Offset(0, 1),
//                                               blurRadius: 20,
//                                               spreadRadius: 5,
//                                               color: Colors.black.withOpacity(0.10),
//                                             ),
//                                           ],
//                                         ),
//                                         child: Center(
//                                           child:
//                                             Text(
//                                               '${staffdetailsController.staffDetailModel.value?.monthAttendance.present}/${staffdetailsController.staffDetailModel.value?.monthAttendance.daysinmonth}',
//                                               style: GoogleFonts.dmSans(
//                                                 fontStyle: FontStyle.normal,
//                                                 fontSize: 15.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 color:   teachervisible?Colors.black:Colors.white,
//                                               ),
//                                             )
//                                           ),
//                                         ),
//                                     ],
//                                 ),

//                               ],
//                             ):Center(child: CircularProgressIndicator()),
//                                   ), ]),

//                       bottomNavigationBar: Container(
//                         color: Color.fromARGB(255, 196, 236, 255),
//                         child:Row(

//                           children: [
//                             Padding(
//                               padding:  EdgeInsets.only(left: 0.09.sw),
//                               child: const ClipRRect(
//                                 child: CircleAvatar(
//                                   radius: 20.0,
//                                   backgroundImage:
//                                   AssetImage("assets/images/appstore.png"),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding:  EdgeInsets.only(left: 0.05.sw,top: 10),
//                               child: const Text("Powered By :-"),
//                             ),
//                             Image.asset(
//                               "assets/images/b.png",
//                               width: 0.4.sw,
//                               height: 0.070.sh,
//                             ),
//                           ],
//                         ),
//                       ),
//                             )
//                           )
//                         )));
//   }

//   Widget buildMenu() {
//     return  SingleChildScrollView(
//       child: Container(

//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   ClipOval(
//                       child: Obx(() => _schoolsetting.loadingimage.value
//                           ? Image.network(
//                         _schoolsetting.GetSchoolSettingControllerList[0]["response"]["image"],
//                         width: 100,
//                         height: 100,
//                       )
//                           : CircularProgressIndicator())),
//                   const SizedBox(height: 16.0),
//                   Obx(() => _schoolsetting.loadingimage.value
//                       ? Text(
//                     _schoolsetting.GetSchoolSettingControllerList[0]
//                     ["response"]["name"],
//                     style: GoogleFonts.dmSans(
//                       fontStyle: FontStyle.normal,
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   )
//                       : const Text("")),
//                   SizedBox(height: 20.0),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 0.052.sh,
//               child: ListTile(

//                 leading:
//                     const Icon(Icons.home, size: 20.0, color: Colors.white),
//                 title: const Text("Home"),
//                 textColor: Colors.white,
//                 dense: true,
//               ),
//             ),


//             ListTileTheme(
//               dense: true,
//               child: ExpansionTile(
//                 collapsedIconColor: Colors.white,
//                 textColor: Colors.white,
//                 title: Text(
//                   "Personal information",
//                   style: GoogleFonts.dmSans(
//                     fontStyle: FontStyle.normal,
//                     fontSize: 14.sp,
//                     color: Colors.white,
//                   ),
//                 ),
//                 leading: const Icon(Icons.insert_drive_file_outlined,
//                     size: 20.0, color: Colors.white),

//                 childrenPadding: EdgeInsets.only(left: 60), //children padding
//                 children: [
//                   SizedBox(
//                     height: 0.052.sh,
//                     child: ListTile(
//                       onTap: () {Get.to(TeacherProfile());},

//                       title: Text(
//                         "Profile",
//                         style: GoogleFonts.dmSans(
//                           fontStyle: FontStyle.normal,
//                           fontSize: 14.sp,
//                           color: Colors.white,
//                         ),
//                       ),

//                     ),
//                   ),

//                   SizedBox(
//                     height: 0.062.sh,
//                     child: ListTile(
//                       onTap: () {Get.to(TeacherPayroll());},

//                       title: Text(
//                         "Payroll",
//                         style: GoogleFonts.dmSans(
//                           fontStyle: FontStyle.normal,
//                           fontSize: 14.sp,
//                           color: Colors.white,
//                         ),
//                       ),

//                     ),
//                   ),
//                   SizedBox(
//                     height: 0.062.sh,
//                     child: ListTile(
//                       onTap: () {Get.to(TeacherAttendance());},
//                       title: Text(
//                         "Attendance",
//                         style: GoogleFonts.dmSans(
//                           fontStyle: FontStyle.normal,
//                           fontSize: 14.sp,
//                           color: Colors.white,
//                         ),
//                       ),

//                     ),
//                   ),
//                   SizedBox(
//                     height: 0.062.sh,
//                     child: ListTile(
//                       onTap: () {Get.to(TeacherLeaveStatus());},
//                       title: Text(
//                         "Leave",
//                         style: GoogleFonts.dmSans(
//                           fontStyle: FontStyle.normal,
//                           fontSize: 14.sp,
//                           color: Colors.white,
//                         ),
//                       ),

//                     ),
//                   ),

//                   //more child menu
//                 ],
//               ),
//             ),
//             Visibility(
//               visible:teacherLoginController.activatestudentInfo.value,
//          child: ListTileTheme(
//                       dense: true,
//                       child: ExpansionTile(
//                         collapsedIconColor: Colors.white,
//                         textColor: Colors.white,
//                         title: Text(
//                           "Student Information",
//                           style: GoogleFonts.dmSans(
//                             fontStyle: FontStyle.normal,
//                             fontSize: 14.sp,
//                             color: Colors.white,
//                           ),
//                         ),
//                         leading: const Icon(Icons.insert_drive_file_outlined,
//                             size: 20.0, color: Colors.white),

//                         childrenPadding: EdgeInsets.only(left: 20), //children padding
//                         children: [
//                           ListTileTheme(
//                             dense: true,
//                             child: ExpansionTile(
//                               collapsedIconColor: Colors.white,
//                               textColor: Colors.white,
//                               title: Text(
//                                 "Student Detail",
//                                 style: GoogleFonts.dmSans(
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 14.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               leading: const Icon(Icons.info_rounded,
//                                   size: 20.0, color: Colors.white),

//                               childrenPadding: EdgeInsets.only(left: 70), //children padding
//                               children: [
//                                 SizedBox(
//                                   height: 0.062.sh,
//                                   child: ListTile(
//                                     title: Text(
//                                       "Student Details",
//                                       style: GoogleFonts.dmSans(
//                                         fontStyle: FontStyle.normal,
//                                         fontSize: 14.sp,
//                                         color: Colors.white,
//                                       ),
//                                     ),

//                                   ),
//                                 ),
//                                 SizedBox(
//                                   // height: 0.02.sh,
//                                   child: ListTile(
//                                     title: Text(
//                                       "Attendance",
//                                       style: GoogleFonts.dmSans(
//                                         fontStyle: FontStyle.normal,
//                                         fontSize: 14.sp,
//                                         color: Colors.white,
//                                       ),
//                                     ),

//                                   ),
//                                 ),
//                                 //more child menu
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 0.052.sh,
//                             child: ListTile(
//                               onTap: () {Get.to(TeacherProfile());},
//                               leading: const Icon(Icons.currency_rupee,
//                                   size: 20.0, color: Colors.white),
//                               title: Text(
//                                 "Fees",
//                                 style: GoogleFonts.dmSans(
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 14.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),

//                             ),
//                           ),

//                           SizedBox(
//                             height: 0.062.sh,
//                             child: ListTile(
//                               leading: const Icon(Icons.access_time_filled_outlined,
//                                   size: 20.0, color: Colors.white),
//                               onTap: () {

//                                   Get.to(TeacherClassTimeTable());


//                                 },

//                               title: Text(
//                                 "Class TimeTable",
//                                 style: GoogleFonts.dmSans(
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 14.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),

//                             ),
//                           ),
//                           SizedBox(
//                             height: 0.062.sh,
//                             child: ListTile(
//                               leading: const Icon(Icons.access_time_filled_outlined,
//                                   size: 20.0, color: Colors.white),
//                               onTap: () {

//                                 Get.to(TeacherTimeTable());
//                               },

//                               title: Text(
//                                 "Teacher TimeTable",
//                                 style: GoogleFonts.dmSans(
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 14.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),

//                             ),
//                           ),
//                           SizedBox(
//                             height: 0.062.sh,
//                             child: ListTile(
//                               leading: const Icon(Icons.upload_file,
//                                   size: 20.0, color: Colors.white),
//                               onTap: () {Get.to(TeacherLeaveStatus());},
//                               title: Text(
//                                 "Upload center",
//                                 style: GoogleFonts.dmSans(
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 14.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),

//                             ),
//                           ),

//                           SizedBox(
//                             height: 0.062.sh,
//                             child: ListTile(
//                               leading: const Icon(Icons.book_online,
//                                   size: 20.0, color: Colors.white),
//                               onTap: () {

//                                   Get.to(HomeWork());

//                               },
//                               title: Text(
//                                 "HomeWork",
//                                 style: GoogleFonts.dmSans(
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 14.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),

//                             ),
//                           ),
//                           ListTileTheme(
//                             dense: true,
//                             child: ExpansionTile(
//                               collapsedIconColor: Colors.white,
//                               textColor: Colors.white,
//                               title: Text(
//                                 "Exam",
//                                 style: GoogleFonts.dmSans(
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 14.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               leading: const Icon(Icons.book,
//                                   size: 20.0, color: Colors.white),

//                               childrenPadding: EdgeInsets.only(left: 70), //children padding
//                               children: [
//                                 SizedBox(
//                                   height: 0.062.sh,
//                                   child: ListTile(
//                                     onTap: () {
//                                       Get.to(TeacherExamTimeTable());



//                                     },
//                                     title: Text(
//                                       "Exam Shedule",
//                                       style: GoogleFonts.dmSans(
//                                         fontStyle: FontStyle.normal,
//                                         fontSize: 14.sp,
//                                         color: Colors.white,
//                                       ),
//                                     ),

//                                   ),
//                                 ),
//                                 SizedBox(
//                                   // height: 0.02.sh,
//                                   child: ListTile(
//                                     onTap: () {
//                                       Get.to(ExamResultall());



//                                     },
//                                     title: Text(
//                                       "Exam Result",
//                                       style: GoogleFonts.dmSans(
//                                         fontStyle: FontStyle.normal,
//                                         fontSize: 14.sp,
//                                         color: Colors.white,
//                                       ),
//                                     ),

//                                   ),
//                                 ),

//                                 //more child menu
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 0.062.sh,
//                             child: ListTile(
//                               onTap: () {Get.to(TeacherProfile());},
//                               leading: const Icon(Icons.leave_bags_at_home,
//                                   size: 20.0, color: Colors.white),
//                               title: Text(
//                                 "Leave",
//                                 style: GoogleFonts.dmSans(
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 14.sp,
//                                   color: Colors.white,
//                                 ),
//                               ),

//                             ),
//                           ), //more child menu
//                         ],
//                       ),
//                     ),
//        ),


//             SizedBox(
//               height: 0.052.sh,
//               child: const ListTile(
//                 // onTap: () {Get.toNamed(RoutesName.fees);},
//                 leading: Icon(Icons.chat,
//                     size: 20.0, color: Colors.white),
//                 title: Text("Chat &Support"),
//                 textColor: Colors.white,
//                 dense: true,

//                 // padding: EdgeInsets.zero,
//               ),
//             ),
//             SizedBox(
//               height: 0.052.sh,
//               child:  ListTile(
//                 onTap: () {Get.to(TeacherNotificationPage());},
//                 leading: Icon(Icons.notifications,
//                     size: 20.0, color: Colors.white),
//                 title: Text("Notification"),
//                 textColor: Colors.white,
//                 dense: true,

//                 // padding: EdgeInsets.zero,
//               ),
//             ),
//             SizedBox(
//               height: 0.052.sh,
//               child: const ListTile(

//                 leading: Icon(Icons.logout,
//                     size: 20.0, color: Colors.white),
//                 title: Text("Logout"),
//                 textColor: Colors.white,
//                 dense: true,

//                 // padding: EdgeInsets.zero,
//               ),
//             ),
//             SizedBox(
//               height: 0.05.sh,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// // void _updateProgress() {
// //   const oneSec = const Duration(seconds: 1);
// //   new Timer.periodic(oneSec, (Timer t) {
// //     setState(() {
// //       print('${ApiUrl.imagesUrl}${studentpro}');
// //
// //     });
// //   });
// // }
// }
// class ClipPathClass extends CustomClipper<Path> {
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         size.width / 2, size.height - 100, size.width, size.height);
//     path.lineTo(size.width, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(ClipPathClass oldClipper) => true;
// }

