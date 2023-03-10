import 'package:ecom_desgin/Widgets/footer_widget.dart';
import 'package:ecom_desgin/controller/getexamsSchedule1_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/parent_login.dart';
import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/staff_detial_contriller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_login_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
class StudentLogin extends StatefulWidget {


  const StudentLogin({super.key,});

  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  var rediobutton;
 var  inputvalues = TextEditingController();

  TextEditingController usersname = TextEditingController();
  TextEditingController password = TextEditingController();

  final UserNameController _allsetController =Get.put( UserNameController());
  final GetSchoolSettingController _schoolsetting =Get.put(GetSchoolSettingController());
 final ParentLoginController parentLoginController=Get.put(ParentLoginController());
 final TeacherLoginController _teacherLoginController =Get.put(TeacherLoginController());
  final StaffDetailController staffdetailsController = Get.put(StaffDetailController());
  GetexamsSchedule1Controller getexamview1=Get.put(GetexamsSchedule1Controller());
  List<UserNameController> _dataset = [];
  int _radioSelected = 0;
  late String _radioVal = "";
  // int rediobutton = 0;

  @override
  void initState() {
    rediobutton=Get.arguments[0];
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
                    decoration: BoxDecoration(color: Colors.blue),
                  )),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(

                  width: MediaQuery.of(context).size.width,height: 0.43.sh,decoration: const BoxDecoration(color: Colors.lightBlue),

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
                      ),],),),),
           Positioned (
            top: 0.25.sh,
            left: 0.32.sw,
            
               child: Text(rediobutton==1?"Staff Login":rediobutton==2?"Parent Login":"Student Login",style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
             
                              ),

               )
               ),
            ] ),


          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30).r,
            child: Material(
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: usersname,
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                decoration: const InputDecoration(
                  hintText: " UserName",
                  prefixIcon: Padding(
                    padding:  EdgeInsets.all(8),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.account_circle_rounded,
                        color: Color.fromRGBO(32, 64, 81, 1.0),
                      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 30).r,
            child: Material(
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: TextFormField(
                controller: password,
                obscureText: _isHidden,
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                decoration: InputDecoration(
                  hintText: " Password",
                  prefixIcon: const Padding(
                    padding:  EdgeInsets.all(8),
                    child:  Material(
                      elevation: 2,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.account_circle_rounded,
                        color: Color.fromRGBO(32, 64, 81, 1.0),
                      ),
                    ),
                  ),
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: const Icon(Icons.visibility),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                ),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Password  cannot be empty";
                //   } else if (value.length < 6) {
                //     return "Password length should be atleast 6";
                //   }
                //   return null;
                // },
              ),
            ),
          ),
          SizedBox(
            height: 0.015.sh,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32).r,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  // color:  Colors.blue
                ),
                child: ElevatedButton(
                  // ignore: sort_child_properties_last
                  child: Obx(
                   () => _allsetController.isloading.value ? Text(
                      "Login",
                      style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ):  parentLoginController.loadingdata.value ? Text(
                      "Login",
                      style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ): _teacherLoginController.teachertLogin.value? Text(
                      "Login",
                      style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ):const Center(child: CircularProgressIndicator(color: Colors.white),)
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                    
                    if(rediobutton==3) {
                      print("student");
                      print(rediobutton);
                      _allsetController.isloading.value=false;
                      parentLoginController.loadingdata.value=false;
                     _teacherLoginController.teachertLogin.value = false;
                      _allsetController.apicallpost(
                          usersname.text, password.text, context);
                      getexamview1.loadingGetexamsSchedule1.value = false;
                    }
                    if(rediobutton==2) {
                      print(rediobutton);
                      _allsetController.isloading.value=false;
                      print("parentll");
                      parentLoginController.loadingdata.value=false;

                      parentLoginController.parentapi(usersname.text, password.text, context);
                    }
                    if(rediobutton==1) {

                    _allsetController.isloading.value=false;
                      parentLoginController.loadingdata.value=false;
                     _teacherLoginController.teachertLogin.value = false;
                      // parentLoginController.loadingdata.value=false;
                      // _allsetController.isloading.value =false;
                      print(rediobutton);
                      print("teacherll");
                      _teacherLoginController.teachertLogin.value = false;
                      _teacherLoginController.teacherLoginApi(usersname.text,password.text,context);
                    staffdetailsController.isloding.value=false;
                    }
                    },

                ),
              )),

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
      bottomNavigationBar:const FooterWidget() 
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