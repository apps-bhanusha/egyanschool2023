import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/dashboard/drawer.dart';
import 'package:ecom_desgin/view/examination/Exam_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class GridViewall extends StatefulWidget {
  @override
  State<GridViewall> createState() => _GridViewallState();
}

class _GridViewallState extends State<GridViewall>
    with TickerProviderStateMixin {
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

    // _controller.repeat(reverse: true);
    // _controller =  AnimationController(vsync: this, duration: Duration(seconds: 6));
    // colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    // sizeAnimation = Tween<double>(begin: 400.0, end: 400.0).animate(controller);
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
    "Homework",
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
                                       InkWell(
                                         onTap: () {},
                                         child: Container(
                                           decoration: BoxDecoration(
                                               color: (color1[index]),
                                               borderRadius: BorderRadius.circular(25)),
                                           width: 0.13.sw,
                                           height: 0.063.sh,
                                
                                           // backgroundColor: Colors.amberAccent,
                                
                                           child: (icons1[index]),
                                         ),
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
                             );
                           }),
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
            onTap: () => Get.toNamed(RoutesName.busRoute),
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
            onTap: () => Get.toNamed(RoutesName.notification),
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









