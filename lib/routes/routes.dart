import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/view/calender/attendance.dart';
import 'package:ecom_desgin/view/examination/Exam_result.dart';

import 'package:ecom_desgin/view/fees/fees.dart';
import 'package:ecom_desgin/view/leave/addleave.dart';
import 'package:ecom_desgin/view/leave/leavestatus.dart';
import 'package:ecom_desgin/view/login/parent_login.dart';
import 'package:ecom_desgin/view/notification/notification.dart';
import 'package:ecom_desgin/view/profile/profile.dart';
import 'package:ecom_desgin/view/bus_routes/bus_routes.dart';
import 'package:ecom_desgin/view/chat/chat.dart';
import 'package:ecom_desgin/view/dashboard/home.dart';
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
  static String addleave = '/addleave';
  static String leavestatus = '/leavestatus';
  static String examresult = '/Exam_result';
  static String parentLogin = '/parentlogin';

}

final getpages=[
 GetPage(name: RoutesName.splashScreen, page: () =>  const SplashScreen(),transition: Transition.circularReveal),
 GetPage(name: RoutesName.dashboard, page: () =>  GridViewall(),transition: Transition.cupertino),
 GetPage(name: RoutesName.home, page: () =>  HomeScreen(),transition: Transition.cupertinoDialog),
 GetPage(name: RoutesName.schoolId, page: () =>  SimpleLogin(),transition: Transition.downToUp),
 GetPage(name: RoutesName.stundetLogin, page: () =>  const StudentLogin(),transition: Transition.fade),
 GetPage(name: RoutesName.fees, page: () =>  const Fees(),transition: Transition.fadeIn),
 GetPage(name: RoutesName.homeWork, page: () =>  const HomeWork(),transition: Transition.leftToRight),
 GetPage(name: RoutesName.examination, page: () =>  const ExamTimeTable(),transition: Transition.leftToRightWithFade),
 GetPage(name: RoutesName.examiTimeDetial, page: () =>  const ExamTimeDetail(),transition: Transition.rightToLeftWithFade),
 GetPage(name: RoutesName.downloadAll, page: () =>  const DownloadAll(),transition: Transition.circularReveal),
 GetPage(name: RoutesName.timetable, page: () =>  const TimeTable(),transition: Transition.topLevel),
 GetPage(name: RoutesName.timetable, page: () =>  const TimeTable(),transition: Transition.zoom),
 GetPage(name: RoutesName.syllabus, page: () =>  const Syllabus(),transition: Transition.upToDown),
 GetPage(name: RoutesName.feesgraff, page: () =>  const FeesGraff(),transition: Transition.fade),
 GetPage(name: RoutesName.lession, page: () =>  const SubjectLession(),transition: Transition.cupertinoDialog),
 GetPage(name: RoutesName.chatPage, page: () =>  const ChatPage(),transition: Transition.cupertinoDialog),
 GetPage(name: RoutesName.attendance, page: () => Attendance(),transition: Transition.cupertino),
 GetPage(name: RoutesName.busRoute, page: () =>   const BusRoute(),transition: Transition.circularReveal),
 GetPage(name: RoutesName.notification, page: () =>   const NotificationPage(),transition: Transition.fadeIn),
 GetPage(name: RoutesName.profile, page: () =>   Profile(),transition: Transition.circularReveal),
 GetPage(name: RoutesName.addleave, page: () => const AddLeave(),transition: Transition.circularReveal),
 GetPage(name: RoutesName.leavestatus, page: () => const LeaveStatus(),transition: Transition.circularReveal),
 GetPage(name: RoutesName.examresult, page: () => const ExamResult(),transition: Transition.circularReveal),
 GetPage(name: RoutesName.parentLogin, page: () => const ParentLogin(),transition: Transition.circularReveal),
];
