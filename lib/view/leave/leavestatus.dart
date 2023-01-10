import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/model/user.dart';
import 'package:ecom_desgin/model/user_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class LeaveStatus extends StatefulWidget {
  const LeaveStatus({Key? key}) : super(key: key);

  @override
  _LeaveStatusState createState() => _LeaveStatusState();
}

class _LeaveStatusState extends State<LeaveStatus> {
  int currentTab = 0;
  DateTime today = DateTime.now();

  DateFormat currentDate=DateFormat.yMd();
  List<User> userList = [];

  get dateStr => "${today.day}-${today.month}-${today.year}";
@override
  void initState() {
  String dateStr = "${today.day}-${today.month}-${today.year}";
  print(dateStr);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void addUserData(User user) {
      setState(() {
        userList.add(user);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) =>
         AlertDialog(
           content: AddUserDialog(
             addUserData,
           ),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
           ),
         ),

      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor:AgentColor.appbarbackgroundColor,
        title: Text('Leave Status',style: MyGoogeFont.mydmSans),
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
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
  height: 0.15.sh,
  decoration: const BoxDecoration(
    color: Colors.white,
  ),
  child: Column(
    children: [
      // for (int i = 0; i <= 3; i++)

      InkWell(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          child: Container(
            width: 0.99.sw,
            height: 0.13.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffE3F2FB),
            ),
            child: Stack(

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10,top: 10
                  ).r,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Apply Date:-",
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            dateStr.toString(),
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      // Padding(
                      //   padding:  EdgeInsets.only(right: 14,bottom: 15),
                      //   child: Text(
                      //     "Room No. 12",
                      //
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0.033.sh,

                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ).r,
                    child: Row(
                      children: [
                        // Image.asset("assets/images/teacher.png",width: 0.070.sw,),
                        // SizedBox(
                        //   width: 0.01.sw,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15).r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                "Panding",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),



                            ],
                          ),
                        ),
                        // const Icon(Icons.timelapse),
                        SizedBox(
                          width: 0.094.sw,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 0.15.sw, right: 2,top: 2,bottom: 2).r,
                          child: Container(
                            width: 0.52.sw,
                            height: 0.08.sh,
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius:
                                BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                Text("Start Date",
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),),
                                    Container(
                                      color: Colors.black,
                                      width: 0.24.sw,
                                      height: 0.001.sh,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text( userList[index].fromdate,
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),),
                                    ),
                                  ],
                                ),
                                Container(
                                  width:0.002.sw,
                                  height: 0.1.sh,
                                  color: Colors.white,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text("End Date",
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    Container(
                                      color: Colors.black,
                                      width: 0.24.sw,
                                      height: 0.001.sh,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text( userList[index].todate,
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),),
                                    ),
                                  ],
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
          ),
      )
    ],
  ),
);

        },
        itemCount: userList.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 10,
      //   color: Colors.green,
      //   child: Container(
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //
      //
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
