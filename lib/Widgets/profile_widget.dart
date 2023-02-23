// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:ecom_desgin/constant/api_url.dart';
// import 'package:ecom_desgin/constant/date_format.dart';
// import 'package:ecom_desgin/constant/font.dart';
// import 'package:ecom_desgin/routes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ProfileWidget extends StatelessWidget {
//   ProfileWidget({
//     Key? key,
//     required this.imageUrl,
//     required this.studentName,
//     required this.surName,
//     required this.className,
//     required this.section,
//     required this.mobileNo,
//     required this.adminssionNo,
//     required this.rollNo,
//     required this.samagraId,
//     required this.adharCard,
//   }) : super(key: key);
//   final String imageUrl;
//   final String studentName;
//   final String surName;
//   final String className;
//   final String section;
//   final String mobileNo;
//   final String adminssionNo;
//   final String rollNo;
//   final String samagraId;
//   final String adharCard;
//   List <dynamic> parentinfo=[];
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return 
//      Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).primaryColor,
//           title: Text('Profile ',style: MyGoogeFont.mydmSans),
//           actions: [
//             PopupMenuButton<int>(
//               itemBuilder: (context) {
//                 return <PopupMenuEntry<int>>[
//                     PopupMenuItem(
//                                       onTap:() async { await SessionManager().remove("name");
//                                       Get.toNamed(RoutesName.schoolId);
//                                       // ignore: use_build_context_synchronously
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(content: Text("logout", style: GoogleFonts.dmSans(
//                                           fontStyle: FontStyle.normal,
//                                           fontSize: 15.sp,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.red,
//                                         ),
//                                         ),
//                                           backgroundColor: Colors.white,
//                                         ),
//                                       );
//                                       },
//                                       value: 0, child: const Text('Logout')),
//                   const PopupMenuItem(value: 1, child: Text('About')),
//                 ];
//               },
//             ),
//           ],
//         ),
//         body: Obx(
//                 () => 
//             Column(
//               children: <Widget>[
//                 Container(
//                   height: 0.350.sh,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.blue, Colors.blue.shade300],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       stops: [0.5, 0.9],
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           // CircleAvatar(
//                           //   backgroundColor: Colors.blue.shade300,
//                           //   minRadius: 35.0,
//                           //   child: Icon(
//                           //     Icons.call,
//                           //     size: 30.0.sp,
//                           //   ),
//                           // ),
//                           CircleAvatar(
//                               backgroundColor: Colors.white70,
//                               minRadius: 60.0,
//                               child:    CircleAvatar(
//                                   foregroundImage: imageUrl!="null"?
//                                   NetworkImage("${ApiUrl.imagesUrl.toString()}$imageUrl")
//                                       :  NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU"),
//                                   radius: 54.0,
//                                   backgroundImage:
//                                   NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
//                               )
//                           ),
//                           // CircleAvatar(
//                           //   backgroundColor: Colors.blue.shade300,
//                           //   minRadius: 35.0,
//                           //   child: Icon(
//                           //     Icons.message,
//                           //     size: 30.0,
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 0.010.sh,
//                       ),
//                       Text(
//                         '${studentName.toString().capitalizeFirst} ${surName.toString().capitalizeFirst}',

//                         style: GoogleFonts.dmSans(
//                           fontStyle: FontStyle.normal,
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),

//                       Text(
//                         '${className.toString().capitalizeFirst}-${section.toString().capitalizeFirst}',
//                         style: GoogleFonts.dmSans(
//                           fontStyle: FontStyle.normal,
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Expanded(
//                       child: Container(
//                         color: Colors.lightBlue.shade300,
//                         child: ListTile(
//                           title: Text(
//                             "Mobile No",

//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           subtitle: Text(
//                             mobileNo,

//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white70,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         color: Colors.blue,
//                         child: ListTile(
//                           title: Text(
//                             'Employee Id',

//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           subtitle: Text(
//                             adminssionNo,
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white70,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5,left: 10,right: 10).r,
//                   child: Card(
//                     child: Column(
//                       children: <Widget>[
//                         ListTile(
//                           title: Text(
//                             'Date Of Joining',
//                             style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             ),),
//                           trailing: Text(
//                             '${MyDateFormat.dateformatmethod1(staffdetailsController.staffDetailModel.value?.response.dateOfJoining.toString())}',
//                             style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ),
//                         Divider(),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15.0,right: 8.0),
//                           child: Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [

//                            SizedBox(
//                              width:0.2.sw,
//                              height: 0.070.sh,
//                              child: Text(
//                                     'Email Id',
//                                     style: GoogleFonts.dmSans(
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 15.sp,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                            ),
// Spacer(),
//                                  Padding(
//                                    padding: const EdgeInsets.only(right: 15),
//                                    child: Text(
//                                     '${staffdetailsController.staffDetailModel.value?.response.email}',
//                                     style: GoogleFonts.dmSans(
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 15.sp,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue,
//                                     ),
//                                                                  ),
//                                  ),

//                             ],
//                           ),
//                         ),
//                         Divider(),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15.0,right: 8.0),
//                           child: Row(
//                             children: [

//                               SizedBox(
//                                 width:0.3.sw,
//                                 height: 0.070.sh,
//                                 child: Text(
//                                     "Local Address",
//                                     style: GoogleFonts.dmSans(
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 15.sp,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                               ),
//                               Spacer(),
//                              Padding(
//                                padding: const EdgeInsets.only(right:17),
//                                child: Text(
//                                     '${staffdetailsController.staffDetailModel.value?.response.localAddress}',
//                                     style: GoogleFonts.dmSans(
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 15.sp,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                              ),

//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             )
//         ),
//       );
    
//   }
// }
