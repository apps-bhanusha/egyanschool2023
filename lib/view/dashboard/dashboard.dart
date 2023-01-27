import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getclasstimetable_controller.dart';
import 'package:ecom_desgin/controller/getexamsResult_controller.dart';
import 'package:ecom_desgin/controller/getexamsSchedule_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/parent_login.dart';
import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/calender/attendance.dart';
import 'package:ecom_desgin/view/examination/Exam_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class GridViewall extends StatefulWidget {
  @override
  State<GridViewall> createState() => _GridViewallState();
}

class _GridViewallState extends State<GridViewall>
    with TickerProviderStateMixin {
  var schoolname;
  var session;
  GetclassTimeTableController GetclassTimeTable=Get.put(GetclassTimeTableController());
  GetexamsResultController GetexamsResult=Get.put(GetexamsResultController());

  GetexamsScheduleController getexamview=Get.put(GetexamsScheduleController());
  final UserNameController _allsetController = Get.put(UserNameController());
  ParentLoginController parentLoginController=Get.put(ParentLoginController());

  final GetSchoolSettingController _schoolsetting =
  Get.put(GetSchoolSettingController());
  late AnimationController _controller;
  // late AnimationController controller;
  // late Animation colorAnimation;
  // late Animation sizeAnimation;

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
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  final color2 = [
    Colors.red,
    Colors.amber,
    Colors.greenAccent,
    Colors.green,
    Colors.blue,
    Colors.lightBlueAccent,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.lightBlueAccent,
    Colors.cyan,
  ];

  final trailing = [
    "Home",
    "Profile",
    "Attendance",
    "Fees",
    "Examination",
    "HomeWork",
    "Download",
    "Time Table",
    "Download center",
    "Chat"
  ];
  final icons1 = const [
    Icon(
      Icons.home,
      size: 25,
      color: Colors.red,
    ),
    Icon(
      Icons.people_rounded,
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
    Icon(
      Icons.people_sharp,
      size: 25,
      color: Colors.blue,
    ),
    Icon(
      Icons.people,
      size: 25,
      color: Colors.lightBlueAccent,
    ),
    Icon(
      Icons.hourglass_bottom_outlined,
      size: 25,
      color: Colors.deepPurple,
    ),
    Icon(
      Icons.download_for_offline,
      size: 25,
      color: Colors.deepPurpleAccent,
    ),
    Icon(
      Icons.check_circle_rounded,
      size: 25,
      color: Colors.lightBlueAccent,
    ),
    Icon(
      Icons.favorite,
      size: 25,
      color: Colors.cyan,
    ),
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
                    PopupMenuItem(child: InkWell(child: Text('Logout'),
                      onTap:() async { await SessionManager().remove("name");
                      Get.toNamed(RoutesName.schoolId);
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
                      },), value: 0),
                    PopupMenuItem(child: Text('about'), value: 1),
                  ];
                },
              ),
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
                           children: List.generate(8, (index) {
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
                                          if(index==0){Get.toNamed(RoutesName.home,arguments: ['',false]);}
                                          if(index==1){Get.toNamed(RoutesName.profile);}
                                          if(index==2){Get.toNamed(RoutesName.attendance);}
                                          if(index==3){Get.toNamed(RoutesName.fees);}
                                          if(index==4){Get.toNamed(RoutesName.examination);}
                                          if(index==5){Get.toNamed(RoutesName.homeWork);}
                                          if(index==6){Get.toNamed(RoutesName.downloadAll);}
                                          if(index==7){Get.toNamed(RoutesName.timetable);}

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
            child: Image.asset(
              "assets/images/b.png",
              width: MediaQuery.of(context).size.width,
              height: 0.070.sh,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
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
                          : CircularProgressIndicator())),
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
                onTap: () {

                  Get.toNamed(RoutesName.home,arguments: ['',false]);
                },
                leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
                title: const Text("Home"),
                textColor: Colors.white,
                dense: true,
              ),
            ),
    Visibility(
    visible:parentLoginController.loadingdata.value ,
     child: ListTileTheme(
                dense: true,
     
                child:parentLoginController.parentStudentListModel.value!=null? ExpansionTile(
     expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  collapsedIconColor: Colors.white,
                  textColor: Colors.white,
                  title: Text(
                    "Select Student",
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 14.sp,
     
                      color: Colors.white,
                    ),
                  ),
                  leading: const Icon(Icons.book_outlined,
                      size: 20.0, color: Colors.white),
                  childrenPadding: const EdgeInsets.only(left: 60), //children padding
                   
     
                   //children padding
                  children: [
                    for(int index=0;index<=parentLoginController.parentStudentListModel.value!.response!.length-1;index++)
                     Obx(() =>    ListTile(
                          title:  Text( "${ parentLoginController.parentStudentListModel.value?.response?[index]?.name}",
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),),
                           onTap: () {
                                  print("${ parentLoginController.parentStudentListModel.value?.response?[index]?.studentId}"); 
                                  Get.toNamed(RoutesName.home,arguments: [
                                    "${ parentLoginController.parentStudentListModel.value?.response?[index]?.studentId}",
                                    true,
                                  "${ parentLoginController.parentStudentListModel.value?.response?[index]?.fee?.totalAmount}",
                                  "${ parentLoginController.parentStudentListModel.value?.response?[index]?.fee?.totalBalanceAmount}",
                                  "${ parentLoginController.parentStudentListModel.value?.response?[index]?.attandance?.present}",
                                  "https://e-gyan.co.in/${parentLoginController.parentStudentListModel.value?.response?[index]?.profileimage}",
                                  "${ parentLoginController.parentStudentListModel.value?.response?[index]?.name}",
                                  "${ parentLoginController.parentStudentListModel.value?.response?[index]?.responseClass}",
                                
                                  ]);  
                            toggleMenu(); 
                           },
                          ),
                   
                
                 ),
                //  Obx(() =>  
                //      ListView.builder(
                //         shrinkWrap: true,
                //         scrollDirection: Axis.vertical,
                //             itemCount: parentLoginController.parentStudentListModel.value?.response!=null ?parentLoginController.parentStudentListModel.value?.response?.length:0,
                //         itemBuilder: (context, index) {
                //         return  ListTile(
                //           title:  Text( "${ parentLoginController.parentStudentListModel.value?.response?[index]?.name}",
                //             style: GoogleFonts.dmSans(
                //               fontStyle: FontStyle.normal,
                //               fontSize: 14.sp,
                //               color: Colors.white,
                //             ),),
                //            onTap: () {
                //                   print("${ parentLoginController.parentStudentListModel.value?.response?[index]?.studentId}"); 
                //                   Get.toNamed(RoutesName.home,arguments: [
                //                     "${ parentLoginController.parentStudentListModel.value?.response?[index]?.studentId}",
                //                     true,
                //                   "${ parentLoginController.parentStudentListModel.value?.response?[index]?.fee?.totalAmount}",
                //                   "${ parentLoginController.parentStudentListModel.value?.response?[index]?.fee?.totalBalanceAmount}",
                //                   "${ parentLoginController.parentStudentListModel.value?.response?[index]?.attandance?.present}",
                //                   "https://e-gyan.co.in/${parentLoginController.parentStudentListModel.value?.response?[index]?.profileimage}",
                //                   "${ parentLoginController.parentStudentListModel.value?.response?[index]?.name}",
                //                   "${ parentLoginController.parentStudentListModel.value?.response?[index]?.responseClass}",
                                
                //                   ]);  
                //             toggleMenu(); 
                //            },
                //           );
                //       },),
                
                //  ),
     
                   
     
                    //more child menu
                  ],
                ):SizedBox(),
              ),
   ),
  
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {
                  Get.toNamed(RoutesName.profile);
                },

                leading: const Icon(Icons.verified_user,
                    size: 20.0, color: Colors.white),
                title: const Text("Profile"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {
                  Get.toNamed(RoutesName.attendance);

                  //
                  // if( studentattendance.AttendanceControllerList[0]["status"]==true){
                  //
                  // }


                },
                leading: const Icon(Icons.present_to_all,
                    size: 20.0, color: Colors.white),
                title: const Text("Attendance"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {
                  Get.toNamed(RoutesName.fees);
                },
                leading: const Icon(Icons.monetization_on,
                    size: 20.0, color: Colors.white),
                title: const Text("Fees"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {
                  Get.toNamed(RoutesName.timetable);
                },
                leading: const Icon(Icons.av_timer_rounded,
                    size: 20.0, color: Colors.white),
                title: const Text("Class Time Table"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () {
                  Get.toNamed(RoutesName.lession);
                },
                leading: const Icon(Icons.play_lesson_outlined,
                    size: 20.0, color: Colors.white),
                title: const Text("Syllabus Status"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            //  ListTile(
            //   onTap: () { Get.toNamed(RoutesName.syllabus);},
            //   leading:
            //       const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white),
            //   title: const Text("Syllabus"),
            //   textColor: Colors.white,
            //   dense: true,

            //   // padding: EdgeInsets.zero,
            // ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.homeWork),
                leading:
                const Icon(Icons.home_work, size: 20.0, color: Colors.white),
                title: const Text("Home Work"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            ListTileTheme(
              dense: true,

              child: ExpansionTile(
                collapsedIconColor: Colors.white,
                textColor: Colors.white,
                title: Text(
                  "Exmaination",
                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,

                    color: Colors.white,
                  ),
                ),
                leading: const Icon(Icons.book_outlined,
                    size: 20.0, color: Colors.white),

                childrenPadding: EdgeInsets.only(left: 60), //children padding
                children: [
                  SizedBox(
                    height: 0.052.sh,
                    child: ListTile(

                        title:  Text("Exam Time ",
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,

                            color: Colors.white,
                          ),),
                        onTap:(){
                          if (getexamview.GetexamsScheduleControllerList!=null){

                            Get.toNamed(RoutesName.examination);
                          }

                        }
                    ),
                  ),

                  SizedBox(
                    height: 0.062.sh,
                    child: ListTile(
                        title:
                        Text("Result",  style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,

                          color: Colors.white,
                        ),),
                        onTap:(){
                          if (GetexamsResult.GetexamsResultControllerList!=null){

                            Get.toNamed(RoutesName.examresult);
                          }

                        }
                    ),
                  ),

                  //more child menu
                ],
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.downloadAll),
                leading:
                const Icon(Icons.download, size: 20.0, color: Colors.white),
                title: const Text("Download"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.062.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.busRoute),
                leading: const Icon(Icons.route, size: 20.0, color: Colors.white),
                title: const Text("Bus Route"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                // onTap: () => Get.toNamed(RoutesName.chatPage),
                leading: const Icon(Icons.chat, size: 20.0, color: Colors.white),
                title: const Text("Chat"),
                textColor: Colors.grey,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.notification),
                leading: const Icon(Icons.rate_review_rounded,
                    size: 20.0, color: Colors.white),
                title: const Text("Notification",),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.teacherreview),
                leading: const Icon(Icons.accessibility,
                    size: 20.0, color: Colors.white),
                title: const Text("Teacher Review"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 0.052.sh,
              child: ListTile(
                onTap: () => Get.toNamed(RoutesName.leavestatus),
                leading: const Icon(Icons.notifications,
                    size: 20.0, color: Colors.white),
                title: const Text("Leave Status"),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ),
            // ExpansionTile(
            //   collapsedIconColor: Colors.white,
            //   textColor: Colors.white,
            //   title: Text(
            //     "Leave",
            //     style: GoogleFonts.dmSans(
            //       fontStyle: FontStyle.normal,
            //       fontSize: 14.sp,
            //
            //       color: Colors.white,
            //     ),
            //   ),
            //   leading: const Icon(Icons.book_outlined,
            //       size: 20.0, color: Colors.white), //add icon
            //   childrenPadding: EdgeInsets.only(left: 60), //children padding
            //   children: [
            //     ListTile(
            //       title:  Text("Add Leave",
            //         style: GoogleFonts.dmSans(
            //           fontStyle: FontStyle.normal,
            //           fontSize: 14.sp,
            //
            //           color: Colors.white,
            //         ),),
            //       onTap: () => Get.toNamed(RoutesName.addleave),
            //     ),
            //
            //     ListTile(
            //       title:
            //       Text("Leave Status",  style: GoogleFonts.dmSans(
            //         fontStyle: FontStyle.normal,
            //         fontSize: 14.sp,
            //
            //         color: Colors.white,
            //       ),),
            //       onTap: () => Get.toNamed(RoutesName.leavestatus),
            //     ),
            //
            //     //more child menu
            //   ],
            // ),
            SizedBox(
              height: 0.05.sh,
            ),
            // Container(
            //   color: Colors.white,
            //   height: 0.080.sh,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         child: Text(
            //           "Powered by",
            //           style: GoogleFonts.dmSans(
            //             fontStyle: FontStyle.normal,
            //             fontSize: 15.sp,
            //             fontWeight: FontWeight.bold,
            //             color: Color.fromARGB(255, 196, 236, 255),
            //           ),
            //         ),
            //       ),
            //       Image.asset(
            //         "assets/images/b.png",
            //         height: 0.13.sh,
            //         width: 0.35.sw,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}









