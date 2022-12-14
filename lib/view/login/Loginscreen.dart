import 'package:ecom_desgin/controller/school_id_controller.dart';

import 'package:ecom_desgin/view/children/Student_Login.dart';
import 'package:ecom_desgin/view/teacher/Teacher_Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

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
  @override
  void dispose() {

    super.dispose();
  }

  // List  SchoolIdControllerList = [];

  // Future<void> postData() async {
  // print("fdddddddddddddddddddd44444444444444555555555555555555444");
  // //    var headers = {
  // //   'Content-Type': 'text/plain',
  // //   'Cookie': 'ci_session=72ad09608320993a07938376d6296f08fb88ea49'
  // // };
  // var request = http.Request('POST', Uri.parse('https://e-gyan.co.in/api/parentwebservices/getProjectKey'));
  // request.body = '''{\n    "school_id":"5"\n}''';
  // // request.headers.addAll(headers);
  //
  // http.StreamedResponse response = await request.send();
  //
  // if (response.statusCode == 200) {
  // final _model=await response.stream.bytesToString();
  // print( _model);
  //
  // SchoolIdControllerList.add(5);
  //
  //
  // print("777777777777777777777777777");
  // print(SchoolIdControllerList);
  // // print(await response.stream.bytesToString());
  //
  // }
  // else {
  // print(response.reasonPhrase);
  // }
  //
  // }
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
                    InkWell(
                      child: Container(
                        child: CircleAvatar(
                          maxRadius: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width +
                              52,
                          backgroundImage:
                          AssetImage("assets/images/appstore.png"),
                          // radius: 220,
                        ),
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
                    "EGYAN",
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

                    all.apicall( id.text,_radioVal,context);

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