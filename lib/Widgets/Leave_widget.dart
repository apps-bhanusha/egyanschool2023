// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveWidget extends StatefulWidget {
   LeaveWidget({
    super.key,
     required this.applyDate,
    required this.leave_from,
    required this.leave_to,
    required this.status,
    required this.applied_by,
  });
  String? applyDate;
  String? leave_from;
  String? leave_to;
  String? status;
  String? applied_by;
 late void Function(String value) onTap;
  @override
  State<LeaveWidget> createState() => _LeaveWidgetState();
}

class _LeaveWidgetState extends State<LeaveWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 0.15.sh,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap:(){
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          margin:const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
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
                                      left: 10,top: 5
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
                                                  '${MyDateFormat.dateformatmethod1(widget.applyDate)}',
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
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ).r,
                                    child: Row(
                                      children: [
                                        // Image.asset("assets/images/teacher.png",width: 0.070.sw,),
                                        // SizedBox(
                                        //   width: 0.01.sw,
                                        // ),
                                        SizedBox(
                                          width:0.25.sw,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:5 ,top: 0).r,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                               
                                                      Text(
                                                        '${widget.status.toString().capitalizeFirst}',
                                                        style: GoogleFonts.dmSans(
                                                          fontStyle: FontStyle.normal,
                                                          fontSize: 17.sp,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                

                                                SizedBox(height: 0.010.sh,),
                                                SizedBox(
                                                  width: 0.25.sw,
                                                  child: 
                                                        Text(
                                                          '${widget.applied_by.toString().capitalizeFirst}',
                                                          style: GoogleFonts.dmSans(
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 12.sp,
                                                            fontWeight: FontWeight.normal,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                  
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                        // const Icon(Icons.timelapse),


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
                                                      child:
                                                    
                                                            Text(
                                                              '${MyDateFormat.dateformatmethod1(widget.leave_from)}',
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
                                                      child:   
                                                            Text(
                                                              '${MyDateFormat.dateformatmethod1(widget.leave_to)}',
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
  }
}