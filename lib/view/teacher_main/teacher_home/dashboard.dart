import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/About_Controller.dart';
import 'package:ecom_desgin/controller/force_logout.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_login_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/About_app/about_e-gayn.dart';
import 'package:ecom_desgin/view/About_app/about_egyan.dart';
import 'package:ecom_desgin/view/teacher_main/S_leave/student_leave.dart';
import 'package:ecom_desgin/view/teacher_main/Teacher_styllebus/Teacher_Syllebus.dart';
import 'package:ecom_desgin/view/teacher_main/exam_shadule/exam_time_table.dart';
import 'package:ecom_desgin/view/teacher_main/exam_shadule/teacher_exam_result.dart';
import 'package:ecom_desgin/view/teacher_main/home_work/teacher_homework.dart';
import 'package:ecom_desgin/view/teacher_main/leave_teacher/ohter_teacher_leave.dart';
import 'package:ecom_desgin/view/teacher_main/student_information/Attendance.dart';
import 'package:ecom_desgin/view/teacher_main/student_information/student%20_information.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_attendance/Teacher_attendance.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_fees/student_fees_display.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_home/teacher_home.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_notification/teacher_notificaion.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_payroll/teacher_payroll.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_profile/teacher_profile.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_upload_content/upload_content.dart';
import 'package:ecom_desgin/view/teacher_main/time_table_t/teacher_class_time_table.dart';
import 'package:ecom_desgin/view/teacher_main/time_table_t/teacher_time_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class Tdashboard extends StatefulWidget {
  @override
  State<Tdashboard> createState() => _TdashboardState();
}

class _TdashboardState extends State<Tdashboard>
    with TickerProviderStateMixin {
  final GetSchoolSettingController _schoolsetting =
  Get.put(GetSchoolSettingController());
      final ForceLogout forceLogout = Get.put(ForceLogout());
       TeacherLoginController teacherLoginController=Get.put(TeacherLoginController());
final AboutController aboutController = Get.put(AboutController());
  late AnimationController _controller;
  // late AnimationController controller;
  // late Animation colorAnimation;
  // late Animation sizeAnimation;
var schoolname;
var session;
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
  var box = Hive.box("schoolData");
  @override
  void initState() {
    super.initState();
          var  role_flag = box.get("role_flag"); 
    if(role_flag.toString()=="P"){
     var parent_id = box.get("parent_id").toString();
       forceLogout.forceLogout(parent_id, context);
}
          var  student_id = box.get("student_id");
          var  student_login = box.get("student_login");
       if(student_login=="student_login"){   
        forceLogout.forceLogout(student_id, context);
       }
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.3,
    );
    _controller.addListener(() => setState(() {}));
    TickerFuture tickerFuture = _controller.repeat(reverse: true);
    tickerFuture.timeout(Duration(seconds: 3 * 10), onTimeout: () {
      _controller.forward(from: 0);
      _controller.stop(canceled: true);
    });

    schoolname = box.get("schoolname");
    session = box.get("session");
/////////////teacher login student info show

 var activestudentinfo = box.get("activatestudentInfo");
print("TTTTTTTTTTTTTTTTTTTTTT");
print(activestudentinfo);
if(activestudentinfo.toString().toLowerCase()=="teacher"){
           teacherLoginController.activatestudentInfo.value=true; 

        }else{
        teacherLoginController.activatestudentInfo.value=false; 
        }




  }
