
import 'dart:io';
import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    await Hive.initFlutter();
    var  schoolData = await Hive.openBox("schoolData");
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
 final UserNameController _allsetController =Get.put( UserNameController());
  String url = "Your_URL";
  String? userlogin;
  String? manager;
  bool notitap=false;
  @override
  void initState()  {
 var box = Hive.box("schoolData");
var userName= box.get("username");
var password= box.get("password");
    super.initState();
    Future.delayed(
        const Duration(seconds: 4),
            () {
               if(userName!=null){
                
                
                Get.toNamed(RoutesName.schoolId);
               }else{
                _allsetController.apicallpost(userName,password,context);
                Get.toNamed(RoutesName.home);
               }
            }
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


