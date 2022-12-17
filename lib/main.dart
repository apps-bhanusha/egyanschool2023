
import 'dart:io';

import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/calender/Calendar.dart';
import 'package:ecom_desgin/view/dashboard/HomeScreen.dart';
import 'package:ecom_desgin/view/login/Loginscreen.dart';
import 'package:ecom_desgin/view/dashboard/drawer.dart';
import 'package:ecom_desgin/view/dashboard/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  await Hive.initFlutter();
  var schoolData = await Hive.openBox("schoolData");
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: GoogleFonts.dmSans().fontFamily,
      primarySwatch: Colors.lightGreen,
      useMaterial3: true,
    ),
    home: const SplashScreen(),
    initialRoute: RoutesName.splashScreen,
    getPages: getpages,
  ));

}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  String url = "Your_URL";
  String? userlogin;
  String? manager;
  bool notitap=false;
  @override
  void initState() {

    super.initState();
    Future.delayed(
        const Duration(seconds: 8),
            () => Get.toNamed(RoutesName.schoolId),
    );
  }



  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: Size(w,h),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
              backgroundColor:  Colors.white,
              body: Image.asset(
                'assets/images/splashscreen.gif',
                gaplessPlayback: true,
                fit: BoxFit.fitHeight,
                width: w,
                height: h,
              ));

        }
    );

  }
}


