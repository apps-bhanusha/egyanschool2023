import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/parent_login.dart';
import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/dashboard/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class ParentLogin extends StatefulWidget {
  const ParentLogin({super.key});

  @override
  State<ParentLogin> createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
 
 var  inputvalues = TextEditingController();

  TextEditingController usersname = TextEditingController();
  TextEditingController password = TextEditingController();

  final UserNameController _allsetController =Get.put( UserNameController());
  final GetSchoolSettingController _schoolsetting =Get.put(GetSchoolSettingController());
  final ParentLoginController parentLoginController=Get.put(ParentLoginController());
  List<UserNameController> _dataset = [];
  int _radioSelected = 0;
  late String _radioVal = "";
  int rediobutton = 0;

  @override
  void initState() {
    super.initState();
  print("33333333333333333333333332222222222222222222222221111111111111");


  }
  // TextEditingController _controller = new TextEditingController();
  // bool _enabled = false;
  // final _formkey = GlobalKey<FormState>();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      ListView(
        children: <Widget>[
          Stack(

            children: <Widget>[
              ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    child: Column(),
                    width: MediaQuery.of(context).size.width,
                    height: 0.44.sh,
                    decoration: const BoxDecoration(color: Colors.blue),
                  )),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(

                  child: Column(
                    children: <Widget>[SizedBox(height: 0.010.sh,),
                      ClipOval(child: Obx(()=> _schoolsetting.loadingimage.value?Image.network(_schoolsetting.GetSchoolSettingControllerList[0]["response"]["image"],width: 100,height: 100,):CircularProgressIndicator())),
                      SizedBox(height: 0.010.sh,),
                      SizedBox(

                        child: Obx(() => _schoolsetting.loadingimage.value? Text(_schoolsetting.GetSchoolSettingControllerList[0]["response"]["name"],style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,

                            ),
                          overflow:TextOverflow.ellipsis,
                        ):const Text("")),
                      ),],),width: MediaQuery.of(context).size.width,height: 0.43.sh,decoration: const BoxDecoration(color: Colors.lightBlue),),),
            
          Positioned (
            top: 0.25.sh,
            left: 0.32.sw,
  
               child: Text("Parent Login",style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
             
                              ),
               ),
             )
            ],
          ),
        

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32).r,
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: usersname,
                onChanged: (String value) {},
                cursorColor: Color.fromRGBO(32, 64, 81, 1.0),
                decoration: const InputDecoration(
                  hintText: " UserName",
                  prefixIcon: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(
                      Icons.account_circle_rounded,
                      color: Color.fromRGBO(32, 64, 81, 1.0),
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.015.sh,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32).r,
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextFormField(
                controller: password,
                obscureText: _isHidden,
                onChanged: (String value) {},
                cursorColor: Color.fromRGBO(32, 64, 81, 1.0),
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Material(
                    elevation: 2,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(
                      Icons.account_circle_rounded,
                      color: Color.fromRGBO(32, 64, 81, 1.0),
                    ),
                  ),
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(Icons.visibility),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password  cannot be empty";
                  } else if (value.length < 6) {
                    return "Password length should be atleast 6";
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 0.015.sh,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32).r,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  // color:  Colors.blue
                ),
                child: ElevatedButton(
                  // ignore: sort_child_properties_last
                  child: Text(
                    "Login",
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                //  _allsetController.apicallpost(usersname.text,password.text,context);
                 parentLoginController.parentapi(usersname.text, password.text, context);
               await sessionManager.set("name", usersname.text);
               await sessionManager.set("passward", password.text);
               print("1111111000000878888888888800000000000000000000555555555555555555555555550");
               print(await sessionManager.set("name", usersname.text));
                  },
                ),
              )),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 30).r,
              child: Text(
                "Forget PassWord",
                style: GoogleFonts.dmSans(
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0).r,
          //   child: Align(
          //     alignment: Alignment.center,
          //     child: Container(
          //       child: Text(
          //         "EGYAN Demo School",
          //         style: GoogleFonts.dmSans(
          //           fontStyle: FontStyle.normal,
          //           fontSize: 20.sp,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.lightBlue,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0).r,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                child: Container(
                  child: Text(
                    "Change School",
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                onTap: () { Get.toNamed(RoutesName.schoolId);},
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
             color: Color.fromARGB(255, 196, 236, 255),

        child: Image.asset(
          "assets/images/b.png",
          width: MediaQuery.of(context).size.width,
          height: 0.070.sh,
        ),
      ),
    );
  }


  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.49, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}