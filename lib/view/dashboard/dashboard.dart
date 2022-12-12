import 'package:ecom_desgin/view/dashboard/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final icons1 = [
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

  // Future<double> _updateState()  {
  //   setState(() {
  //     _width=400;
  //     _height=400;
  //   });
  // }
// This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromRGBO(194, 222, 211, 1.0),
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Row(
              children: [
                Container(
                  child: Text(
                    'EGYAN Demo school',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26).r,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Session',
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '2020-21',
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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
                    const PopupMenuItem(child: Text('0'), value: 0),
                    const PopupMenuItem(child: Text('1'), value: 1),
                  ];
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 25, right: 25).r,
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                crossAxisSpacing: 3.0,
                childAspectRatio: 1.1,
              ),
              children: List.generate(8, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 1, right: 1, bottom: 5),
                  child: ScaleTransition(
                    scale: Tween(begin: 0.9, end: 1.0).animate(
                      CurvedAnimation(
                          parent: _controller, curve: Curves.linear),
                    ),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
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
          drawer: MyDrawer(),
        ));
  }
}
