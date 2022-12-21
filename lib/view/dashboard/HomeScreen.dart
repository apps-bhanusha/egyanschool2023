// ignore_for_file: sort_child_properties_last

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
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

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
double percent = 10.0;
 bool dueFees=false;
 




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

@override
  void dispose(){
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

    return SafeArea(
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
          child:Scaffold(
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
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 45).r,
                    //   child: Column(
                    //     children: [
                    //       Text(
                    //         'Session',
                    //         style: GoogleFonts.dmSans(
                    //           fontStyle: FontStyle.normal,
                    //           fontSize: 12.sp,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //       Text(
                    //         '2020-21',
                    //         style: GoogleFonts.dmSans(
                    //           fontStyle: FontStyle.normal,
                    //           fontSize: 12.sp,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                actions: [
                  Padding(
                      padding: const EdgeInsets.only(left: 0,top: 10).r,
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
                  PopupMenuButton<int>(
                    itemBuilder: (context) {
                      return <PopupMenuEntry<int>>[
                        const PopupMenuItem(child: Text('Logout'), value: 0),
                        const PopupMenuItem(child: Text('about'), value: 1),
                      ];
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                       
                  children: [
              
                    Stack(
                      
                                
                      children: [
                      Container(
                        margin: const EdgeInsets.only(left: 0, right: 0).r,
                        child: ClipPath(
                          clipper: ClipPathClass(),
                          child: SizedBox(
                            width: double.infinity,
                            height: 0.280.sh,
                            child: 
                            Image.asset(
                              "assets/images/all4.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 27, right: 15, top: 130.0)
                            .r,
                        child: Stack(
                          children: <Widget>[
                            Card(
                              child: SizedBox(
                                height: 0.155.sh,
                                width: 0.85.sw,
                              ),
                            ),
                            Positioned(
                              top: 0.002.sh,
                              left: 0.33.sw,
                              right: 0.31.sw,
                              child: FractionalTranslation(
                                translation: Offset(0.0, -0.5),
                                child: ClipOval(
                                  child: Align(
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                              maxRadius: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width +
                                                  26,
                                              backgroundImage: const AssetImage(
                                                  "assets/images/user1.png",),),
                                      imageUrl:"https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80," ,
                                      // _allsetController
                                      //     .SchoolIdControllerList[0]["response"]
                                      // [0]["profileimage"]
                                      //     .toString(),
                                    ),
                                    alignment: FractionalOffset(0.5, 0.0),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0.30.sw,
                              top: 0.070.sh,
                              
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Obx(
                                          () => Text(
                                        _allsetController
                                            .SchoolIdControllerList[0]
                                        ["response"][0]["name"]
                                            .toString(),
                                        style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
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
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                                    SizedBox(height: 0.015.sh,),
              
                    Container(
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.010.sh,
                    ),
                    SizedBox(
                        height: 0.072.sh,
                        width: 0.99.sw,
                        child: Card(
                          color: Color.fromARGB(255, 134, 217, 248),
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
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                                    SizedBox(height: 0.01.sh,),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          color: Color.fromARGB(255, 134, 217, 248),
                          elevation: 10,
                          child: Column(
                            children: [
                              Text(
                                "Total Fees",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 0.15.sh,
                                width: 0.30.sw,
                                child: LiquidLinearProgressIndicator(
                                  value: 1, // Defaults to 0.5.
                                  valueColor: const AlwaysStoppedAnimation(Color.fromARGB(
                                      255, 124, 200,
                                      241),), // Defaults to the current Theme's accentColor.
                                  backgroundColor: const Color.fromARGB(255, 246, 243,
                                      243), // Defaults to the current Theme's backgroundColor.
                                  borderColor: Colors.red,
                                  borderWidth: 0.0,
                                  borderRadius: 12.0,
              
                                  direction: Axis.vertical,
                                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                  center: Text(
                                    "100",
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: const Color.fromARGB(255, 134, 217, 248),
                          elevation: 10,
                          child: Column(
                            children: [
                              Text(
                                "Due Fees",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 0.15.sh,
                                width: 0.30.sw,
                                child: LiquidLinearProgressIndicator(
                                  value: 0.3, // Defaults to 0.5.
                                  valueColor: AlwaysStoppedAnimation(dueFees?Color.fromARGB(255, 91, 167, 230):Color.fromARGB(255, 228, 97, 87), ), // Defaults to the current Theme's accentColor.
                                  backgroundColor: const Color.fromARGB(255, 246, 243,
                                      243), // Defaults to the current Theme's backgroundColor.
                                  borderColor: Colors.red,
                                  borderWidth: 0.0,
                                  borderRadius: 12.0,
              
                                  direction: Axis.vertical,
                                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                  center: Text(
                                    "40",
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: const Color.fromARGB(255, 134, 217, 248),
                          elevation: 10,
                          child: Column(
                            children: [
                              Text(
                                "Attendance",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 0.15.sh,
                                width: 0.30.sw,
                                child: LiquidLinearProgressIndicator(
                                  value: 0.7, // Defaults to 0.5.
                                  valueColor: const AlwaysStoppedAnimation(Color.fromARGB(255, 144, 212, 146)), // Defaults to the current Theme's accentColor.
                                  backgroundColor: const Color.fromARGB(255, 246, 243,
                                      243), // Defaults to the current Theme's backgroundColor.
                                  borderColor: Colors.red,
                                  borderWidth: 0.0,
                                  borderRadius: 12.0,
              
                                  direction: Axis.vertical,
                                  // The directioncent% the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                  center: Text(
                                    "70",
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            for(var i=0; i<3; i++)
                              Card(
              
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Mid Sem  Winter Exam",
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 0.015.sh,),
                                      Text(
                                        "20 to 27 March",
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                        onTap: () {Get.toNamed(RoutesName.profile);},

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
            onTap: () {Get.toNamed(RoutesName.fees);},
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
          //  ListTile(
          //   onTap: () { Get.toNamed(RoutesName.syllabus);},
          //   leading:
          //       const Icon(Icons.play_lesson_outlined, size: 20.0, color: Colors.white),
          //   title: const Text("Syllabus"),
          //   textColor: Colors.white,
          //   dense: true,
    
          //   // padding: EdgeInsets.zero,
          // ),
           ListTile(
           onTap: () => Get.toNamed(RoutesName.homeWork),
            leading:
                const Icon(Icons.home_work, size: 20.0, color: Colors.white),
            title: const Text("Home Work"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
           ExpansionTile(
            collapsedIconColor: Colors.white,
            textColor: Colors.white,
                      title: const Text("Exmaination",style:TextStyle(color: Colors.white),),
                      leading: const Icon(Icons.book_outlined, size: 20.0, color: Colors.white), //add icon
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
                const Icon(Icons.download, size: 20.0, color: Colors.white),
            title: const Text("Download"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
           ListTile(
            onTap: () => Get.toNamed(RoutesName.busRoute),
            leading:
                const Icon(Icons.route, size: 20.0, color: Colors.white),
            title: const Text("Bus Route"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
           ListTile(
            onTap: () => Get.toNamed(RoutesName.chatPage),
            leading:
                const Icon(Icons.chat, size: 20.0, color: Colors.white),
            title: const Text("Chat"),
            textColor: Colors.white,
            dense: true,
    
            // padding: EdgeInsets.zero,
          ),
           ListTile(
            onTap: () => Get.toNamed(RoutesName.notification),
            leading:
                const Icon(Icons.notifications, size: 20.0, color: Colors.white),
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
        color: Color.fromARGB(255, 196, 236, 255),
              
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

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

