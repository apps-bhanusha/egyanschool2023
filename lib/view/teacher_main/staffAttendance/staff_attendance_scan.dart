// ignore_for_file: file_names, avoid_print, duplicate_ignore

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/staff_detial_contriller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
    final GetSchoolSettingController _schoolsetting =
  Get.put(GetSchoolSettingController());
  // final TeacherLoginController teacherLoginController= Get.put(TeacherLoginController());
    final StaffDetailController staffdetailsController = Get.put(StaffDetailController());

    var box = Hive.box("schoolData");
  Barcode? result;
  var qcompany_id;
  String? quser_id;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  double _currentSliderValue = 300;
  int alloweddistance=0;
  var company_name;
  var compani_id;
  var user_id;
  var logo;
  var img;
 var   company_key;
  // var lat1 = 22.7439495;
  // var lon1 = 75.8919613;
  // var la2 = 22.7184562;
  // var lo2 = 75.8547167;

  List<dynamic> _data = [];
  bool servicestatus = false;
  bool haspermission = false;
  bool attendanceloading = false;
  late LocationPermission permission;
  late Position position;
  // ignore: prefer_typing_uninitialized_variables
  var  distense;
  late double? lat1;
  late double? lon1;
  late double lat2;
  late double lon2;
  late StreamSubscription<Position> positionStream;
  @override
  initState() {
    // _schoolsetting.loadingimage.value=false;
     company_key = box.get("company_key");
    _schoolsetting.GetSchoolSettingapi(company_key,);
    getsavedata();
    checkGps();
    super.initState();
  }

  getsavedata() {
    String lt = box.get("lat")??"4332.3243";
    String lg = box.get("lang")??"324324324.324";
    String alw = box.get("50")??"10";
    setState(() {
      lat2 = double.parse(lt);
      lon2 = double.parse(lg);
      print("befor user  tada");
      print(lat2);
      print(lon2);
      logo = box.get("logo");
      img = box.get("company_logo");
      company_name = box.get("name")??"MMGSOFT";
      // compani_id = int.parse(box.get("id")??"O");
      user_id = box.get("user_id")??"01";
      // alloweddistance = int.parse(alw);
      print("Distance...................");
      print(box.get("distance"));
      alloweddistance =int.parse(box.get("distance").toString());
      print('Distance allow');
      print(alloweddistance);
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

///////////////////////
  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }
      if (haspermission) {
        setState(() {
          //refresh the UI
        });
        // call method in .........................................
        gps();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }
    setState(() {
      //refresh the UI
    });
  }

//gps method
  gps() async {
    print("1");
    bool servicestatus = await Geolocator.isLocationServiceEnabled();
    print("2");
    if (servicestatus) {
      print("GPS service is enabled");
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("current user data");
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457
      setState(() {
         lat1 = position.latitude.toDouble();
         lon1 = position.longitude.toDouble();
            Fluttertoast.showToast(
          msg: "get current location",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.transparent,
          textColor: Color.fromARGB(255, 42, 45, 230),
          fontSize: 17.0);
      });
    } else {
      print("GPS service is disabled.");
    }
  }

  // distance to km method
  double calculateDistance(la1, lo1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - la1) * p) / 2 +
        cos(la1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lo1) * p)) / 2;
    return 12742 * asin(sqrt(a));
    
  }

  Future attendanse() async {

    print("M");
    if (qcompany_id == company_key) {
      print("company id match");
    } else {

      Fluttertoast.showToast(
          msg: "company id not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 17.0);
      print("company id not match");
      Future.delayed(Duration(seconds: 4),() async {
        attendanceloading = false;
           await controller!.resumeCamera();
        setState(() {
          Navigator.pop(context);
        });
            
       });
    }
    if (distense <= alloweddistance) {
      print("distance allow");
    } else {
      print("distance not allow");

      Fluttertoast.showToast(
          msg: "distance not allow",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 17.0);
     Future.delayed(Duration(seconds: 4),() async {
        attendanceloading = false;
           await controller!.resumeCamera();
        setState(() {
          Navigator.pop(context);
        });
            
       });
    }
      print("**************************");
      print(qcompany_id);
      print("|||||||||||||||||||||||||||||||||");
      print(compani_id);
      print("**********************");
    /// all tada currect
    if (qcompany_id == company_key && distense <= alloweddistance) {
      print("all tada currect");
      // attendance api call
   final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.staffattendanceUrl);
      // final urlpost = Uri.parse(
 
            var id=box.get("staff_id");
      //     "https://demo.bhanushainfosoft.com/scanq_scanner/api/attendance");
    
                    var body = json.encode({
                                "company_key":company_key.toString(),
                                "staff_id":id,
                                "lat":lat1.toString(),
                                "lang":lon2.toString()

                                    });
      try {
        var response = await http.post(urlapi, body: body);

        if (response.statusCode == 200) {
          var time=0;
          var data = jsonDecode(response.body.toString());
          setState(() {
            setState(() {
              _data = [data];
            });
          });
          print('responce /.................................');
          print(data);
          if(data["status"]==true){
         
           
            staffdetailsController.staffDetail(id);
            if(time==0){
  String timeIn = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
  box.put("timein", timeIn);
            }else{
  String timeOut = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
  box.put("timeout", timeOut);

            }


            Fluttertoast.showToast(
              msg: data["message"],//_data[0]["response"].toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 18.0);
           Future.delayed(const Duration(seconds: 4),() async {
        attendanceloading = false;
           await controller!.resumeCamera();
        setState(() {
          Navigator.pop(context);
        });
            
       });
          }
         
        
        } else {

          print("bad responce");
          setState(() {
            attendanceloading = false;
          });
          Fluttertoast.showToast(
              msg: "Bad Responce",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 17.0);
      Future.delayed(Duration(seconds: 4),() async {
        attendanceloading = false;
           await controller!.resumeCamera();
        setState(() {
           Navigator.pop(context);
        });
            
       });
        }
      } catch (e) {

        print(e);
      
        Fluttertoast.showToast(
            msg: "Error$e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 17.0);
        Future.delayed(Duration(seconds: 4),() async {
        attendanceloading = false;
           await controller!.resumeCamera();
        setState(() {
           Navigator.pop(context);
        });
            
       });
      }
    } else {



      Fluttertoast.showToast(
          msg: "data not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 18.0);
      // Future.delayed(Duration(seconds: 3),(){
      //   setState(() async {
      //     attendanceloading = false;
      //     await controller!.resumeCamera();
      //   });
      // });

     
    }
  }

  Future qrcodevalidetions() async {
    // ignore: avoid_printprint
// qrcode validetion
    print("A");
    if (result != null) {
       await controller?.pauseCamera();
      print("B");
      // qr code data find
/////////////////////////////////////////////////////
      // Fluttertoast.showToast(
      //     msg: "you are scan :--  ${result!.format.formatName}",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.black54,
      //     textColor: Colors.white,
      //     fontSize: 17.0);
      ///////////////////////////////////////////////

      getsavedata();
      String? code = result!.code;
      String string = code!;
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      print(string);
      // var s1 = (string.lastIndexOf('-'));
      // print(s1);
      // var resultcomp = string.substring(0, s1);
      // print(resultcomp);
      // var resultuser = string.substring(s1 + 1);
      // print(resultuser);
      // var ci = (resultcomp.lastIndexOf('0'));
      // print(ci);
      // var cidf = resultcomp.substring(ci + 1);
      // print(cidf);
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      setState(() {
        // result = "" as Barcode?;
        qcompany_id = string;
        // quser_id = resultuser;
      });
      print("C");
      if (qcompany_id == company_key) {
        setState(() {
          attendanceloading = true;
        });
        print("D");
        // gps method call 
        
        print("E");
        var d = calculateDistance(lat1, lon1, lat2, lon2).toPrecision(2);
        print("G");
        setState(() {
          distense = d;
        });

        /// all validetion ckeck for attendance \
        print("H");
        attendanse();
        print("I");
      } else {
        print("J");


        print("K");
        Get.snackbar(
            icon: const Icon(
              Icons.error_sharp,
              size: 35,
            ),
            "No Data Found",
            "Check And Try Again",
            snackPosition: SnackPosition.BOTTOM,

            // backgroundColor: const Color.fromARGB(255, 185, 166, 189),
            backgroundColor: const Color.fromARGB(255, 147, 166, 196),
            dismissDirection: DismissDirection.horizontal,
            // colorText: Colors.white,
            // colorText: Colors.white,
            maxWidth: 400,
            duration: const Duration(seconds: 3));
       Future.delayed(Duration(seconds: 4),() async {
        attendanceloading = false;
           await controller!.resumeCamera();
        setState(() {
        Navigator.pop(context);
        });
            
       });
          

      }
      // attendance();
    } else {
      print("L");

      Get.snackbar(
          icon: const Icon(
            Icons.error_sharp,
            size: 35,
          ),
          "QR Code Not Found",
          "Check And Try Again",
          snackPosition: SnackPosition.BOTTOM,

          // backgroundColor: const Color.fromARGB(255, 185, 166, 189),
          backgroundColor: const Color.fromARGB(255, 147, 166, 196),
          dismissDirection: DismissDirection.horizontal,
          // colorText: Colors.white,
          // colorText: Colors.white,
          maxWidth: 400,
          duration: const Duration(seconds: 3));
      Future.delayed(Duration(seconds: 4),() async {
        attendanceloading = false;
           await controller!.resumeCamera();
        setState(() {
           Navigator.pop(context);
        });
            
       });
    }
  }

  @override
  Widget build(BuildContext context) {
     double mediaH =MediaQuery.of(context).size.height;
     double mediaW =MediaQuery.of(context).size.width;
    return
     MaterialApp(
        debugShowCheckedModeBanner: false,
         theme:ThemeData(
              useMaterial3: true,
                appBarTheme: const AppBarTheme(
       color: Color.fromARGB(255, 255, 246, 255),
      ),
            ),
        home:
         Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color.fromARGB(255, 161, 88, 61),
                // Color.fromARGB(123, 144, 120, 182)
                Color.fromARGB(255, 242, 238, 255),
                Color.fromARGB(255, 236, 216, 240)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              // appbar with title text
              appBar: AppBar(
                title: const Text(
                  'Staff Attendance',
                  
                ),

              ),
              // body with centered text
              body: SafeArea(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                     SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                        child://Text("image")
                         Center(
                           child: Container(
                      height: mediaH*0.08,
                      color: Colors.transparent,
                      child: Obx(() => _schoolsetting.loadingimage.value
                            ? Image.network(
                        _schoolsetting.GetSchoolSettingControllerList[0]["response"]["image"],
                        width: 100,
                        height: 100,
                      )
                            : const CircularProgressIndicator())
                    ),
                         )
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 SizedBox(
                                  width: mediaW*0.02,
                                ),
                                  Obx(() => _schoolsetting.loadingimage.value
                      ? Text(
                    _schoolsetting.GetSchoolSettingControllerList[0]
                    ["response"]["name"],
                    style: GoogleFonts.dmSans(
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  )
                      : const Text("")),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
      
                    Expanded(
                        flex: 6,
                        child: Stack(
                          children: [
                            QRView(
                              key: qrKey,

                              onQRViewCreated: _onQRViewCreated,
                              overlay: QrScannerOverlayShape(
                                borderColor: Colors.red,
                                borderRadius: 10,
                                borderLength: 30,
                                borderWidth: 8,
                                cutOutSize: _currentSliderValue,
                              ),
                              onPermissionSet: (ctrl, p) =>
                                  _onPermissionSet(context, ctrl, p),
                            ),
                            Center(
                              child: Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: attendanceloading,
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 50, bottom: 30),
                                      child: const CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Color.fromARGB(255, 255, 43, 43)),
                                        backgroundColor:
                                            Color.fromARGB(95, 214, 197, 214),
                                      ))),
                            ),
                            Positioned.fill(
                              top: 455,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30, right: 30),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Slider(
                                          value: _currentSliderValue..toDouble(),
                                          min: 300,
                                          max: 450,
                                          divisions: 40,
                                          onChanged: (double value) {
                                            setState(() {
                                              _currentSliderValue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        )),

                    Center(
                      child:  Container(
             color: const Color.fromARGB(255, 196, 236, 255),

        child:Row(
                 
                  children: [
                    Padding(
padding:  EdgeInsets.only(left: 0.09.sw),
child: Image.asset("assets/images/appstore.png",width: 50,height: 50,),
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
                    )
                  ],
                ),
              )),
        ),
      );
  
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData)  {
     
        result = scanData;
        print("qr result");
        print(result?.code);
        
          qrcodevalidetions();
    


    });

    //  if (result != null) {
  }

  void dis() {}

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}

///
///
/// show dialog box
class Showdialogcontact extends StatelessWidget {
  const Showdialogcontact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
          ""),
    );
  }
}

///sedcond dialog
///
///
class ShowdialogAbout extends StatelessWidget {
  const ShowdialogAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 185, 166, 189),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      child: Container(
        color: const Color.fromARGB(255, 227, 217, 230),
        height: 400,
        width: double.infinity,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Center(child: Text("Contact Us"))],
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Okey"))
          ],
        ),
      ),
    );
  }
}

///sedcond dialog
///
///
class Showdialoglogout extends StatelessWidget {
  const Showdialoglogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 185, 166, 189),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      child: Container(
        color: const Color.fromARGB(255, 227, 217, 230),
        height: 400,
        width: double.infinity,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Center(child: Text("Contact Us"))],
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Okey"))
          ],
        ),
      ),
    );
  }
}
