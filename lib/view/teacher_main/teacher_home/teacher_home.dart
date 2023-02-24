import 'dart:async';
import 'package:ecom_desgin/Widgets/footer_widget.dart';
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';

import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/About_Controller.dart';
import 'package:ecom_desgin/controller/force_logout.dart';
import 'package:ecom_desgin/controller/getexamsSchedule1_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/noticeboard_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/staff_detial_contriller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_login_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_time_table_controller.dart';

import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/About_app/about_e-gayn.dart';
import 'package:ecom_desgin/view/About_app/about_egyan.dart';
import 'package:ecom_desgin/view/teacher_main/S_leave/student_leave.dart';
import 'package:ecom_desgin/view/teacher_main/Teacher_home_work/teacher_homework.dart';
import 'package:ecom_desgin/view/teacher_main/Teacher_syllabus/Teacher_Syllebus.dart';
import 'package:ecom_desgin/view/teacher_main/exam_shadule/exam_time_table.dart';
import 'package:ecom_desgin/view/teacher_main/exam_shadule/teacher_exam_result.dart';
import 'package:ecom_desgin/view/teacher_main/staffAttendance/staff_attendance_scan.dart';
import 'package:ecom_desgin/view/teacher_main/student_information/Attendance.dart';
import 'package:ecom_desgin/view/teacher_main/student_information/student%20_information.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_attendance/Teacher_attendance.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_fees/student_fees_display.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_home/dashboard.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_notification/teacher_notificaion.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_payroll/teacher_payroll.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_profile/teacher_profile.dart';
import 'package:ecom_desgin/view/teacher_main/time_table_t/teacher_class_time_table.dart';
import 'package:ecom_desgin/view/teacher_main/time_table_t/teacher_time_table.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'package:hive/hive.dart';
import '../leave_teacher/ohter_teacher_leave.dart';
import '../teacher_upload_content/upload_content.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller1;
  late Animation<Offset> _Animation;
  final StaffDetailController staffdetailsController = Get.put(StaffDetailController());
  final NoticBoardController noticBoardController = Get.put(NoticBoardController());
      final GetSchoolSettingController _schoolsetting = Get.put(GetSchoolSettingController());
      final ForceLogout forceLogout = Get.put(ForceLogout());
      final AboutController aboutController = Get.put(AboutController());
       TeacherLoginController teacherLoginController=Get.put(TeacherLoginController());
  GetexamsSchedule1Controller getexamview1=Get.put(GetexamsSchedule1Controller());

bool teachervisible=false;
  int totalSecs = 90;
  int secsRemaining = 90;
  double progressFraction = 0.6;
  int percentage = 0;
  var username;
  var password;
  var present;
