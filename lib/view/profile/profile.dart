import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var  studentpro;
  var studentname;
  var studentclass;
  var studentsection;
  var  studenttotalfees;
  var studentduefees;
  var studentpresent;
  var session;
  var schoolname;
  var company_key;
  var mobileno;
  var admission_no;
  var roll_no;
  var email;
  var box = Hive.box("schoolData");
  @override
  void initState() {
    studentname = box.get("studentname");
    studentclass = box.get("studentclass");
    studentsection = box.get("studentsection");
    studenttotalfees = box.get("studenttotalfees");
    studentduefees = box.get("studentduefees");
    studentpresent = box.get("studentpresent");
    schoolname = box.get("schoolname");
    session = box.get("session");
    studentpro=box.get("studentprofileimage");
    mobileno=box.get("mobileno");
    admission_no=box.get("admission_no");
    roll_no=box.get("roll_no");
    email=box.get("email");

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:AgentColor.appbarbackgroundColor,
          title: Text('Profile ',style: MyGoogeFont.mydmSans),
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
        body: Column(
          children: <Widget>[
            Container(
              height: 0.350.sh,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue.shade300],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // CircleAvatar(
                      //   backgroundColor: Colors.blue.shade300,
                      //   minRadius: 35.0,
                      //   child: Icon(
                      //     Icons.call,
                      //     size: 30.0.sp,
                      //   ),
                      // ),
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: CircleAvatar(
                          radius: 54.0,
                          backgroundImage:
                          NetworkImage('${ApiUrl.imagesUrl.toString()}${studentpro.toString()}'),
                        ),
                      ),
                      // CircleAvatar(
                      //   backgroundColor: Colors.blue.shade300,
                      //   minRadius: 35.0,
                      //   child: Icon(
                      //     Icons.message,
                      //     size: 30.0,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 0.010.sh,
                  ),
                  Text(
                    studentname??"",
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${studentclass??""} ${studentsection??""}',
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.lightBlue.shade300,
                      child: ListTile(
                        title: Text(
                         "Mobile No",

                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          '${mobileno??""}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: ListTile(
                        title: Text(
                          'Admission No',

                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          '${admission_no??""}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 10,right: 10).r,
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Roll No',
                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),),
                      trailing: Text(
                        '${roll_no??""}',
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Samagra Id',
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      trailing: Text(
                        '${email??""}',
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                       "AdharCard",
                       style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      ),
                      trailing: Text(
                        '${email??""}',
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}
// import 'package:flutter/material.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Profile"),),
//       body: ClipOval(
//
//         child: Image.asset("assets/images/girls.png",width: 80,height: 80,),)
//       );
//
//   }
// }