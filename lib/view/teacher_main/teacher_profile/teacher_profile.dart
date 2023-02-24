import 'dart:async';

import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/controller/student_login_update_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/staff_detial_contriller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class TeacherProfile extends StatefulWidget {
  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {

  final StaffDetailController staffdetailsController = Get.put(StaffDetailController());
  List <dynamic> parentinfo=[];

  var box = Hive.box("schoolData");
  @override
  void initState() {
    var id=box.get("staff_id");
    staffdetailsController.staffDetail(id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        AlwaysScrollableScrollPhysics();
        setState(() {

          var id=box.get("staff_id");
          staffdetailsController.staffDetail(id);

        });

      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Profile ',style: MyGoogeFont.mydmSans),
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) {
                return <PopupMenuEntry<int>>[
                    PopupMenuItem(
                                      onTap:() async { await SessionManager().remove("name");
                                      Get.toNamed(RoutesName.schoolId);
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("logout", style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                        ),
                                          backgroundColor: Colors.white,
                                        ),
                                      );
                                      },
                                      value: 0, child: const Text('Logout')),
                  const PopupMenuItem(child: Text('About'), value: 1),
                ];
              },
            ),
          ],
        ),
        body: Obx(
                () =>  staffdetailsController.isloding.value ?
            Column(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // CircleAvatar(
                          //   backgroundColor: Colors.blue.shade300,
                          //   minRadius: 35.0,
                          //   child: Icon(
                          //     Icons.call,
                          //     size: 30.0.sp,
                          //   ),
                          // ),
                          InkWell(
                            onTap:(){
                              print("teest image");
                              print(staffdetailsController.staffDetailModel.value?.response.image);
                              print("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU");
                          },
                            child: CircleAvatar(
                                backgroundColor: Colors.white70,
                                minRadius: 60.0,
                                child:    CircleAvatar(
                                    foregroundImage: "${staffdetailsController.staffDetailModel.value?.response.image}"!="null"?staffdetailsController.staffDetailModel.value?.response.image!="uploads/staff_images/5/"?
                                    NetworkImage("${ApiUrl.imagesUrl.toString()}${staffdetailsController.staffDetailModel.value?.response.image}")
                                        :  NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU"):NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU"),
                                    radius: 54.0,
                                    backgroundImage:
                                    NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
                                )
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
                        '${staffdetailsController.staffDetailModel.value?.response.name.toString().capitalizeFirst} ${staffdetailsController.staffDetailModel.value?.response.surname.toString().capitalizeFirst}',

                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        '${staffdetailsController.staffDetailModel.value?.response.department.toString().capitalizeFirst}-${staffdetailsController.staffDetailModel.value?.response.designation.toString().capitalizeFirst}',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            '${staffdetailsController.staffDetailModel.value?.response.contactNo}',

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
                            'Employee Id',

                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            '${staffdetailsController.staffDetailModel.value?.response.employeeId}',
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
                Padding(
                  padding: const EdgeInsets.only(top: 5,left: 10,right: 10).r,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Date Of Joining',
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),),
                          trailing: Text(
                            '${MyDateFormat.dateformatmethod1(staffdetailsController.staffDetailModel.value?.response.dateOfJoining.toString())}',
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 8.0),
                          child: SizedBox(
                            height: 60,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                          
                             Text(
                                    'Email Id',
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                          Spacer(),
                                   Padding(
                                     padding: const EdgeInsets.only(right: 15),
                                     child: Text(
                                      '${staffdetailsController.staffDetailModel.value?.response.email}',
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
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 8.0),
                          child: SizedBox(
                            height: 60,
                            child: Row(
                              children: [
                          
                                Text(
                                    "Local Address",
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                Spacer(),
                               Padding(
                                 padding: const EdgeInsets.only(right:17),
                                 child: Text(
                                      '${staffdetailsController.staffDetailModel.value?.response.localAddress}',
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ):Center(child: CircularProgressIndicator())
        ),
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