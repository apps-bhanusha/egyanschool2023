import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_desgin/controller/parent_Student_List_Controller.dart';
import 'package:ecom_desgin/controller/parent_login.dart';
import 'package:ecom_desgin/controller/student_login_update_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'dart:async';
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/attendance_controller.dart';
import 'package:ecom_desgin/controller/getSylabusStatus_controller.dart';
import 'package:ecom_desgin/controller/getclasstimetable_controller.dart';
import 'package:ecom_desgin/controller/getexamsResult_controller.dart';
import 'package:ecom_desgin/controller/getexamsSchedule_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:hive/hive.dart';

import '../../controller/student_profile-Controller.dart';

class ParentStudentList extends StatefulWidget {
  const ParentStudentList({super.key});

  @override
  State<ParentStudentList> createState() => _ParentStudentListState();
}

class _ParentStudentListState extends State<ParentStudentList>
    with TickerProviderStateMixin {
  final AttendanceController studentattendance =
      Get.put(AttendanceController());
  var isloading = false;
  final UserNameController _allsetController = Get.put(UserNameController());
  GetclassTimeTableController GetclassTimeTable =
      Get.put(GetclassTimeTableController());
  GetexamsResultController GetexamsResult = Get.put(GetexamsResultController());
  final StudentLoginUpdateController studentLoginUpdateControllers =
      Get.put(StudentLoginUpdateController());
  final StudentProfileController studentProfileController =
      Get.put(StudentProfileController());
  final ParentStudentListController parentStudentListController =
      Get.put(ParentStudentListController());

  GetexamsScheduleController getexamview =
      Get.put(GetexamsScheduleController());
  GetSylabusStatusController GetSylabusStatus =
      Get.put(GetSylabusStatusController());
  ParentLoginController parentLoginController =
      Get.put(ParentLoginController());
  final GetSchoolSettingController _schoolsetting =
      Get.put(GetSchoolSettingController());
  // allsetController.SchoolIdControllerList[0]["response"][0]["attandance"]["present"]==0? (int.parse(_allsetController.SchoolIdControllerList[0]["response"][0]["attandance"]["present"].toString())) / 100:(int.parse(_allsetController.SchoolIdControllerList[0]["response"][0]["attandance"]["present"].toString())) / 100
  List<UserNameController> dataModel = [];
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller1;
  late Animation<Offset> _Animation;
  double percent = 1.0;
  var schoolname;
  var session;
  int totalSecs = 90;
  int secsRemaining = 90;
  double progressFraction = 0.6;
  int percentage = 0;

  // double progressFraction = 0.0;
  //
  // double percentage = 0;
  late Timer timer;
  get progress => progressFraction;
  DateTime now = DateTime.now();
  late int lastday = DateTime(now.year, now.month + 1, 0).day;
  late int days = lastday;

  double progressFraction1 = 0.0;
  double percentage1 = 0;
  late Timer timer1;
  get progress1 => progressFraction1;
  // late bool _loading;
  // late double _progressValue;
  var box = Hive.box("schoolData");

  get id => id;

  @override
  void initState() {
    var box = Hive.box("schoolData");
    var user = box.get("username").toString();
    var pass = box.get("password").toString();
    var parent_id = box.get("parent_id").toString();
    parentStudentListController.parentStudentListMethod(parent_id);
    print("model data ckeck.........................");
    var id = box.get("company_key");
    schoolname = box.get("schoolname");
    session = box.get("session");


parentLoginController.parentLogin.value=true;
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        var username;
        var password;
        var company_key;
        AlwaysScrollableScrollPhysics();
        setState(() {
          username = box.get("username");
          password = box.get("password");
          company_key = box.get("company_key");
          var parent_id = box.get("parent_id").toString();
          parentStudentListController.parentStudentListMethod(parent_id);
        });
      },
      child: SafeArea(
        child: SideMenu(
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
                  icon: const Icon(
                    Icons.menu,
                  ),
                  onPressed: () => toggleMenu(),
                ),
                automaticallyImplyLeading: false,
                backgroundColor: AgentColor.appbarbackgroundColor,
                // iconTheme: IconThemeData(color: Colors.black),
                title: Row(
                  children: [
                    SizedBox(
                        width: 0.45.sw,
                        child: Text(
                          schoolname ?? "",
                          // _schoolsetting.GetSchoolSettingControllerList[0]["response"]["name"],
                          style: MyGoogeFont.mydmSans1,
                          overflow: TextOverflow.ellipsis,
                        )),
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
                          session ?? "",
                          // _schoolsetting.GetSchoolSettingControllerList[0]["response"]["session"],
                          style: MyGoogeFont.mydmSans2,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<int>(
                    itemBuilder: (context) {
                      return <PopupMenuEntry<int>>[
                        PopupMenuItem(
                            onTap: () async {
                                await SessionManager().remove("name");
                                 Get.offAllNamed(RoutesName.schoolId);
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "logout",
                                      style: GoogleFonts.dmSans(
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
                            value: 0,
                            child: const Text('Logout')),
                        const PopupMenuItem(value: 1, child: Text('about')),
                      ];
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Obx(
                  () =>  parentStudentListController.loadingdata.value? Column(
                    children: [
                      Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(left: 0, right: 0).r,
                          child: ClipPath(
                            clipper: ClipPathClass(),
                            child: SizedBox(
                              width: double.infinity,
                              height: 0.220.sh,
                              child: Image.asset(
                                "assets/images/bannerimage.jpeg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Obx(() =>
                             ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: parentStudentListController
                                            .parentSListModel.value?.response !=
                                        null
                                    ? parentStudentListController
                                        .parentSListModel.value?.response.length
                                    : 0,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                            left: 23, right: 23, top: 80)
                                        .r,
                                    child: InkWell(
                                        onTap: () {
                                              studentProfileController
                                                  .isloading.value = false;
                                             
                                              studentProfileController
                                                  .studentProfileApi(parentStudentListController.parentSListModel.value
                                                          ?.response[index]
                                                          .studentId);
                                              Get.toNamed(RoutesName.home);
                                            },
                                      child: SizedBox(
                                        height: 0.3.sh,
                                        child: Stack(
                                          children: <Widget>[
                                            Card(
                                              color: const Color.fromRGBO(
                                                  114, 199, 255, 1),
                                              child: SizedBox(
                                                height: 0.3.sh,
                                                width: 0.87.sw,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0.012.sh,
                                              left: 0.33.sw,
                                              right: 0.31.sw,
                                              child: FractionalTranslation(
                                                translation:
                                                    const Offset(0.0, -0.5),
                                                child: ClipOval(
                                                  child: Align(
                                                    alignment:
                                                        const FractionalOffset(
                                                            0.5, 0.0),
                                                    child: CachedNetworkImage(
                                                        placeholder:
                                                            (context, url) =>
                                                                CircleAvatar(
                                                                  maxRadius: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width +
                                                                      60,
                                                                  backgroundImage:
                                                                      const AssetImage(
                                                                    "assets/images/user1.png",
                                                                  ),
                                                                ),
                                                        imageUrl: parentStudentListController
                                                                    .parentSListModel
                                                                    .value
                                                                    ?.response[
                                                                        index]
                                                                    .profileimage !=
                                                                null
                                                            ? "${ApiUrl.imagesUrl.toString()}${parentStudentListController.parentSListModel.value?.response[index].profileimage}"
                                                            : "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0.33.sw,
                                              top: 0.080.sh,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${parentStudentListController.parentSListModel.value?.response[index].name}",
                                                    style: GoogleFonts.dmSans(
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 17.sp,
                                                        fontWeight: FontWeight.bold,
                                                        color: const Color.fromARGB(
                                                            255, 255, 254, 254)),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${parentStudentListController.parentSListModel.value?.response[index].responseClass}",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color.fromARGB(
                                                                255,
                                                                255,
                                                                254,
                                                                254)),
                                                      ),
                                                      SizedBox(
                                                        width: 0.010.sw,
                                                      ),
                                                      Text(
                                                        "${parentStudentListController.parentSListModel.value?.response[index].section}",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color.fromARGB(
                                                                255,
                                                                255,
                                                                254,
                                                                254)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 0.1.sw,
                                              top: 0.13.sh,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Total Fee",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color.fromARGB(
                                                                255,
                                                                255,
                                                                254,
                                                                254)),
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        "${parentStudentListController.parentSListModel.value?.response[index].fee.totalAmount}",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color.fromARGB(
                                                                255,
                                                                255,
                                                                254,
                                                                254)),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 140,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Due Fee",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color.fromARGB(
                                                                255,
                                                                255,
                                                                254,
                                                                254)),
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        "${parentStudentListController.parentSListModel.value?.response[index].fee.totalBalanceAmount}",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color.fromARGB(
                                                                255,
                                                                255,
                                                                254,
                                                                254)),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 150,
                                            ),
                                            Positioned(
                                              left: 0.1.sw,
                                              top: 0.2.sh,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Present",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color
                                                                    .fromARGB(255,
                                                                255, 254, 254)),
                                                      ),
                                                      Divider(),
                                                      Text(
                                                        "${parentStudentListController.parentSListModel.value?.response[index].attandance.present}",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color
                                                                    .fromARGB(255,
                                                                255, 254, 254)),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 150,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Absent",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color
                                                                    .fromARGB(255,
                                                                255, 254, 254)),
                                                      ),
                                                      const Divider(),
                                                      Text(
                                                        "${parentStudentListController.parentSListModel.value?.response[index].attandance.absent}",
                                                        style: GoogleFonts.dmSans(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color
                                                                    .fromARGB(255,
                                                                255, 254, 254)),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                          ),
                      ]),
                    ],
                  ):Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 300),
                          child: Center(child: CircularProgressIndicator(color: Colors.blue),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                color: const Color.fromARGB(255, 196, 236, 255),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0.15.sw, top: 10),
                      child: const Text("Powered By :-"),
                    ),
                    Image.asset(
                      "assets/images/b.png",
                      width: 0.5.sw,
                      height: 0.070.sh,
                    ),
                  ],
                ),
              ),
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
                            _schoolsetting.GetSchoolSettingControllerList[0]
                                ["response"]["image"],
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
                Get.toNamed(RoutesName.dashboard);
              },
              leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
              title: const Text("Home"),
              textColor: Colors.white,
              dense: true,
            ),
          ),
