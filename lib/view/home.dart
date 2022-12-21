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
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' as vector;
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List midsem = [

    "Mid Sem Winter Exam",
    "Mid Sem Winter Exam",
    "Mid Sem Winter Exam",
  ];
  final List date = ["20 to 27 March", "20 to 27 March", "20 to 27 March"];
  double percent = 10.0;
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;
  late AnimationController firstController1;
  late Animation<double> firstAnimation1;

  late AnimationController secondController1;
  late Animation<double> secondAnimation1;

  late AnimationController thirdController1;
  late Animation<double> thirdAnimation1;

  late AnimationController fourthController1;
  late Animation<double> fourthAnimation1;
  final UserNameController _allsetController = Get.put(UserNameController());
  List<UserNameController> dataModel = [];
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller1;
  late Animation<Offset> _Animation;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    late Timer timer;
    timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      print('Percent Update');
      setState(() {
        percent += 1;
        if (percent >= 100) {
          timer.cancel();
          // percent=0;
        }
      });
    });
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animationController.addListener(() {
      setState(() {
        _buildHeartPath;
      });
    });

    animationController.repeat();
    super.initState();
    firstController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    firstAnimation = Tween<double>(begin: 1.9, end: 2.1)
        .animate(CurvedAnimation(parent: firstController, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    secondAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: secondController, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    thirdAnimation = Tween<double>(begin: 1.8, end: 2.4)
        .animate(CurvedAnimation(parent: thirdController, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController =
        AnimationController(vsync: this, duration: Duration(seconds: 15));
    fourthAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: fourthController, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    Timer(Duration(seconds: 2), () {
      firstController.forward();
    });

    Timer(Duration(seconds: 1), () {
      secondController.forward();
    });

    Timer(Duration(seconds: 1), () {
      thirdController.forward();
    });

    fourthController.forward();
    ////

    firstController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    firstAnimation1 = Tween<double>(begin: 1.9, end: 1.1).animate(
        CurvedAnimation(parent: firstController1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController1.forward();
        }
      });

    secondController1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1));
    secondAnimation1 = Tween<double>(begin: 1.9, end: 1.1).animate(
        CurvedAnimation(parent: secondController1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController1.forward();
        }
      });

    thirdController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    thirdAnimation1 = Tween<double>(begin: 1.9, end: 1.1).animate(
        CurvedAnimation(parent: thirdController1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController1.forward();
        }
      });

    fourthController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    fourthAnimation1 = Tween<double>(begin: 1.9, end: 1.1).animate(
        CurvedAnimation(parent: fourthController1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController1.forward();
        }
      });

    Timer(Duration(milliseconds: 500), () {
      firstController1.forward();
    });

    Timer(Duration(milliseconds: 1600), () {
      secondController1.forward();
    });

    Timer(Duration(milliseconds: 800), () {
      thirdController1.forward();
    });

    fourthController1.forward();
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
    animationController = AnimationController(
      duration: Duration(seconds: 10),
      lowerBound: 56,
      upperBound: 705,
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    animationController.repeat();
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
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = animationController.value * 100;

    return SideMenu(
      key: _endSideMenuKey,
      inverse: true, // end side men
      type: SideMenuType.shrikNRotate,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: buildMenu(),
      ),
      onChange: (isOpened) {
        setState(() => isOpened = isOpened);
      },
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
                    Stack(children: [
                      Container(
                        margin: EdgeInsets.only(left: 0, right: 0).r,
                        child: ClipPath(
                          clipper: ClipPathClass(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 0.280.sh,
                            child: Image.asset(
                              "assets/images/all4.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 100.0)
                            .r,
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Card(
                                child: Container(
                                  height: 0.180.sh,
                                ),
                              ),
                              Positioned(
                                top: 0.001.sh,
                                left: 0.35.sw,
                                child: FractionalTranslation(
                                  translation: Offset(0.0, -0.5),
                                  child: Align(
                                    child: Container(
                                      height: 0.150.sh,
                                      width: 0.22.sw,
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            CircleAvatar(
                                                maxRadius: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width +
                                                    22,
                                                backgroundImage: AssetImage(
                                                    "assets/images/user1.png")),
                                        imageUrl: _allsetController
                                            .SchoolIdControllerList[0]["response"]
                                        [0]["profileimage"]
                                            .toString(),
                                      ),
                                    ),
                                    alignment: FractionalOffset(0.5, 0.0),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0.30.sw,
                                top: 0.090.sh,
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
                      ),
                    ]),
                    Positioned(
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
                    SizedBox(
                      height: 0.010.sh,
                    ),
                    Container(
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
                              Container(
                                height: 0.15.sh,
                                width: 0.30.sw,
                                child: LiquidLinearProgressIndicator(
                                  value: 0.5, // Defaults to 0.5.
                                  valueColor: const AlwaysStoppedAnimation(Color.fromARGB(
                                      255, 124, 200,
                                      241),), // Defaults to the current Theme's accentColor.
                                  backgroundColor: Color.fromARGB(255, 246, 243,
                                      243), // Defaults to the current Theme's backgroundColor.
                                  borderColor: Colors.red,
                                  borderWidth: 0.0,
                                  borderRadius: 12.0,

                                  direction: Axis.vertical,
                                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                  center: Text(
                                    percent.toString() + "%",
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
                          color: Color.fromARGB(255, 134, 217, 248),
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
                              Container(
                                height: 0.15.sh,
                                width: 0.30.sw,
                                child: LiquidLinearProgressIndicator(
                                  value: 0.5, // Defaults to 0.5.
                                  valueColor: const AlwaysStoppedAnimation(Color.fromARGB(
                                      255, 124, 200,
                                      241), ), // Defaults to the current Theme's accentColor.
                                  backgroundColor: Color.fromARGB(255, 246, 243,
                                      243), // Defaults to the current Theme's backgroundColor.
                                  borderColor: Colors.red,
                                  borderWidth: 0.0,
                                  borderRadius: 12.0,

                                  direction: Axis.vertical,
                                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                  center: Text(
                                    percent.toString() + "",
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
                          color: Color.fromARGB(255, 134, 217, 248),
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
                              Container(
                                height: 0.15.sh,
                                width: 0.30.sw,
                                child: LiquidLinearProgressIndicator(
                                  value: 0.5, // Defaults to 0.5.
                                  valueColor: const AlwaysStoppedAnimation(Color.fromARGB(
                                      255, 124, 200,
                                      241),), // Defaults to the current Theme's accentColor.
                                  backgroundColor: Color.fromARGB(255, 246, 243,
                                      243), // Defaults to the current Theme's backgroundColor.
                                  borderColor: Colors.red,
                                  borderWidth: 0.0,
                                  borderRadius: 12.0,

                                  direction: Axis.vertical,
                                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                  center: Text(
                                    percent.toString() + "%",
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
                      child: Row(
                        children: [
                          for(var i=0; i<3; i++)
                            Card(

                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Mid Sem  Winter Exam",
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 0.010.sh,),
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
      ),
    );
  }

  Widget buildMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                  child: Image.asset("assets/images/user1.png"),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
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
          leading:
          const Icon(Icons.verified_user, size: 20.0, color: Colors.white),
          title: const Text("Profile"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {
            Get.toNamed(RoutesName.attendance);
          },
          leading:
          const Icon(Icons.present_to_all, size: 20.0, color: Colors.white),
          title: const Text("Attendance"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
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
        ListTile(
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
        ListTile(
          onTap: () {
            Get.toNamed(RoutesName.feesgraff);
          },
          leading: const Icon(Icons.play_lesson_outlined,
              size: 20.0, color: Colors.white),
          title: const Text("Lession Plan"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {
            Get.toNamed(RoutesName.syllabus);
          },
          leading: const Icon(Icons.play_lesson_outlined,
              size: 20.0, color: Colors.white),
          title: const Text("Syllabus"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () => Get.toNamed(RoutesName.homeWork),
          leading: const Icon(Icons.play_lesson_outlined,
              size: 20.0, color: Colors.white),
          title: const Text("Home Work"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ExpansionTile(
          collapsedIconColor: Colors.white,
          textColor: Colors.white,
          title: const Text(
            "Exmaination",
            style: TextStyle(color: Colors.white),
          ),
          leading: const Icon(Icons.play_lesson_outlined,
              size: 20.0, color: Colors.white), //add icon
          childrenPadding: EdgeInsets.only(left: 60), //children padding
          children: [
            ListTile(
              title: const Text("Exam Time Table",
                  style: TextStyle(color: Colors.white)),
              onTap: () => Get.toNamed(RoutesName.examination),
            ),

            ListTile(
              title:
              const Text("Result", style: TextStyle(color: Colors.white)),
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
          leading: const Icon(Icons.play_lesson_outlined,
              size: 20.0, color: Colors.white),
          title: const Text("Download"),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
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
    );
  }
}

Path _buildHeartPath() {
  return Path()
    ..moveTo(55, 100)
    ..cubicTo(100, 0, 100, 0, 0, 0)
    ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
    ..cubicTo(0, 55, 20, 77, 55, 95)
    ..cubicTo(90, 77, 110, 55, 110, 37.5)
    ..cubicTo(110, 37.5, 110, 0, 80, 0)
    ..cubicTo(65, 0, 55, 12, 55, 15)
    ..close();
}

class _CustomPathPainter extends CustomPainter {
  final Color color;
  final Path path;

  _CustomPathPainter({required this.color, required this.path});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CustomPathPainter oldDelegate) =>
      color != oldDelegate.color || path != oldDelegate.path;
}

class _CustomPathClipper extends CustomClipper<Path> {
  final Path path;

  _CustomPathClipper({required this.path});

  @override
  Path getClip(Size size) {
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyPainter extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;

  MyPainter(
      this.firstValue,
      this.secondValue,
      this.thirdValue,
      this.fourthValue,
      );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xff3B6ABA).withOpacity(.5)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue)
      ..cubicTo(size.width * .10, size.height / secondValue, size.width * .10,
          size.height / thirdValue, size.width, size.height / fourthValue)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainter1 extends CustomPainter {
  final double firstValue1;
  final double secondValue1;
  final double thirdValue1;
  final double fourthValue1;

  MyPainter1(
      this.firstValue1, this.secondValue1, this.thirdValue1, this.fourthValue1);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xff3B6ABA).withOpacity(.8)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue1)
      ..cubicTo(size.width * .10, size.height / secondValue1, size.width * .10,
          size.height / thirdValue1, size.width, size.height / fourthValue1)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(10.0, size.height - 30);

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
// SafeArea(
// child: SingleChildScrollView(
// child: Column(
// children: [
// Stack(
// alignment: Alignment.center,
// children: <Widget>[
// // background image and bottom contents
// Column(
// children: <Widget>[
// SizedBox(
// height: 0.188.sh,
// width: MediaQuery.of(context).size.width,
// child: Image.asset(
// "assets/images/all4.jpeg",
// fit: BoxFit.fill,
// ),
// ),
// Container(
// color: Colors.lightBlue,
// height: 0.270.sh,
// ),
// SizedBox(
// height: 0.010.sh,
// ),
// Container(
// child: Column(
// children: [
// Container(
// height: 0.072.sh,
// width: 0.99.sw,
// child: Card(
// color: Colors.lightBlueAccent,
// child: Container(
// child: Center(
// child: ScrollLoopAutoScroll(
// scrollDirection: Axis.horizontal,
// child: Text(
// 'Notice board',
// style: GoogleFonts.dmSans(
// fontStyle: FontStyle.normal,
// fontSize: 15.sp,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
// )),
// Container(
// height: 0.25.sh,
// child: Card(
// color: Colors.white70,
// elevation: 2,
// shape: RoundedRectangleBorder(
// borderRadius: const BorderRadius.only(
// bottomLeft: Radius.circular(10),
// topLeft: Radius.circular(10),
// bottomRight: Radius.circular(10),
// topRight: Radius.circular(10)),
// side: BorderSide(
// width: 0.001.sw,
// color: Colors.white)),
// child: Column(
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// // mainAxisAlignment:
// // MainAxisAlignment.start,
// // crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Expanded(
// flex: 1,
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "Fees",
// style:
// GoogleFonts.dmSans(
// fontStyle:
// FontStyle.normal,
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold,
// color:
// Colors.grey[600],
// ),
// ),
// Text(
// "",
// style:
// GoogleFonts.dmSans(
// fontStyle:
// FontStyle.normal,
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold,
// color:
// Colors.grey[600],
// ),
// ),
// SizedBox(
// height: 0.010.sh),
// Container(
// color: Colors.black,
// height: 0.001.sh,
// width: 0.40.sw,
// ),
// ],
// ),
// ),
// SizedBox(width: 0.090.sw),
// Expanded(
// flex: 1,
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "Fees Due",
// style:
// GoogleFonts.dmSans(
// fontStyle:
// FontStyle.normal,
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold,
// color:
// Colors.grey[600],
// ),
// ),
// Text(
// "",
// style:
// GoogleFonts.dmSans(
// fontStyle:
// FontStyle.normal,
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold,
// color:
// Colors.grey[600],
// ),
// ),
// SizedBox(
// height: 0.010.sh),
// Container(
// color: Colors.black,
// height: 0.001.sh,
// width: 0.40.sw,
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.start,
// children: <Widget>[
// Expanded(
// flex: 1,
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "Attendance",
// style:
// GoogleFonts.dmSans(
// fontStyle:
// FontStyle.normal,
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold,
// color:
// Colors.grey[600],
// ),
// ),
// Text(
// _allsetController
//     .SchoolIdControllerList[
// 0]["response"]
// [0]
// ["attandance"]
// ["present"]
// .toString(),
// style:
// GoogleFonts.dmSans(
// fontStyle:
// FontStyle.normal,
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold,
// color:
// Colors.grey[600],
// ),
// ),
// SizedBox(
// height: 0.010.sh),
// Container(
// color: Colors.black,
// height: 0.001.sh,
// width: 0.40.sw,
// ),
// ],
// ),
// ),
// SizedBox(width: 0.090.sw),
// Expanded(
// flex: 1,
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "UpComing Exam",
// style:
// GoogleFonts.dmSans(
// fontStyle:
// FontStyle.normal,
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold,
// color:
// Colors.grey[600],
// ),
// ),
// Text(
// 'UpComing Exam',
// style:
// GoogleFonts.dmSans(
// fontStyle:
// FontStyle.normal,
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold,
// color:
// Colors.grey[600],
// ),
// ),
// SizedBox(
// height: 0.010.sh),
// Container(
// color: Colors.black,
// height: 0.001.sh,
// width: 0.40.sw,
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ],
// ),
//
// Positioned(
// top: 0.20.sw,
// child: Align(
// alignment: Alignment.center, child:
// Container(
// height: 0.150.sh,
// width: 0.22.sw,
// child: Text("image comment")
// // CachedNetworkImage(
//
// //   placeholder:  (context, url) => CircleAvatar( maxRadius: MediaQuery.of(context).size.width -
// //       MediaQuery.of(context).size.width +
// //       22,backgroundImage: AssetImage("assets/images/user1.png")),
//
// //   imageUrl: _allsetController.SchoolIdControllerList[0]["response"][0]["profileimage"].toString(),
// // ),
// ),
// ),
// ),
//
// Positioned(
// top: 165,
// child: Column(
// children: [
// InkWell(
// onTap: () {},
// child: Obx(
// () => Text(
// _allsetController.SchoolIdControllerList[0]
// ["response"][0]["name"]
// .toString(),
// style: GoogleFonts.dmSans(
// fontStyle: FontStyle.normal,
// fontSize: 15.sp,
// fontWeight: FontWeight.bold,
// color: Colors.white),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0).r,
// child: InkWell(
// onTap: () {},
// child: Obx(
// () => Text(
// _allsetController
//     .SchoolIdControllerList[0]
// ['parent_info']["mobileno"]
// .toString(),
// style: GoogleFonts.dmSans(
// fontStyle: FontStyle.normal,
// fontSize: 15.sp,
// fontWeight: FontWeight.bold,
// color: Colors.white),
// ),
// ),
// ),
// ),
// ],
// ),
// ),
//
// Positioned(
// bottom: 0.76.sh,
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(right: 60).r,
// child: InkWell(
// onTap: () {},
// child: Text(
// "Communication",
// style: GoogleFonts.dmSans(
// fontStyle: FontStyle.normal,
// fontSize: 15.sp,
// fontWeight: FontWeight.bold,
// color: Colors.yellow),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 60).r,
// child: InkWell(
// onTap: () {},
// child: Text(
// "attendance",
// style: GoogleFonts.dmSans(
// fontStyle: FontStyle.normal,
// fontSize: 15.sp,
// fontWeight: FontWeight.bold,
// color: Colors.yellow),
// ),
// ),
// ),
// ],
// ),
// ),
//
// Positioned(
// bottom: 0.331.sh,
// child: Container(
// color: Colors.black26,
// height: 0.080.sh,
// width: MediaQuery.of(context).size.width,
// child: Stack(
// children: [
// Positioned(
// top: 0.001.sh,
// left: 0.06.sw,
// child: SlideTransition(
// position: _offsetAnimation,
// child: Icon(
// Icons.arrow_right,
// color: Colors.lightBlue,
// size: 52.sp,
// ),
// ),
// ),
// Positioned(
// left: 0.10.sw,
// child: Padding(
// padding: EdgeInsets.only(
// bottom: 0.50.sh,
// ),
// child: SlideTransition(
// position: _Animation,
// child: Icon(
// Icons.arrow_right,
// color: Colors.lightBlue,
// size: 55.sp,
// ),
// ),
// ),
// ),
// Positioned(
// left: 0.22.sw,
// top: 0.025.sh,
// child: GestureDetector(
// onTap: () => {
// Get.toNamed(RoutesName.dashboard),
// },
// child: Container(
// child: Text(
// "Tap Here For E-GYAN Services",
// style: GoogleFonts.dmSans(
// fontStyle: FontStyle.normal,
// fontSize: 15.sp,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