var schoolname;
var session;
  late Timer timer;
  get progress => progressFraction;
  DateTime now = DateTime.now();
  late int lastday = DateTime(now.year, now.month + 1, 0).day;
  late int days = lastday;
  double progressFraction1 = 0.0;
  double percentage1 = 0;
  late Timer timer1;
  get progress1 => progressFraction1;
  var box = Hive.box("schoolData");
  

  @override
  void initState() {

    var id=box.get("staff_id");
    var companyKey=box.get("company_key");
_schoolsetting.GetSchoolSettingapi(companyKey);
  forceLogout.forceLogout(id, context);
    print("staffidd");
    print(id);
    staffdetailsController.staffDetail(id);
 schoolname = box.get("schoolname");
 session = box.get("session");
 var activestudentinfo = box.get("activatestudentInfo");
    var role_flag = box.get("role_flag");
    noticBoardController.noticBoardapi(role_flag);
    super.initState();
if(activestudentinfo.toString().toLowerCase()=="teacher"){

           teacherLoginController.activatestudentInfo.value=true; 

        }else{
        teacherLoginController.activatestudentInfo.value=false; 
        }

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.1, 0.0))
            .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..repeat(reverse: true);
    _Animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0.1, 0.0))
        .animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.linear,
    ));
    // _controller.repeat(reverse: true);
    // _controller =  AnimationController(vsync: this, duration: Duration(seconds: 6));
    // colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    // sizeAnimation = Tween<double>(begin: 400.0, end: 400.0).animate(controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();

    super.dispose();
  }

  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  _getRequests(){
var id=box.get("staff_id");
    print("staffidd");
    print(id);
    staffdetailsController.staffDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          const AlwaysScrollableScrollPhysics();
          setState(() {});
 
        },
        child: SafeArea(
            child: SideMenu(
                background: Colors.blue,
                key: _sideMenuKey,
                menu: buildMenu(),
                type: SideMenuType.shrikNRotate,
                onChange: (isOpened) {
                  setState(() => isOpened = isOpened);
                   var id=box.get("staff_id");
                  forceLogout.forceLogout(id, context);
                },
                child: IgnorePointer(

                    ignoring: isOpened,
                    child: Scaffold(
                     appBar: AppBar(
                          // centerTitle: true,
                          leading: IconButton(
                            icon: const Icon(
                              Icons.menu,
                            ),
                            onPressed: () => toggleMenu(),
                          ),
                          automaticallyImplyLeading: false,
                         backgroundColor: Theme.of(context).primaryColor,
                          // iconTheme: IconThemeData(color: Colors.black),
                          title: Row(
                            children: [
                              SizedBox(
                                  width: 0.45.sw,
                                  child:  Text(
                                    schoolname??"",
                                    // _schoolsetting.GetSchoolSettingControllerList[0]["response"]["name"],
                                    style: MyGoogeFont.mydmSans1,
                                    overflow: TextOverflow.ellipsis,
                                    
                                  )

                              ),


                            ],
                          ),
                          actions: [
                        Padding(
                        padding: const EdgeInsets.only(left: 0, top: 10).r,
                      child: Column(
                        children: [
                          Text(
                            'Session',
                            style: MyGoogeFont.mydmSans2,
                          ),
                          Text(
                            session??"",
                            // _schoolsetting.GetSchoolSettingControllerList[0]["response"]["session"],
                            style: MyGoogeFont.mydmSans2,
                          ),
                        ],
                      ),
                    ),
                            PopupMenuButton<int>(
                              itemBuilder: (context)  {

                                return <PopupMenuEntry<int>>[
                                 const PopupMenuItem(value: 0, child: Text('Logout'),),
                                 const PopupMenuItem(value: 1, child: Text("About E-Gyan"),
                      
                            ),
                            //    PopupMenuItem(value: 1, child: const Text('AboutE-Gyan'),
                          
                            // ),
                                ];
                              },
                              onSelected: (value) async {
                                if(value==0){
                            await SessionManager().remove("name");
                        // await SessionManager().remove("parentlogin");
                            Get.offAllNamed(RoutesName.schoolId);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("logout", style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                              ),
                                backgroundColor: Colors.white,
                              ),
                            );
                            
                                }

                            if(value==1){
                    aboutController.isloading.value=false;

                          aboutController.aboutEgyan();
                          // ignore: use_build_context_synchronously
                          Navigator.push( context, MaterialPageRoute( builder: (context) => const AboutEgyan(),));
                            
                            }    
                              },
                            ),
                          ],
                        ),
                        body: Column(children: [
                          Stack(children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 0, right: 0).r,
                              child: ClipPath(
                                clipper: ClipPathClass(),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 0.220.sh,
                                  child: Image.asset(
                                    "assets/images/planall.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                      left:18, right: 15, top: 70.0)
                                  .r,
                              child:  Stack(
                                children: <Widget>[
                                  Card(
                                    color: Colors.grey[200],
                                    child: SizedBox(
                                      height: 0.145.sh,
                                      width: 0.87.sw,

                                    ),
                                  ),

                                  Positioned(
                            left: 0.10.sw,
                                    top: 0.015.sh,
                                    child: InkWell(
                                      onTap: (){
                                        print("allimsage");
                                        print(staffdetailsController.staffDetailModel.value?.response.image);
                                      },
                                      child: Row(
                                        children: [
                                       Obx(()=> staffdetailsController.isloding.value?
                                          staffdetailsController.staffDetailModel.value?.response.image!=null?staffdetailsController.staffDetailModel.value?.response.image!= "uploads/staff_images/5/" ? FractionalTranslation(
                                                translation: const Offset(0.0, -0.0),
                                                child: Align(
                                                    alignment: const FractionalOffset(0.5, 0.5),
                                                    child: CircleAvatar(
                                                        maxRadius: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width +
                                                            39,
                                                        minRadius: 20,
                                                        foregroundImage:
                                                        NetworkImage("${ApiUrl.imagesUrl.toString()}${staffdetailsController.staffDetailModel.value?.response.image}")

                                                        ,
                                                    )


                                                ),
                                              ): FractionalTranslation(
                                                translation: const Offset(0.0, -0.0),
                                                child: Align(
                                                    alignment: const FractionalOffset(0.5, 0.5),
                                                    child: CircleAvatar(
                                                        maxRadius: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width +
                                                            39,
                                                        minRadius: 20,
                                                        foregroundImage: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")

                                                        ,
                                                        // radius: 54.0,
                                                        backgroundImage:
                                                        const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
                                                    )


                                                ),
                                              ):FractionalTranslation(
                translation: const Offset(0.0, -0.0),
          child: Align(
              alignment: const FractionalOffset(0.5, 0.5),
              child: CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width +
                      39,
                  minRadius: 20,
                  foregroundImage: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")

                  ,
                  // radius: 54.0,
                  backgroundImage:
                  const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
              )


          ),
        ):FractionalTranslation(
                                         translation: const Offset(0.0, -0.0),
                                         child: Align(
                                             alignment: const FractionalOffset(0.5, 0.5),
                                             child: CircleAvatar(
                                                 maxRadius: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width +
                                                     39,
                                                 minRadius: 20,
                                                 foregroundImage: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")

                                                 ,
                                                 // radius: 54.0,
                                                 backgroundImage:
                                                 const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
                                             )


                                         ),
                                       )
    ),

                            //             Obx(()=>
                            //                staffdetailsController.isloding.value?ClipRRect(
                            //                 // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                            //                 child:   CircleAvatar(
                            //                   radius: 42.0,
                            //                   backgroundImage:
                            //                   NetworkImage("${ApiUrl.imagesUrl.toString()}${staffdetailsController.staffDetailModel.value?.response.image}"),
                            //                 ),
                            //               ):const ClipRRect(
                            //   // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                            //   child:   CircleAvatar(
                            //   radius: 42.0,
                            //   backgroundImage:
                            //   AssetImage("assets/images/user1.png"),
                            // ),),
            // ),

                                          Padding(
                                            padding:  const EdgeInsets.only(left: 8.0).r,
                                            child:Obx(()=>
                                              staffdetailsController.isloding.value? Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                              '${staffdetailsController.staffDetailModel.value?.response.name.toString().capitalizeFirst} ${staffdetailsController.staffDetailModel.value?.response.surname.toString().capitalizeFirst}',
                                                    style: GoogleFonts.dmSans(
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),

                                                  Text(
                                                    '${staffdetailsController.staffDetailModel.value?.response.email}',
                                                    style: GoogleFonts.dmSans(
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    '${staffdetailsController.staffDetailModel.value?.response.contactNo}',
                                                    style: GoogleFonts.dmSans(
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ):const Text(""),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),

                              GestureDetector(
                                          onTap: () => {
                                             Get.to(Tdashboard()),

                                          },
                                  child: Container(
                                    color: Colors.blue,
                                    height: 0.080.sh,
                                    width: MediaQuery.of(context).size.width,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0.001.sh,
                                          left: 0.06.sw,
                                          child: SlideTransition(
                                            position: _offsetAnimation,
                                            child: Icon(
                                              Icons.arrow_right,
                                              color: Colors.white,
                                              size: 52.sp,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 0.10.sw,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 0.50.sh,
                                            ),
                                            child: SlideTransition(
                                              position: _Animation,
                                              child: Icon(
                                                Icons.arrow_right,
                                                color: Colors.white,
                                                size: 55.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 0.22.sw,
                                          top: 0.025.sh,
                                          child: Text(
                                            "Tap Here For E-GYAN Services",
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
                                  ),
                                ),
                                SizedBox(
                                  height: 0.010.sh,
                                ),
                                // SizedBox(
                                //     height: 0.08.sh,
                                //     // width: 0.500.sw,
                                //     child: Card(
                                //       color: Color.fromARGB(255, 134, 217, 248),
                                //       child: Center(
                                //         child: ScrollLoopAutoScroll(
                                //           duration: Duration(seconds: 200),
                                //           delay: Duration(seconds: 1),
                                //           // delayAfterScrollInput: Duration(seconds: 10),
                                //           enableScrollInput: true,
                                //           scrollDirection: Axis.horizontal,

                                //           child: Row(
                                //             children: [
                                //               // for (var i = 0; i < 3; i++)
                                //               Obx(()=>
                                //                  noticBoardController.noticBoardModel.value?.response.length!=null?Text(
                                //                     Bidi.stripHtmlIfNeeded ('${noticBoardController.noticBoardModel.value?.response[0].title.toString().capitalizeFirst}   ${noticBoardController.noticBoardModel.value?.response[0].message.toString().capitalizeFirst}' ),
                                //                     style: GoogleFonts.dmSans(
                                //                       fontStyle: FontStyle.normal,
                                //                       fontSize: 15.sp,
                                //                       fontWeight: FontWeight.bold,
                                //                       color: Colors.black,
                                //                     ),
                                //                   ):Text("No Event"),
                                //               )
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //     )),

                          teachervisible?Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0).r,
                                      child: Row(

                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                               "Class",
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Container(
                                                height: 0.070.sh,
                                                width: 0.45.sw,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(3),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: const Offset(0, 1),
                                                      blurRadius: 5,
                                                      color: Colors.black.withOpacity(0.3),
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "1st",
                                                    style: GoogleFonts.dmSans(
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 0.030.sw,),
                                          Column(
                                            children: [
                                              Text(
                                                "Section",
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Container(
                                                height: 0.070.sh,
                                                width: 0.45.sw,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(3),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: const Offset(0, 1),
                                                      blurRadius: 5,
                                                      color: Colors.black.withOpacity(0.3),
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "A",
                                                    style: GoogleFonts.dmSans(
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0).r,
                                child: Text(
                                 "Total students/Total Absent",
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
SizedBox(height: 0.0010.sh),
                              Container(
                                height: 0.070.sh,
                                width: 0.45.sw,
                                decoration: BoxDecoration(
                                  color:   Colors.grey[300],
                                  borderRadius:  BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "20/5",
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color:  Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                                SizedBox(height: 0.010.sh),
                      SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0).r,
                                      child: Row(
                                        children: [
                                          for (var i = 0; i < 3; i++)
                                            InkWell(
                                              onTap: () {},
                                              child: Card(

                                                elevation: 10,
                                                child: Container(
                                                  height: 0.10.sh,
                                                  width: 0.50.sw,
                                                  color: Colors.grey[200],
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Mid Sem Winter Exam",
                                                        style:
                                                            GoogleFonts.dmSans(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.015.sh,
                                                      ),
                                                      Text(
                                                        "20 to 27 Exam ",
                                                        style:
                                                            GoogleFonts.dmSans(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.lightBlue,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),

        ])

    )
    )]


                                ):Obx(()=>staffdetailsController.staffDetailModel.value!=null?
                                Column(
                            children: [
                              SizedBox(height: 0.040.sh,),
                              Padding(
                                  padding: const EdgeInsets.only(left: 4.0 ,top:8.0).r,
                                  child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                                        child:
                                          Image.asset(
                                            "assets/images/man12.jpg",
                                            fit: BoxFit.cover,
height: 0.10.sh,
                                            width: 0.32.sw,
                                          ),

                                      ),
                                      // ClipRRect(
                                      //   // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                                      //   child:   CircleAvatar(
                                      //     radius: 25.0,
                                      //     backgroundImage:
                                      //     AssetImage(
                                      //       "assets/images/watch3.png",
                                      //
                                      //     ),
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                "Time In",
                                                  style: GoogleFonts.dmSans(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color(0xFF26C6DA),
                                                  ),
                                                ),
                                                '${staffdetailsController.staffDetailModel.value?.inoutTime.inTime}'!="null"?Text('${staffdetailsController.staffDetailModel.value?.inoutTime.inTime}', style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(0xFF26C6DA),
                                                ),):const Text("")

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          ClipRRect(
                                            // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                                            child:
                                          Image.asset(
                                                "assets/images/man13.jpg",
                                            // fit: BoxFit.cover,
                                            height: 0.1.sh,
                                            width: 0.20.sw,
                                              ),

                                          ),

                                          Column(
                                            children: [
                                              Text(
                                               "Time Out",
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AgentColor.AttenanceColor,
                                                ),
                                              ),
                                              '${staffdetailsController.staffDetailModel.value?.inoutTime.outTime}'!="null"?Text('${staffdetailsController.staffDetailModel.value?.inoutTime.outTime}', style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AgentColor.AttenanceColor,
                                              ),):const Text(""),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                              ),
SizedBox(height: 0.0220.sh,),
                              Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        //  Get.to(const Scanner());
                                         Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const Scanner()),);
        // .then((val)=>val?_getRequests():null);
                                      //  if(teachervisible==false){
                                      //    teachervisible=true;
                                      //    setState(() {
                               
                                      //    });
                                      //  }
                                      },

                                      child: Container(
                                        height: 0.070.sh,
                                        width: 0.55.sw,
                                        decoration: BoxDecoration(
                                          color: AgentColor.AttenanceColor,
                                          borderRadius:BorderRadius.circular(60),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 1),
                                              blurRadius: 20,
                                              spreadRadius: 5,
                                              color: Colors.black.withOpacity(0.10),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "SAVE ATTENDANCE",
                                            style: GoogleFonts.dmSans(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color:   teachervisible?Colors.black:Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 0.030.sh,),
                                     RichText(
                                      text: TextSpan(
                                        text: 'Present/Days In Month',
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AgentColor.AttenanceColor,
                                        ),
                                     
                                      ),
                                    ),
                                    SizedBox(height: 0.01.sh,),

                                    Container(
                                      height: 0.070.sh,
                                      width: 0.55.sw,
                                      decoration: BoxDecoration(
                                        color:  AgentColor.AttenanceColor,
                                        borderRadius:BorderRadius.circular(60),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 1),
                                            blurRadius: 20,
                                            spreadRadius: 5,
                                            color: Colors.black.withOpacity(0.10),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                staffdetailsController.staffDetailModel.value?.monthAttendance.present??"",
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color:   teachervisible?Colors.black:Colors.white,
                                                ),
                                              ),
                                                 Text(
                                                "/",
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color:   teachervisible?Colors.black:Colors.white,
                                                ),
                                              ),
                                                  Text(
                                                staffdetailsController.staffDetailModel.value?.monthAttendance.daysinmonth??"",
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color:   teachervisible?Colors.black:Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ),
                                      ),
                                  ],
                              ),

                            ],
                          ):const Text(""),
                                ), ]),
                       bottomNavigationBar:const FooterWidget() 
                            )
                          )
                        )));
  }

   Widget buildMenu() {
    return  SingleChildScrollView(
      child: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                      child: Obx(() => _schoolsetting.loadingimage.value
                          ? Image.network(
                        _schoolsetting.GetSchoolSettingControllerList[0]["response"]["image"],
                        width: 100,
                        height: 100,
                      )
                          : const CircularProgressIndicator())),
                  const SizedBox(height: 16.0),
                  Obx(() => _schoolsetting.loadingimage.value
                      ? Text(
                    _schoolsetting.GetSchoolSettingControllerList[0]
                    ["response"]["name"],
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                      : const Text("")),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child:  ListTile(
   onTap: () {Get.to(Tdashboard());},
                leading:
                    Icon(Icons.home, size: 20.0, color: Colors.white),
                title: Text("Home"),
                textColor: Colors.white,
                dense: true,
              ),
            ),


            ListTileTheme(
              dense: true,
              child: ExpansionTile(
                collapsedIconColor: Colors.white,
                textColor: Colors.white,
                title: Text(
                  "Personal information",
                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
                leading: const Icon(Icons.insert_drive_file_outlined,
                    size: 20.0, color: Colors.white),

                childrenPadding: const EdgeInsets.only(left: 60), //children padding
                children: [
                  SizedBox(
                    height: 0.052.sh,
                    child: ListTile(
                      onTap: () {Get.to(TeacherProfile());},

                      title: Text(
                        "Profile",
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),

                  SizedBox(
                    height: 0.062.sh,
                    child: ListTile(
                      onTap: () {Get.to(TeacherPayroll());},

                      title: Text(
                        "Payroll",
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 0.062.sh,
                    child: ListTile(
                      onTap: () {Get.to(TeacherAttendance());},
                      title: Text(
                        "Attendance",
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 0.062.sh,
                    child: ListTile(
                      onTap: () {Get.to(const TeacherLeaveStatus());},
                      title: Text(
                        "Leave",
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),

                  //more child menu
                ],
              ),
            ),
            Visibility(
              visible:teacherLoginController.activatestudentInfo.value,
         child: ListTileTheme(
                      dense: true,
                      child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        textColor: Colors.white,
                        title: Text(
                          "Student Information",
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                        leading: const Icon(Icons.insert_drive_file_outlined,
                            size: 20.0, color: Colors.white),

                        childrenPadding: const EdgeInsets.only(left: 20), //children padding
                        children: [
                             SizedBox(
                                  height: 0.062.sh,
                                  child: ListTile(
                                     leading: const Icon(Icons.nature_people,
                                  size: 20.0, color: Colors.white),
                                    onTap: () {Get.to(const StudentInformation());},
                                    title: Text(
                                      "Student Details",
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ),
                                ),
                                   SizedBox(
                                  // height: 0.02.sh,
                                  child: ListTile(
                                     leading: const Icon(Icons.present_to_all,
                                  size: 20.0, color: Colors.white),
                                    onTap: () {Get.to(const AttandanceAdd());},
                                    
                                    title: Text(
                                      "Attendance",
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ),
                                ),
                      
                          SizedBox(
                            height: 0.052.sh,
                            child: ListTile(
                              onTap: () {Get.to(const StudentFees());},
                              leading: const Icon(Icons.currency_rupee,
                                  size: 20.0, color: Colors.white),
                              title: Text(
                                "Fees",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),

                            ),
                          ),

                          SizedBox(
                            height: 0.062.sh,
                            child: ListTile(
                              leading: const Icon(Icons.access_time_filled_outlined,
                                  size: 20.0, color: Colors.white),
                              onTap: () {

                                  Get.to(const TeacherClassTimeTable());


                                },

                              title: Text(
                                "Class TimeTable",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),

                            ),
                          ),
                          SizedBox(
                            height: 0.062.sh,
                            child: ListTile(
                              leading: const Icon(Icons.timelapse,
                                  size: 20.0, color: Colors.white),
                              onTap: () {

                                Get.to(const TeacherTimeTable());
                              },

                              title: Text(
                                "Teacher TimeTable",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),

                            ),
                          ),
                          SizedBox(
                            height: 0.062.sh,
                            child: ListTile(
                              leading: const Icon(Icons.upload_file,
                                  size: 20.0, color: Colors.white),
                              onTap: () {Get.to(const UploadContent());},
                              title: Text(
                                "Upload center",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),

                            ),
                          ),

                          SizedBox(
                            height: 0.062.sh,
                            child: ListTile(
                              leading: const Icon(Icons.book_online,
                                  size: 20.0, color: Colors.white),
                              onTap: () {

                                  Get.to(const TeacherHomeWorkDiplay());

                              },
                              title: Text(
                                "HomeWork",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),

                            ),
                          ),
                          ListTileTheme(
                            dense: true,
                            child: ExpansionTile(
                              collapsedIconColor: Colors.white,
                              textColor: Colors.white,
                              title: Text(
                                "Exam",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                              leading: const Icon(Icons.add_comment_outlined,
                                  size: 20.0, color: Colors.white),

                              childrenPadding: const EdgeInsets.only(left: 70), //children padding
                              children: [
                                SizedBox(
                                  height: 0.062.sh,
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(const TeacherExamTimeTable());
                                      getexamview1.loadingGetexamsSchedule1.value = false;
                          },
                                    title: Text(
                                      "Exam Shedule",
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ),
                                ),
                                SizedBox(
                                  // height: 0.02.sh,
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(const ExamResultall());



                                    },
                                    title: Text(
                                      "Exam Result",
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ),
                                ),

                                //more child menu
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.062.sh,
                            child: ListTile(
                              onTap: () {Get.to(const StudentLeave());},
                              leading: const Icon(Icons.leave_bags_at_home,
                                  size: 20.0, color: Colors.white),
                              title: Text(
                                "Leave",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),

                            ),
                          ),
                          SizedBox(
                            height: 0.062.sh,
                            child: ListTile(
                              onTap: () {Get.to(const TeacherSyllebus());},
                              leading: const Icon(Icons.book,
                                  size: 20.0, color: Colors.white),
                              title: Text(
                                "Syllabus",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),

                            ),
                          ), 
                          
                        ],
                      ),
                    ),
       ),


            SizedBox(
              height: 0.052.sh,
              child: const ListTile(
                // onTap: () {Get.toNamed(RoutesName.fees);},
                leading: Icon(Icons.chat,
                    size: 20.0, color: Colors.white),
                title: Text("Chat &Support"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child:  ListTile(
                onTap: () {Get.to(TeacherNotificationPage());},
                leading: const Icon(Icons.notifications,
                    size: 20.0, color: Colors.white),
                title: const Text("Notification"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child:  ListTile(
                  onTap: () async {
                            await SessionManager().remove("name");
                        // await SessionManager().remove("parentlogin");
                            Get.offAllNamed(RoutesName.schoolId);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("logout", style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                              ),
                                backgroundColor: Colors.white,
                              ),
                            );
                            
                                },
                leading: Icon(Icons.logout,
                    size: 20.0, color: Colors.white),
                title: Text("Logout"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
                SizedBox(
            height: 0.052.sh,
            child:  ListTile(
              onTap: (){
                Get.to(const AboutSchool());
              },
              leading: Icon(Icons.info,
                  size: 20.0, color: Colors.white),
              title: const Text("Aobut School"),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
          ),
            SizedBox(
              height: 0.05.sh,
            ),
          ],
        ),
      ),
    );
  }

// void _updateProgress() {
//   const oneSec = const Duration(seconds: 1);
//   new Timer.periodic(oneSec, (Timer t) {
//     setState(() {
//       print('${ApiUrl.imagesUrl}${studentpro}');
//
//     });
//   });
// }
}
class ClipPathClass extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(ClipPathClass oldClipper) => true;
}

