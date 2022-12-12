import 'package:ecom_desgin/Pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ChildTotal extends StatefulWidget {
  const ChildTotal({Key? key}) : super(key: key);

  @override
  State<ChildTotal> createState() => _ChildTotalState();
}

class _ChildTotalState extends State<ChildTotal> {
  int _index=0;
  int s=0;
  String dropdownvalue = 'Select your Address';
  String area = 'Select your Area';

  int _currentIndex = 0;
  late PageController _pageController;
  // List of items in our dropdown menu
  var items = [
    'Mohan Sharma',
    'Mohan garase',
    'Shani patel',
    'Mohan kapoor',
    'Mohan panday',
  ];
  var items1 = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                  fontSize:15.sp,
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
                        fontSize:12.sp,
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
                        fontSize:12.sp,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,right: 300).r,
              child: Container(
                child: Text(
                  'Fees',
                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize:18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

        SizedBox(height: 0.010.sh,),
        Stack(
          children: [

            Container(
              height: 0.60.sw,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    side: BorderSide(width: 0.001.sw, color: Colors.white60)),
                child: Column(
                  children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),  topRight: Radius.circular(10)),),

                    height: 0.02.sh,

                  ) ,
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 100).r,
                      child: Container(
                        child: Text(
                          'Mohan Sharma',
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize:18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30).r,
                          child: Container(

                            child:Transform.scale(
                              scale: s == _index ?  2 : 2,
                              // transform: Matrix4.identity(),

                              child:  ClipRRect(
                                // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),




                                child: CircleAvatar(
                                  maxRadius: MediaQuery.of(context).size.width -
                                      MediaQuery.of(context).size.width +
                                      22,
                                  backgroundImage  : AssetImage("assets/images/i1.jpeg"),


                                ),
                              ),
                            ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40).r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Class',
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize:15.sp,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Section',
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize:15.sp,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150).r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  '1st',
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize:15.sp,
                                    fontWeight: FontWeight.bold,
color: Colors.lightBlue
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'A',
                                  style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize:15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left:10 ,top: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Attendance',
                                  labelStyle: TextStyle(
                                      color: Colors.grey[400]
                                  )
                              ),
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15.sp,
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
                            padding: const EdgeInsets.only(right:10 ,top: 20  ),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Fees Due',
                                  labelStyle: TextStyle(
                                      color: Colors.grey[400]
                                  )
                              ),
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15.sp,
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
            SizedBox(height: 0.020.sw),
            Container(
              height: 0.60.sw,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    side: BorderSide(width: 0.001.sw, color: Colors.white60)),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),  topRight: Radius.circular(10)),),

                      height: 0.02.sh,

                    ) ,
Padding(
  padding: const EdgeInsets.all(8.0).r,
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Container(
      child:  Text(
        'Grand Total',
        style: GoogleFonts.dmSans(
          fontStyle: FontStyle.normal,
          fontSize:15.sp,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
      ),
    ),
    Container(
      child: Text(
        '5059',
        style: GoogleFonts.dmSans(
          fontStyle: FontStyle.normal,
          fontSize:15.sp,
          fontWeight: FontWeight.normal,
          color: Colors.lightBlue,
        ),
      ),
    ),
  ],
  ),
),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Discount',
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '0',
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child:  Text(
                              'Amount',
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '0',
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child:  Text(
                              'Fine',
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Balance',
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '5059',
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.lightBlue,
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
          ],
        ),

      ),
      drawer: MyDrawer(),
    );

  }
}