@override
  void dispose(){
 _controller.dispose();
 
  super.dispose();
}
  //  double _width=500;
  //  double _height=500;
  // final Tween<double> _scaleTween=Tween<double>(begin:1,end:2);
  int index = 0;
  final color1 = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    // Colors.white,
    // Colors.white,
    // Colors.white,
    // Colors.white,
    // Colors.white,
    // Colors.white,
  ];
  final color2 = [
    Colors.red,
    Colors.amber,
    Colors.greenAccent,
    Colors.green,
    // Colors.blue,
    // Colors.lightBlueAccent,
    // Colors.deepPurple,
    // Colors.deepPurpleAccent,
    // Colors.lightBlueAccent,
    // Colors.cyan,
  ];

  final trailing = [
    "Profile",
    "Payroll",
    "Attendance",
    "Leave",
    // "Examination",
    // "HomeWork",
    // "Download",
    // "Time Table",
    // "Download center",
    // "Chat"
  ];
  final icons1 = const [
    Icon(
      Icons.supervised_user_circle,
      size: 25,
      color: Colors.red,
    ),
    Icon(
      Icons.payment,
      size: 25,
      color: Colors.amber,
    ),
    Icon(
      Icons.currency_exchange,
      size: 25,
      color: Colors.greenAccent,
    ),
    Icon(
      Icons.calendar_month,
      size: 25,
      color: Colors.green,
    ),
    // Icon(
    //   Icons.people_sharp,
    //   size: 25,
    //   color: Colors.blue,
    // ),
    // Icon(
    //   Icons.people,
    //   size: 25,
    //   color: Colors.lightBlueAccent,
    // ),
    // Icon(
    //   Icons.hourglass_bottom_outlined,
    //   size: 25,
    //   color: Colors.deepPurple,
    // ),
    // Icon(
    //   Icons.download_for_offline,
    //   size: 25,
    //   color: Colors.deepPurpleAccent,
    // ),
    // Icon(
    //   Icons.check_circle_rounded,
    //   size: 25,
    //   color: Colors.lightBlueAccent,
    // ),
    // Icon(
    //   Icons.favorite,
    //   size: 25,
    //   color: Colors.cyan,
    // ),
  ];



  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: Colors.blue,
      key: _sideMenuKey,
      menu: buildMenu(),
      
      type: SideMenuType.shrikNRotate,
      onChange: (isOpened) {
        setState(() => isOpened = isOpened);
                     var  student_id = box.get("student_id");
          var  student_login = box.get("student_login");
       if(student_login=="student_login"){   
        forceLogout.forceLogout(student_id, context);
       }
      },
      child: IgnorePointer(
        ignoring: isOpened,
        child: Scaffold(
          appBar: AppBar(
            // centerTitle: true,
            leading: IconButton(

              icon: const Icon(Icons.menu,),

              onPressed: () => toggleMenu(),
            ),
            automaticallyImplyLeading: false,
            backgroundColor:AgentColor.appbarbackgroundColor,
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
                          Navigator.push( context, MaterialPageRoute( builder: (context) => const AboutEgyan(),));
                            
                            }    
                              },
                            )
            ],
          ),
         
          
          body: Padding(
                         padding: const EdgeInsets.only(top: 10, left: 25, right: 25).r,
                         child: GridView(
                           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                             maxCrossAxisExtent: 200.0,
                             crossAxisSpacing: 3.0,
                             childAspectRatio: 1.1,
                           ),
                           children: List.generate(4, (index) {
                             return Padding(
                               padding:
                                   const EdgeInsets.only(left: 1, right: 1, bottom: 5),
                               child: ScaleTransition(
                                 scale: Tween(begin: 0.9, end: 1.0).animate(
                                   CurvedAnimation(
                                       parent: _controller, curve: Curves.linear),
                                 ),
                                 child: InkWell(
                                         onTap: () { 
                                          print(index);               
                                          if(index==0){Get.to( TeacherProfile());}
                                          if(index==1){Get.to(TeacherPayroll());}
                                          if(index==2){Get.to(TeacherAttendance());}
                                          if(index==3){Get.to(const TeacherLeaveStatus());}
                                          // if(index==4){Get.toNamed(RoutesName.examination);}
                                          // if(index==5){Get.toNamed(RoutesName.homeWork);}
                                          // if(index==6){Get.toNamed(RoutesName.downloadAll);}
                                          // if(index==7){Get.toNamed(RoutesName.timetable);}

                                         },
                                   child: Card(
                                     elevation: 10,
                                     shape: RoundedRectangleBorder(
                                         borderRadius: const BorderRadius.only(
                                             topLeft: Radius.circular(10),
                                             bottomLeft: Radius.circular(10),
                                             bottomRight: Radius.circular(10),
                                             topRight: Radius.circular(10)),
                                         side: BorderSide(
                                           width: 5,
                                           color: color2[index],
                                         )),
                                     color: color2[index],
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Container(
                                           decoration: BoxDecoration(
                                               color: (color1[index]),
                                               borderRadius: BorderRadius.circular(25)),
                                           width: 0.13.sw,
                                           height: 0.063.sh,
                                                                 
                                           // backgroundColor: Colors.amberAccent,
                                                                 
                                           child: (icons1[index]),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(8.0).r,
                                           child: Container(
                                             child: Text(
                                               trailing[index],
                                               style: GoogleFonts.dmSans(
                                                 fontStyle: FontStyle.normal,
                                                 fontSize: 15.sp,
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.white,
                                               ),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             );
                           }),
                         ),
                         ),
          bottomNavigationBar: Container(
              color: Color.fromARGB(255, 196, 236, 255),
            child: Row(
                 
                  children: [
                    Padding(
padding:  EdgeInsets.only(left: 0.09.sw),
child: Image.asset("assets/images/appstore.png",width: 50,height: 50,),
),
                     Padding(
                       padding:  EdgeInsets.only(left: 0.05.sw,top: 10),
                       child: const Text("Powered By :-"),
                     ),
                    Image.asset(
                      "assets/images/b.png",
                      width: 0.4.sw,
                      height: 0.070.sh,
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
Widget buildMenu() {
    
    return SingleChildScrollView(
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
                SizedBox(height: 20.0),
              ],
            ),
          ),
          SizedBox(
            height: 0.052.sh,
            child: ListTile(
    onTap: () => Get.to(TeacherHome()),
              leading:
                  const Icon(Icons.home, size: 20.0, color: Colors.white),
              title: const Text("Home"),
              textColor: Colors.white,
              dense: true,
            ),
          ),

          // SizedBox(
          //   height: 0.052.sh,
          //   child: ListTile(
          //     onTap: () {Get.to(StudentInformation());},
          //
          //     leading: const Icon(Icons.verified_user,
          //         size: 20.0, color: Colors.white),
          //     title: const Text("Student Information"),
          //     textColor: Colors.white,
          //     dense: true,
          //
          //     // padding: EdgeInsets.zero,
          //   ),
          // ),

          // SizedBox(
          //   height: 0.052.sh,
          //   child: ListTile(
          //     onTap: () {Get.to(AttandanceAdd());},
          //     leading: const Icon(Icons.present_to_all,
          //         size: 20.0, color: Colors.white),
          //     title: const Text("Attendance"),
          //     textColor: Colors.white,
          //     dense: true,
          //
          //     // padding: EdgeInsets.zero,
          //   ),
          // ),
          // ListTileTheme(
          //   dense: true,
          //   child: ExpansionTile(
          //     collapsedIconColor: Colors.white,
          //     textColor: Colors.white,
          //     title: Text(
          //       "Exmaination",
          //       style: GoogleFonts.dmSans(
          //         fontStyle: FontStyle.normal,
          //         fontSize: 14.sp,
          //         color: Colors.white,
          //       ),
          //     ),
          //     leading: const Icon(Icons.border_color_rounded,
          //         size: 20.0, color: Colors.white),
          //
          //     childrenPadding: EdgeInsets.only(left: 60), //children padding
          //     children: [
          //       SizedBox(
          //         height: 0.052.sh,
          //         child: ListTile(
          //
          //           title: Text(
          //             "Exam Time ",
          //             style: GoogleFonts.dmSans(
          //               fontStyle: FontStyle.normal,
          //               fontSize: 14.sp,
          //               color: Colors.white,
          //             ),
          //           ),
          //
          //         ),
          //       ),
          //
          //       SizedBox(
          //         height: 0.062.sh,
          //         child: ListTile(
          //           title: Text(
          //             "Result",
          //             style: GoogleFonts.dmSans(
          //               fontStyle: FontStyle.normal,
          //               fontSize: 14.sp,
          //               color: Colors.white,
          //             ),
          //           ),
          //
          //         ),
          //       ),
          //
          //       //more child menu
          //     ],
          //   ),
          // ),
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

              childrenPadding: EdgeInsets.only(left: 60), //children padding
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
                    onTap: () {Get.to(TeacherLeaveStatus());},
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
                                     leading: const Icon(Icons.info,
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
                              leading: const Icon(Icons.access_time_filled_outlined,
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

                                  Get.to(const HomeWork());

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
                              leading: const Icon(Icons.book,
                                  size: 20.0, color: Colors.white),

                              childrenPadding: const EdgeInsets.only(left: 70), //children padding
                              children: [
                                SizedBox(
                                  height: 0.062.sh,
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(const TeacherExamTimeTable());



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
          // ListTileTheme(
          //   dense: true,
          //   child: ExpansionTile(
          //     collapsedIconColor: Colors.white,
          //     textColor: Colors.white,
          //     title: Text(
          //       "Report",
          //       style: GoogleFonts.dmSans(
          //         fontStyle: FontStyle.normal,
          //         fontSize: 14.sp,
          //         color: Colors.white,
          //       ),
          //     ),
          //     leading: const Icon(Icons.report,
          //         size: 20.0, color: Colors.white),
          //
          //     childrenPadding: EdgeInsets.only(left: 60), //children padding
          //     children: [
          //       SizedBox(
          //         height: 0.062.sh,
          //         child: ListTile(
          //           title: Text(
          //             "Finace",
          //             style: GoogleFonts.dmSans(
          //               fontStyle: FontStyle.normal,
          //               fontSize: 14.sp,
          //               color: Colors.white,
          //             ),
          //           ),
          //
          //         ),
          //       ),
          //       //more child menu
          //     ],
          //   ),
          // ),
          // ListTileTheme(
          //   dense: true,
          //   child: ExpansionTile(
          //     collapsedIconColor: Colors.white,
          //     textColor: Colors.white,
          //     title: Text(
          //       "Class Time Table",
          //       style: GoogleFonts.dmSans(
          //         fontStyle: FontStyle.normal,
          //         fontSize: 14.sp,
          //         color: Colors.white,
          //       ),
          //     ),
          //     leading: const Icon(Icons.timer,
          //         size: 20.0, color: Colors.white),
          //
          //     childrenPadding: EdgeInsets.only(left: 60), //children padding
          //     children: [
          //       SizedBox(
          //         height: 0.062.sh,
          //         child: ListTile(
          //           title: Text(
          //             "Class Time Table",
          //             style: GoogleFonts.dmSans(
          //               fontStyle: FontStyle.normal,
          //               fontSize: 14.sp,
          //               color: Colors.white,
          //             ),
          //           ),
          //           onTap:(){Get.to(ClassTimeTable());}
          //         ),
          //       ),
          //       SizedBox(
          //         height: 0.062.sh,
          //         child: ListTile(
          //           title: Text(
          //             "Time Table",
          //             style: GoogleFonts.dmSans(
          //               fontStyle: FontStyle.normal,
          //               fontSize: 14.sp,
          //               color: Colors.white,
          //             ),
          //           ),
          //           onTap:(){Get.to(TimeTableTeacher());}
          //         ),
          //       ),
          //       //more child menu
          //     ],
          //   ),
          // ),

          // ListTileTheme(
          //   dense: true,
          //   child: ExpansionTile(
          //     collapsedIconColor: Colors.white,
          //     textColor: Colors.white,
          //     title: Text(
          //       "Download center",
          //       style: GoogleFonts.dmSans(
          //         fontStyle: FontStyle.normal,
          //         fontSize: 14.sp,
          //         color: Colors.white,
          //       ),
          //     ),
          //     leading: const Icon(Icons.report,
          //         size: 20.0, color: Colors.white),
          //
          //     childrenPadding: EdgeInsets.only(left: 60), //children padding
          //     children: [
          //
          //       SizedBox(
          //         height: 0.062.sh,
          //         child: ListTile(
          //             title: Text(
          //               "Upload Content",
          //               style: GoogleFonts.dmSans(
          //                 fontStyle: FontStyle.normal,
          //                 fontSize: 14.sp,
          //                 color: Colors.white,
          //               ),
          //             ),
          //             onTap:(){Get.to(UploadContent());}
          //         ),
          //       ),
          //       //more child menu
          //     ],
          //   ),
          // ),


          // SizedBox(
          //   height: 0.052.sh,
          //   child:  ListTile(
          //     onTap: () {Get.to(HomeWork());},
          //     leading: Icon(Icons.book,
          //         size: 20.0, color: Colors.white),
          //     title: Text("HomeWork"),
          //     textColor: Colors.white,
          //     dense: true,
          //
          //     // padding: EdgeInsets.zero,
          //   ),
          // ),

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
              leading: Icon(Icons.notifications,
                  size: 20.0, color: Colors.white),
              title: Text("Notification"),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(
            height: 0.052.sh,
            child: const ListTile(

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
              leading: Icon(Icons.logout,
                  size: 20.0, color: Colors.white),
              title: Text("Aobut School"),
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
    );
  }
}