//  ListTileTheme(
//             dense: true,

//             child: ExpansionTile(

//               collapsedIconColor: Colors.white,
//               textColor: Colors.white,
//               title: Text(
//                 "Select Student",
//                 style: GoogleFonts.dmSans(
//                   fontStyle: FontStyle.normal,
//                   fontSize: 14.sp,

//                   color: Colors.white,
//                 ),
//               ),
//               leading: const Icon(Icons.book_outlined,
//                   size: 20.0, color: Colors.white),

//               childrenPadding: EdgeInsets.only(left: 60), //children padding
//               children: [
//              Obx(() =>  ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                     itemCount: parentLoginController.parentStudentListModel.value?.response!=null ?parentLoginController.parentStudentListModel.value?.response?.length:0,
//                 itemBuilder: (context, index) {
//                 return   SizedBox(
//                   height: 0.052.sh,
//                   child: ListTile(
//                       title:  Text( "${ parentLoginController.parentStudentListModel.value?.response?[index]?.name}",
//                         style: GoogleFonts.dmSans(
//                           fontStyle: FontStyle.normal,
//                           fontSize: 14.sp,

//                           color: Colors.white,
//                         ),),
//                       onTap:(){
//                      print( "${ parentLoginController.parentStudentListModel.value?.response?[index]?.studentId}");

