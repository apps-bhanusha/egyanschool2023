import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_desgin/view/examination/Exam_result.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final UserNameController _allsetController = Get.put(UserNameController());
  int _index = 0;
  int s = 0;
  @override
  Widget build(BuildContext context) {
    // final imageUrl = Image.asset('assets/images/BeatsPro');

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  color: Colors.lightBlueAccent,
                  child: Column(children: [
                    // Container(
                    //   height: 0.15.sh,
                    //   width: 0.25.sw,
                    //   // decoration:

                    //   // BoxDecoration(color: Color.fromARGB(255, 244, 60, 54)),
                    //   child: Transform.scale(
                    //     scale: s == _index ? 0.9 : 0.9,
                    //     // transform: Matrix4.identity(),

                    //     child: CachedNetworkImage(

                    //       placeholder:  (context, url) => CircleAvatar( maxRadius: MediaQuery.of(context).size.width -
                    //           MediaQuery.of(context).size.width +
                    //           22,
                    //           backgroundImage: AssetImage("assets/images/user1.png")),

                    //       imageUrl: _allsetController.SchoolIdControllerList[0]["response"][0]["profileimage"].toString(),
                    //     ),
                    //   ),
                    // ),
                    Text(
                      "EGYAN Demo School",
                      style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ]),
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.lightBlueAccent,
                      height: 0.0020.sh,
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          CupertinoIcons.house_fill,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Home",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.dashboard);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          Icons.heart_broken_rounded,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Profile",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          CupertinoIcons.chat_bubble_text,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Attendance",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        onTap: () {
                          
                        },
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          Icons.heart_broken_rounded,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Fees",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.fees);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyDrawer(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: const Icon(
                            CupertinoIcons.profile_circled,
                            color: Colors.lightBlueAccent,
                          ),
                          title: Text(
                            "Class Time Table",
                            textScaleFactor: 1.2,
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                            onTap: () {
                              Get.toNamed(RoutesName.timetable);
                            },

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          CupertinoIcons.rectangle_stack_badge_plus,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Lession Plan",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.feesgraff);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          Icons.help_outlined,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Syllabus",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.syllabus);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        onTap: () => Get.toNamed(RoutesName.homeWork),
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Home Work",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        onTap: () => Get.toNamed(RoutesName.examination),
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Examination",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    ExpansionTile(
                      title: Text(
                        "Examination",
                        textScaleFactor: 1.2,
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.lightBlueAccent,
                      ), //add icon
                      childrenPadding:
                          EdgeInsets.only(left: 60), //children padding
                      children: [
                        ListTile(
                          title: const Text("Exam Time Table"),
                          onTap: () => Get.toNamed(RoutesName.examination),
                        ),

                        ListTile(
                          title: const Text("Result"),
                          onTap: () {
                            onTap:
                         
                         Get.to(ExamResult());
                          },
                        ),

                        //more child menu
                      ],
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        onTap: () => Get.toNamed(RoutesName.downloadAll),
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Download",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Leave Status",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Teacher Review",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Chat",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Notification",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.042.sh,
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text(
                          "Bus Route Live Location(Transport)",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 218, 214, 182),
            height: 0.080.sh,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Powered by",
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/b.png",
                  height: 0.13.sh,
                  width: 0.35.sw,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
