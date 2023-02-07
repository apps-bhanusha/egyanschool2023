import 'package:ecom_desgin/controller/school_id_controller.dart';
import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/login/Student_Login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SimpleLogin extends StatefulWidget {

  @override

  _SimpleLoginState createState() => _SimpleLoginState();
}

class _SimpleLoginState extends State<SimpleLogin> {

  TextEditingController id = new TextEditingController();
  SchoolIdController all = SchoolIdController();

  List <SchoolIdController> _dataset = [];
  int _radioSelected = 0;
  late String _radioVal = "";
  int rediobutton = 0;

  String? string; // Nullable String

  void main() {
    var len = string!.length; // Runtime error: Null check operator used on a null value
  }
  @override
  void initState() {

    // Get.toNamed(
    //   'SimpleLogin',
    //   arguments: _radioVal,
    // );

    // Get.off(()=>SchoolIdController( _radioVal,));
    super.initState();

  }
  // Future<void>data() async {
  //
  //   var passward=await SessionManager().get("passward");
  //   print("sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
  //   print(name);
  //   print(passward);
  //
  //   if (name!=null)
  //     Get.toNamed(RoutesName.home);
  //     await SessionManager().update();
  //     await SessionManager().destroy();
  //     await SessionManager().remove("name");
  //
  //   }else{
  //     Get.toNamed(RoutesName.stundetLogin);
  //   }
  //   // var name=await SessionManager().get("name");
  //
  //
  // }
  @override
  void dispose() {

    super.dispose();
  }


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
                  width: MediaQuery.of(context).size.width,
                  height: 0.50.sh,

                  decoration: const BoxDecoration(
                      color: Colors.lightBlue
                  ),
                  child: Column(   children: <Widget>[
                    SizedBox(
                      height: 0.040.sh,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        maxRadius: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width +
                            52,
                        backgroundImage:
                        const AssetImage("assets/images/appstore.png"),
                        // radius: 220,
                      ),
                      // onTap:() {
                      //   setState(() {
                      //     all.apicall(5);
                      //     print("545445545444444444445555555555555");
                      //     print(all.SchoolIdControllerList);
                      //     // print(all.SchoolIdControllerList[0]["company_key"]);
                      //
                      //   });
                      // },
                    ),
                    SizedBox(
                      height: 0.030.sh,
                    ),
                    Text(
                    "E-GYAN",
                      style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
    controller:id,
                onChanged: (String value) {

                },
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
            Text("Parents",
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

                    _radioVal="parent";
                    _radioSelected=value!;

                    print(value);
                    rediobutton=value;

                  });

                },
              ),
              Text("Students",
                style: GoogleFonts.dmSans(
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,

                ),),
              Radio(
                value: 3,
                groupValue: _radioSelected,
                activeColor: Colors.pink,
                onChanged: (value) {
                  setState(() {

                    _radioVal="Student";
                    _radioSelected=value!;

                    print(value);
                    rediobutton=value;
print(rediobutton);
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
                  // ignore: sort_child_properties_last
                  child:  Obx(
                    () => all.isloading.value ? Text(
                      "Next",
                      style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  
                    ):const Center(child:  CircularProgressIndicator(color: Colors.white,)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                   all.isloading.value=false;
                  all.apicall(id.text,rediobutton,context);
                   // id.text= await (sessionManager.set("id", id.text));
                    //    if (all.SchoolIdControllerList[0]["status"]==true) {
                    //       if(_radioVal=="Student" ){
                    //         all.apicall( id.text,_radioVal);
                    //       }else {
                    //         print("invalid id");
                    //       }
                    //    } else {
                    //      print("School ID Invailid");
                    //    }
                    // if(_radioVal=="Teacher"){
                    //   all.apicall(id.text,_radioVal);
                    //   print("teacher");
                    //   // all.apicall(id.text);
                    // }
                  },
                ),
              )),
          SizedBox(height:0.05.sh),


        ],


      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 196, 236, 255),
        child:Row(
                 
                  children: [
                    Padding(
padding:  EdgeInsets.only(left: 0.09.sw).r,
child: const ClipRRect(
child: CircleAvatar(
radius: 20.0,
backgroundImage:
AssetImage("assets/images/appstore.png"),
),
),
),
                     Padding(
                       padding:  EdgeInsets.only(left: 0.05.sw,top: 10),
                       child: const Text("Powered By :-"),
                     ),
                    Image.asset(
                      "assets/images/b.png",
                      width: 0.4.sw,
                      height: 0.070.sh,
                    ),
                  ],
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