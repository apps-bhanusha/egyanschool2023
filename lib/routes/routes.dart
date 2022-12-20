
import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/notification/notification.dart';
import 'package:ecom_desgin/view/bus_routes/bus_routes.dart';
import 'package:ecom_desgin/view/calender/calendar%20_4s.dart';
import 'package:ecom_desgin/view/chat/chat.dart';

import 'package:ecom_desgin/view/children/child_total.dart';
import 'package:ecom_desgin/view/dashboard/HomeScreen.dart';
import 'package:ecom_desgin/view/dashboard/dashboard.dart';
import 'package:ecom_desgin/view/download/download_all.dart';
import 'package:ecom_desgin/view/examination/ExamTimeDetail.dart';
import 'package:ecom_desgin/view/examination/Exam_time_table.dart';
import 'package:ecom_desgin/view/home_work/home_work.dart';
import 'package:ecom_desgin/view/login/Loginscreen.dart';
import 'package:ecom_desgin/view/login/Student_Login.dart';
import 'package:ecom_desgin/view/syllabus/feesgraff.dart';
import 'package:ecom_desgin/view/syllabus/subject.dart';
import 'package:ecom_desgin/view/syllabus/syllabus.dart';
import 'package:ecom_desgin/view/time_table/time_table.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class RoutesName{
  static String splashScreen = '/splashScreen';
  static String dashboard = '/dashboard';
  static String home = '/home';
  static String schoolId = '/schoolId';
  static String stundetLogin = '/studentLogin';
  static String teacherLogin = '/teacherLogin';
  static String profile = '/profile';
  static String attendance = '/attendance';
  
  static String fees = '/fees';
  static String homeWork = '/homeWork';
  static String examination = '/examination';
  static String examiTimeDetial = '/examiTimeDetial';
  static String downloadAll = '/downloadAll';
  static String timetable = '/time_table';
  static String syllabus = '/syllabus';
  static String feesgraff = '/fesesgraff';
  static String lession = '/lession';
  static String chatPage = '/ChatPage';
  static String busRoute = '/busroute';
  static String notification = '/notification';
}

final getpages=[
 GetPage(name: RoutesName.splashScreen, page: () =>  const SplashScreen(),transition: Transition.circularReveal),
 GetPage(name: RoutesName.dashboard, page: () =>  GridViewall()),
 GetPage(name: RoutesName.home, page: () =>  HomeScreen()),
 GetPage(name: RoutesName.schoolId, page: () =>  SimpleLogin()),
 GetPage(name: RoutesName.stundetLogin, page: () =>  const StudentLogin()),
 GetPage(name: RoutesName.fees, page: () =>  const ChildTotal()),
 GetPage(name: RoutesName.homeWork, page: () =>  const HomeWork()),
 GetPage(name: RoutesName.examination, page: () =>  const ExamTimeTable()),
 GetPage(name: RoutesName.examiTimeDetial, page: () =>  const ExamTimeDetail()),
 GetPage(name: RoutesName.downloadAll, page: () =>  const DownloadAll()),
 GetPage(name: RoutesName.timetable, page: () =>  TimeTable()),
 GetPage(name: RoutesName.timetable, page: () =>  TimeTable()),
 GetPage(name: RoutesName.syllabus, page: () =>  const Syllabus()),
 GetPage(name: RoutesName.feesgraff, page: () =>  const FeesGraff()),
 GetPage(name: RoutesName.lession, page: () =>  const SubjectLession()),
 GetPage(name: RoutesName.chatPage, page: () =>  const ChatPage()),
 GetPage(name: RoutesName.attendance, page: () =>   CalendarShow()),
 GetPage(name: RoutesName.busRoute, page: () =>   BusRoute()),
 GetPage(name: RoutesName.notification, page: () =>   NotificationPage()),
];
