// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.cardcolor,
    required this.containercolor,
    required this.icon,
    required this.cardName,
  }) : super(key: key);
final Color cardcolor;
final Color containercolor;
final Icon icon;
final String cardName;
  @override
  Widget build(BuildContext context) {
    return Card(
                                     elevation: 10,
                                     shape: RoundedRectangleBorder(
                                         borderRadius: const BorderRadius.only(
                                             topLeft: Radius.circular(10),
                                             bottomLeft: Radius.circular(10),
                                             bottomRight: Radius.circular(10),
                                             topRight: Radius.circular(10)),
                                         side: BorderSide(
                                           width: 5,
                                           color: cardcolor,
                                         )),
                                     color: cardcolor,
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Container(
                                           decoration: BoxDecoration(
                                               color: (containercolor),
                                               borderRadius: BorderRadius.circular(25)),
                                           width: 0.13.sw,
                                           height: 0.063.sh,
                                                                 
                                           // backgroundColor: Colors.amberAccent,
                                                                 
                                           child: (icon),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(8.0).r,
                                           child: Text(
                                             cardName,
                                             style: GoogleFonts.dmSans(
                                               fontStyle: FontStyle.normal,
                                               fontSize: 15.sp,
                                               fontWeight: FontWeight.bold,
                                               color: Colors.white,
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   );
  }
}
