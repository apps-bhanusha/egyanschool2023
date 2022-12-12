import 'package:ecom_desgin/Pages/drawer.dart';
import 'package:ecom_desgin/Pages/gridview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(194, 222, 211, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Container(
              child: Text(
                'EGYAN Demo school',
                style: GoogleFonts.dmSans(
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
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
      body: SingleChildScrollView(
        child: SafeArea(
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
                        height: 0.250.sh,
                      ),
                      SizedBox(
                        height: 0.010.sh,
                      ),
                      Container(
                        height: 0.35.sh,
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              side: BorderSide(
                                  width: 0.001.sw, color: Colors.white)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 200).r,
                                child: Container(
                                  child: Text(
                                    'Children Details 1/1',
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Notice board',
                                      contentPadding: EdgeInsets.all(5),
                                      labelStyle: TextStyle(
                                        color: Colors.grey[400],
                                      )),
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.010.sh),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    // optional flex property if flex is 1 because the default flex is 1
                                    flex: 1,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10).r,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            labelText: 'Fees',
                                            contentPadding:
                                            EdgeInsets.all(5).r,
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400])),
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 0.090.sw),
                                  Expanded(
                                    // optional flex property if flex is 1 because the default flex is 1
                                    flex: 1,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10).r,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: 'Fees Due',
                                          contentPadding: EdgeInsets.all(5).r,
                                          labelStyle: TextStyle(
                                              color: Colors.grey[400]),
                                        ),
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    // optional flex property if flex is 1 because the default flex is 1
                                    flex: 1,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10).r,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            labelText: 'Attendance',
                                            contentPadding:
                                            EdgeInsets.all(5).r,
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400])),
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 0.090.sw),
                                  Expanded(
                                    // optional flex property if flex is 1 because the default flex is 1
                                    flex: 1,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10).r,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            labelText: 'Fees Due',
                                            contentPadding:
                                            EdgeInsets.all(5).r,
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400])),
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Positioned(
                    top: 0.20.sw,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 0.150.sh,
                        width: 0.22.sw,
                        child: CircleAvatar(
                          maxRadius: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width +
                              22,
                          backgroundImage:
                          AssetImage("assets/images/i1.jpeg"),
                          // radius: 220,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 165,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Anil sharma",
                            style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "8357875895",
                              style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
                    bottom: 0.36.sh,
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
                              onTap: () =>  {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewall())),
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

      drawer: MyDrawer(),
    );
  }
}