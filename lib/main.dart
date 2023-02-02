import 'dart:io';
import 'package:ecom_desgin/controller/parent_login.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/Attendance/Calendar.dart';
import 'package:ecom_desgin/view/dashboard/home.dart';
import 'package:ecom_desgin/view/login/School_id_login.dart';
import 'package:ecom_desgin/view/dashboard/drawer.dart';
import 'package:ecom_desgin/view/dashboard/dashboard.dart';
import 'package:ecom_desgin/view/parent/parent_student_list_change.dart';
import 'package:ecom_desgin/view/teacher/home_work/home_work.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
var sessionManager = SessionManager();
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
  // ParentLoginController parentLoginController=Get.put(ParentLoginController());

  var name;
  var parentlogin;
  String url = "Your_URL";
  String? userlogin;
  String? manager;
  bool notitap=false;
  @override
  void initState() {
   usercheck();
    super.initState();
    print("setion ckeck .................");
    print(name);
    print(parentlogin);
    Future.delayed(
      const Duration(seconds: 7),
          () => name!=null ? "parentlogin"==parentlogin? 
           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>const ParentStudentList()), (Route<dynamic> route) => false)
          :Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>const HomeScreen()), (Route<dynamic> route) => false)
          : Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SimpleLogin()), (Route<dynamic> route) => false)
         
  //         () {
  //     var box = Hive.box("schoolData");
  //    var user=    box.get("username").toString();
  //     var pass=  box.get("password").toString();
  //  parentLoginController.parentapi(user, pass,"");
  //  Get.to(const ParentStudentList());
  //         }
    );
   // name!=null ?Get.toNamed(RoutesName.home):Get.toNamed(RoutesName.schoolId),

  }
Future<void> usercheck() async {
  name=await SessionManager().get("name");
  parentlogin=await SessionManager().get("parentlogin");
}
// parentloginrecall(){
//        var box = Hive.box("schoolData");
//      var user=    box.get("username");
//       var pass=  box.get("password").toString();
//   parentLoginController.parentapi(user, pass,"");
//   Get.to(const ParentStudentList());
// }



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


