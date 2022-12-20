import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/dashboard/drawer.dart';
import 'package:ecom_desgin/view/examination/Exam_result.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final UserNameController _allsetController = Get.put(UserNameController());
  List<UserNameController> dataModel = [];
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller1;
  late Animation<Offset> _Animation;

  @override
  void initState() {
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
    // _controller.repeat(reverse: true);
    // _controller =  AnimationController(vsync: this, duration: Duration(seconds: 6));
    // colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    // sizeAnimation = Tween<double>(begin: 400.0, end: 400.0).animate(controller);
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
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => toggleMenu(),
            ),
           backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Row(
              children: [
                Text(
                  'EGYAN Demo school',
                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26).r,
                  child: Column(
                    children: [
                      Text(
                        'Session',
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '2020-21',
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              PopupMenuButton<int>(
                itemBuilder: (context) {
                  return <PopupMenuEntry<int>>[
                    const PopupMenuItem(child: Text('detial'), value: 0),
                    const PopupMenuItem(child: Text('about'), value: 1),
                  ];
                },
              ),
            ],
          ),
         
          
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      // background image and bottom contents
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 0.188.sh,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/images/all4.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            color: Colors.lightBlue,
                            height: 0.270.sh,
                          ),
                          SizedBox(
                            height: 0.010.sh,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                    height: 0.072.sh,
                                    width: 0.99.sw,
                                    child: Card(
                                      color: Colors.lightBlueAccent,
                                      child: Container(
                                        child: Center(
                                          child: ScrollLoopAutoScroll(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              'Notice board',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                Container(
                                  height: 0.25.sh,
                                  child: Card(
                                    color: Colors.white70,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        side: BorderSide(
                                            width: 0.001.sw,
                                            color: Colors.white)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            // mainAxisAlignment:
                                            // MainAxisAlignment.start,
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      "Fees",
                                                      style:
                                                          GoogleFonts.dmSans(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.grey[600],
                                                      ),
                                                    ),
                                                    Text(
                                                      "",
                                                      style:
                                                          GoogleFonts.dmSans(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.grey[600],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 0.010.sh),
                                                    Container(
                                                      color: Colors.black,
                                                      height: 0.001.sh,
                                                      width: 0.40.sw,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 0.090.sw),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      "Fees Due",
                                                      style:
                                                          GoogleFonts.dmSans(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.grey[600],
                                                      ),
                                                    ),
                                                    Text(
                                                      "",
                                                      style:
                                                          GoogleFonts.dmSans(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.grey[600],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 0.010.sh),
                                                    Container(
                                                      color: Colors.black,
                                                      height: 0.001.sh,
                                                      width: 0.40.sw,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      "Attendance",
                                                      style:
                                                          GoogleFonts.dmSans(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.grey[600],
                                                      ),
                                                    ),
                                                    Text(
                                                      _allsetController
                                                          .SchoolIdControllerList[
                                                              0]["response"]
                                                              [0]
                                                              ["attandance"]
                                                              ["present"]
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.dmSans(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.grey[600],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 0.010.sh),
                                                    Container(
                                                      color: Colors.black,
                                                      height: 0.001.sh,
                                                      width: 0.40.sw,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 0.090.sw),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text("UpComing Exam", style: GoogleFonts.dmSans(fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.grey[600],
                                                      ),
                                                    ),
                                                    Text(
                                                      'UpComing Exam',
                                                      style:
                                                          GoogleFonts.dmSans(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.grey[600],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 0.010.sh),
                                                    Container(
                                                      color: Colors.black,
                                                      height: 0.001.sh,
                                                      width: 0.40.sw,
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
                              ],
                            ),
                          ),
                        ],
                      ),
    
                      Positioned(
                        top: 0.20.sw,
                        child: Align(
                            alignment: Alignment.center, child:
                             Container(
                              height: 0.150.sh,
                              width: 0.22.sw,
                               child: Text("image comment")
                              // CachedNetworkImage(
    
                              //   placeholder:  (context, url) => CircleAvatar( maxRadius: MediaQuery.of(context).size.width -
                              //       MediaQuery.of(context).size.width +
                              //       22,backgroundImage: AssetImage("assets/images/user1.png")),
    
                              //   imageUrl: _allsetController.SchoolIdControllerList[0]["response"][0]["profileimage"].toString(),
                              // ),
                            ),
                            ),
                      ),
    
                      Positioned(
                        top: 165,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Obx(
                                () => Text(
                                  _allsetController.SchoolIdControllerList[0]
                                          ["response"][0]["name"]
                                      .toString(),
                                  style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0).r,
                              child: InkWell(
                                onTap: () {},
                                child: Obx(
                                  () => Text(
                                    _allsetController
                                        .SchoolIdControllerList[0]
                                            ['parent_info']["mobileno"]
                                        .toString(),
                                    style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
    
                      Positioned(
                        bottom: 0.76.sh,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 60).r,
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  "Communication",
                                  style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60).r,
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  "attendance",
                                  style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
    
                      Positioned(
                        bottom: 0.331.sh,
                        child: Container(
                          color: Colors.black26,
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
                                    color: Colors.lightBlue,
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
                                      color: Colors.lightBlue,
                                      size: 55.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0.22.sw,
                                top: 0.025.sh,
                                child: GestureDetector(
                                  onTap: () => {
                                    Get.toNamed(RoutesName.dashboard),
                                  },
                                  child: Container(
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.lightBlue,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22.0,
                    
                    child: Image.asset("assets/images/user1.png"),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Center(
                  child: Text(
                    "Hello, John Doe",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20.0), 
              ],  
            ),  
          ),        
          ListTile(
             onTap: () {
                          Get.toNamed(RoutesName.dashboard);
                        },
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Profile"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {Get.toNamed(RoutesName.attendance);},
            leading: const Icon(Icons.present_to_all,
                size: 20.0, color: Colors.white),
            title: const Text("Attendance"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {Get.toNamed(RoutesName.feesgraff);},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.white),
            title: const Text("Fees"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () { Get.toNamed(RoutesName.timetable);},
            leading:
                const Icon(Icons.av_timer_rounded, size: 20.0, color: Colors.white),
            title: const Text("Class Time Table"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
          ListTile(
          onTap: () {
            Get.toNamed(RoutesName.lession);
          },
          leading: const Icon(Icons.play_lesson_outlined,
              size: 20.0, color: Colors.white),
          title: const Text("Lession Plan"),
          textColor: Colors.white,
          dense: true,
  
          // padding: EdgeInsets.zero,
        ),
           ListTile(
            onTap: () { Get.toNamed(RoutesName.syllabus);},
            leading:
                const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white),
            title: const Text("Syllabus"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
           ListTile(
           onTap: () => Get.toNamed(RoutesName.homeWork),
            leading:
                const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white),
            title: const Text("Home Work"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
           ExpansionTile(
            collapsedIconColor: Colors.white,
            textColor: Colors.white,
                      title: const Text("Exmaination",style:TextStyle(color: Colors.white),),
                      leading: const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white), //add icon
                      childrenPadding:
                          EdgeInsets.only(left: 60), //children padding
                      children: [
                        ListTile(
                          title: const Text("Exam Time Table",style:TextStyle(color: Colors.white)),
                          onTap: () => Get.toNamed(RoutesName.examination),
                        ),
    
                        ListTile(
                          title: const Text("Result",style:TextStyle(color: Colors.white)),
                          onTap: () {
                            onTap:
                         
                         Get.to(ExamResult());
                          },
                        ),
    
                        //more child menu
                      ],
                    ),
           ListTile(
            onTap: () => Get.toNamed(RoutesName.downloadAll),
            leading:
                const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white),
            title: const Text("Download"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
           ListTile(
            onTap: () => Get.toNamed(RoutesName.downloadAll),
            leading:
                const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white),
            title: const Text("Bus Route"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
           ListTile(
            onTap: () => Get.toNamed(RoutesName.chatPage),
            leading:
                const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white),
            title: const Text("Chat"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
           ListTile(
            onTap: () => Get.toNamed(RoutesName.downloadAll),
            leading:
                const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white),
            title: const Text("Notification"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
          
           SizedBox(
            height: 0.05.sh,
          ),
           Container(
            color: Colors.white,
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
                      color: Colors.blue,
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

