
import 'package:ecom_desgin/Pages/Calendar.dart';
import 'package:ecom_desgin/Pages/HomeScreen.dart';
import 'package:ecom_desgin/Pages/Loginscreen.dart';
import 'package:ecom_desgin/Pages/drawer.dart';
import 'package:ecom_desgin/Pages/gridview.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: GoogleFonts.dmSans().fontFamily,
      primarySwatch: Colors.lightGreen,
      useMaterial3: true,
    ),
    home: const SplashScreen(),
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
        const Duration(seconds: 4),
            () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>   SimpleLogin()),
        ));
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
              body: Center(
                child: SizedBox(
                    height: 400, //double.infinity
                    width: 500, //double.infinity
                    child: Image.asset(
                      'assets/images/appstore.png',
                      gaplessPlayback: true,
                      fit: BoxFit.contain,
                    )),
              ));

        }
    );

  }
}