//                       }
//                   ),
//                 );
//               },),)

//                 //more child menu
//               ],
//             ),
//           ),
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
                if (GetSylabusStatus.GetSylabusStatusControllerList != null) {
                  Get.toNamed(RoutesName.lession);
                }
              },
              leading: const Icon(Icons.play_lesson_outlined,
                  size: 20.0, color: Colors.white),
              title: Text("Syllabus Status"),

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
                      title: Text(
                        "Exam Time ",
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        if (getexamview.GetexamsScheduleControllerList !=
                            null) {
                          Get.toNamed(RoutesName.examination);
                        }
                      }),
                ),

                SizedBox(
                  height: 0.062.sh,
                  child: ListTile(
                      title: Text(
                        "Result",
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        if (GetexamsResult.GetexamsResultControllerList !=
                            null) {
                          Get.toNamed(RoutesName.examresult);
                        }
                      }),
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
              onTap: () => Get.toNamed(RoutesName.chatPage),
              leading: const Icon(Icons.chat, size: 20.0, color: Colors.white),
              title: const Text("Chat"),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(
            height: 0.052.sh,
            child: ListTile(
              onTap: () => Get.toNamed(RoutesName.notification),
              leading: const Icon(Icons.notifications,
                  size: 20.0, color: Colors.white),
              title: const Text(
                "Notification",
              ),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(
            height: 0.052.sh,
            child: ListTile(
              onTap: () => Get.toNamed(RoutesName.notification),
              leading: const Icon(Icons.notifications,
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
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 0.0);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
