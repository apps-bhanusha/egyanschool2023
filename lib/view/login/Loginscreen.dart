import 'package:ecom_desgin/view/dashboard/HomeScreen.dart';
import 'package:ecom_desgin/view/children/Student_Login.dart';
import 'package:ecom_desgin/view/teacher/Teacher_Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SimpleLogin extends StatefulWidget {
  @override
  _SimpleLoginState createState() => _SimpleLoginState();
}

class _SimpleLoginState extends State<SimpleLogin> {
  int _radioSelected = 0;
  late String _radioVal="";
int rediobutton = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                  clipper: WaveClipper2(),
                  child:Container(
                    child: Column(),
                    width: MediaQuery.of(context).size.width,
                    height: 0.50.sh,
                    decoration: const BoxDecoration(
                        color: Colors.blue

                    ),
                  )
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(   children: <Widget>[
                    SizedBox(
                      height: 0.040.sh,
                    ),
                    Container(
                      child: CircleAvatar(
                        maxRadius: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width +
                            52,
                        backgroundImage:
                        AssetImage("assets/images/appstore.png"),
                        // radius: 220,
                      ),
                    ),
                    SizedBox(
                      height: 0.030.sh,
                    ),
                    Text(
                      "Egyan",
                      style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 0.50.sh,

                  decoration: BoxDecoration(
                      color: Colors.lightBlue
                  ),
                ),
              ),



            ],
          ),

          SizedBox(
            height: 0.040.sh,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32).r,
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: Color.fromRGBO(32,64,81,1.0),
keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: " School Id",

                  prefixIcon: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(
                      Icons.account_circle_rounded,
                      color:  Color.fromRGBO(32,64,81,1.0),
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25,vertical: 13),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.035.sh,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Teachers",
                style: GoogleFonts.dmSans(
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,

                ),),

          Radio(
            value: 1,
            groupValue: _radioSelected,
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                _radioSelected=value!;
                _radioVal="Teacher";
                print(value);
                rediobutton=value;
              });
            },
          ),
              Text("Parrents/Students",
                style: GoogleFonts.dmSans(
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,

                ),),
              Radio(
                value: 2,
                groupValue: _radioSelected,
                activeColor: Colors.pink,
                onChanged: (value) {
                  setState(() {

                    _radioVal="Student";
                    _radioSelected=value!;

                    print(value);
                    rediobutton=value;

                  });

                },
              )
            ],
          ),
          SizedBox(
            height: 0.045.sh,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32).r,

              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  // color:  Colors.blue
                ),
                child: ElevatedButton(
                  child:  Text(
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
                  onPressed: () {
                    if (_radioVal=="Student") {
                      print("student");
                        Get.to (() => StudentLogin());
                    }
                    if(_radioVal=="Teacher"){
                      Get.to (() => TeacherLogin());
                      print("teacher");
                    }
                  },
                ),
              )),
          SizedBox(height:0.05.sh),


        ],


      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        child: Image.asset(
          "assets/images/b.png",
          width: MediaQuery.of(context).size.width,
          height: 0.070.sh,
        ),
      ),
    );
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