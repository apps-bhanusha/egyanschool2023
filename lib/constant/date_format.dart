import 'package:ecom_desgin/constant/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:date_format/date_format.dart';
class MyDateFormat{
  static var  dateformate=formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd]);
  static dateformatmethod(datechange){
    var  dateformate=formatDate(DateTime.parse(datechange),[yyyy, '-', mm, '-', dd]);

    return dateformate;

  }
  static dateformatmethod1(datechange){
    var  dateformate=formatDate(DateTime.parse(datechange),[dd, '-', mm, '-', yyyy]);

    return dateformate;

  }
  static dateformatmethod2(datechange){
    var  dateformate=formatDate(DateTime.parse(datechange),[dd, '-', mm, '-', yyyy," ", HH, ':', nn, ':', ss ]);

    return dateformate;

  }

}