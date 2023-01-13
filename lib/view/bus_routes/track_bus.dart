import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:custom_info_window/custom_info_window.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:custom_map_markers/custom_map_markers.dart';

import 'dart:math';
import 'package:intl/intl.dart';
import 'package:time/time.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:geolocator/geolocator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TrackBusMap extends StatefulWidget {
  const TrackBusMap({super.key});

  @override
  State<TrackBusMap> createState() => _TrackBusMapState();
}

class _TrackBusMapState extends State<TrackBusMap> {

  String googleAPiKey = "AIzaSyDOHImmPOOqguSTLBElZ6gZxY8iPEZgNZ4";
  final Completer<GoogleMapController> _controller = Completer();
  final CustomPopupMenuController _controllerpopupmenu =
  CustomPopupMenuController();
  TextEditingController msg = TextEditingController();
  final Location location = Location();
  final box = Hive.box("SchoolData");
  CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();
  late List<MarkerData> _customMarkers = [];
  PolylinePoints polylinePoints = PolylinePoints();
  final Set<Polyline> _polyline = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  late LatLng curLocation;

  //start point
  String successsave = "";
  late String company_key;
  late String driver_name = "";
  late String route_title = "No Trip";
  late String route_id;
  late String did;
  late String companyid;
  late String pickupstart;
  late String dropstart;
  late String pd_flag = "P";
  late String bus_start_distance = "0.0";
  String activity_name = "";
  late String loginname = "";
  late String logo;
  late String managercontact_no;
  late String dropshow;
  List km = [];
  late double lat1;
  late double lon1;
  late double lat2;
  late double lon2;
  List<dynamic> droute = [];
  List<dynamic> data = [
    {"lat": 22.7172809, "lang": 75.913142, "id": 0},
    {"lat": 22.7170643, "lang": 75.912913, "id": 1},
    {"lat": 22.7190326, "lang": 75.9085018, "id": 2},
  ];
  var latlive;
  var longlive;
  var heading;
  late String Pstart;
  late String Dstart;

  ///flutter potyline points
  List<LatLng> polylinecordinates = [];
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  late double latt;
  late double lngg;
  var lat;
  var lon;
  bool servicestatus = false;
  bool haspermission = false;
  bool attendanceloading = false;
  late LocationData currentLocation;

  @override
  void initState() {
    Timer? timer;
    final box = Hive.box("SchoolData");
    setState(() {
      // loginname = box.get("loginname").toString();
      // logo = box.get("logo").toString();
      // company_key = box.get("company_key") ?? "";
      // driver_name = box.get("driver_name") ?? "";
      // route_title = box.get("route_title") ?? "No Trip";
      // route_id = box.get("route_id") ?? "";
      // dropstart = box.get("dropstart").toString();
      // pickupstart = box.get("pickupstart").toString();
      // managercontact_no = box.get("managercontact_no").toString();
      // Pstart = box.get("Pstart").toString();
      // Dstart = box.get("Dstart").toString();
      print('PPPPPPPPPPPPPPPPPPPPP');
      print(box.get("Pstart").toString());
      // print(dropstart);
      // did = box.get("did") ?? "";
      // lat1 = double.parse(box.get("lat"));
      // lon1 = double.parse(box.get("lang"));

      // bus_start_distance = box.get("bus_start_distance") ?? "0.0".toString();
    });


    _getPolyline(LatLng(19.0759837, 72.8776559),LatLng(28.679079, 77.069710), LatLng(26.850000, 80.949997),LatLng(24.879999, 74.629997),);
    getrouteid();
    addCmarker();
    // getDriverRoute();
    // currentlocation();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("WidgetsBinding");
    });
  }


  getrouteid(){
    setState(() {
      // companyid = Get.arguments[0];
    });
  }
  // getDriverRoute() async {
  //   print("get driver route");
  //   print(pd_flag);
  //   var body = json.encode(
  //       {"company_key": company_key, "id": companyid, "pd_flag": pd_flag});
  //   try {
  //     final urlapi = Uri.parse(
  //         "https://e-gyan.co.in/api/Transportwebservices/getDriverRoute");
  //     var response = await http.post(urlapi, body: body);
  //     if (response.statusCode == 200) {
  //       var driverRoute = jsonDecode(response.body);
  //       print(driverRoute["message"]);
  //       print("DDDDDDDDDDDDDDDDDDDDDD");
  //       print(driverRoute);
  //       if (driverRoute["status"] == true) {
  //         setState(() {
  //           droute = driverRoute["response"][0]["routes"];
  //         });
  //       }
  //

  //       print("FFFFFFFFFFFFFFFFFFFF");
  //       print(droute[0]["lat"]);
  //       print(droute[0]["lang"]);
  //       print(droute[droute.length - 1]["lat"]);
  //       print(droute[droute.length - 1]["lang"]);
  //       print("FFFFFFFFFFFFFFFFFFFF");
  //       _getPolyline(
  //           double.parse(droute[0]["lat"]),
  //           double.parse(droute[0]["lang"]),
  //           double.parse(droute[droute.length - 1]["lat"]),
  //           double.parse(droute[droute.length - 1]["lang"]));
  //       setState(() {
  //         latt = double.parse(droute[droute.length - 1]["lat"]);
  //         lngg = double.parse(droute[droute.length - 1]["lang"]);
  //       });
  //       print("before livelocations");
  //
  //       newcameraposition();
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }


  newcameraposition() async {
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 19.5,
          target: LatLng(
            latlive,
            longlive,
          ),
        ),
      ),
    );
  }
//add custom marker /////////////////
  addCmarker() async {
    try {
      print("create marker");
      for (var i = 0; i <= droute.length - 1; i++) {
        double d = double.parse(droute[i]["lat"]);
        print(droute[i]['student_count']);
        print("A");
        //for polyline
        ////////
        _customMarkers.add(
          MarkerData(
            marker: Marker(
                onTap: () async {

                  List<dynamic> studentstoplist = [];
                  print("A");

                  /// get student at stop
                  print("get student list");
                  print(droute[i]["id"]);
                  var body = json.encode({
                    "company_key": company_key.toString(),
                    "stop_id": droute[i]["id"].toString(),
                    "pd_flag": pd_flag.toString(),
                  });
                  final urlapi = Uri.parse(
                      "https://e-gyan.co.in/api/Transportwebservices/getStudentAtStop");
                  var response = await http.post(urlapi, body: body);
                  if (response.statusCode == 200) {
                    print("A");
                    var studentlist = jsonDecode(response.body);
                    if (studentlist["status"] == true) {
                      studentstoplist = studentlist["response"];
                    }
                  }
                  ////////////////////////////////////////////////////////
                  //custom window marker
                  // _customInfoWindowController.addInfoWindow!(
                  //   Stack(
                  //     children: [
                  //       AnimatedPositioned(
                  //         bottom: 0.0,
                  //         duration: const Duration(milliseconds: 200),
                  //         child: Container(
                  //           padding: const EdgeInsets.only(
                  //               top: 3, left: 3, right: 3, bottom: 3),
                  //           decoration: const BoxDecoration(
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Color.fromARGB(255, 156, 154, 247),
                  //                   blurRadius: 7.0,
                  //                 ),
                  //               ],
                  //               color: Colors.white,
                  //               borderRadius: BorderRadius.only(
                  //                   topRight: Radius.circular(5),
                  //                   topLeft: Radius.circular(5),
                  //                   bottomRight: Radius.circular(10),
                  //                   bottomLeft: Radius.circular(10))),
                  //           // ignore: sort_child_properties_last
                  //           child: ListView.builder(
                  //             itemCount: studentstoplist.length,
                  //             itemBuilder: (BuildContext context, int index) {
                  //               return Card(
                  //                 shadowColor:
                  //                     Color.fromARGB(255, 246, 211, 255),
                  //                 elevation: 15,
                  //                 margin: const EdgeInsets.symmetric(
                  //                     horizontal: 5.0, vertical: 3.0),
                  //                 child: Container(
                  //                   decoration: const BoxDecoration(
                  //                       color:
                  //                           Color.fromARGB(226, 173, 189, 241)),
                  //                   child: ListTile(
                  //                     contentPadding:
                  //                         const EdgeInsets.symmetric(
                  //                             horizontal: 7.0, vertical: 5.0),
                  //                     leading: Container(
                  //                       padding: const EdgeInsets.all(5.0),
                  //                       decoration: const BoxDecoration(
                  //                           border: Border(
                  //                               right: BorderSide(
                  //                                   width: 1.0,
                  //                                   color: Colors.white24))),
                  //                       child: const Icon(
                  //                           Icons.person_outline_sharp,
                  //                           color: Colors.white),
                  //                     ),
                  //                     title: Text(
                  //                       studentstoplist[index]["firstname"],
                  //                       style: const TextStyle(
                  //                           color: Colors.white,
                  //                           fontWeight: FontWeight.bold),
                  //                     ),
                  //                     // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                  //                     trailing: IconButton(
                  //                         onPressed: () async {
                  //                           var phoneNumber =
                  //                               '+91${studentstoplist[index]["mobileno"]}';
                  //                           // final Uri launchUri = Uri(
                  //                           //   scheme: 'tel',
                  //                           //   path: phoneNumber,
                  //                           // );
                  //                           // await launchUrl(launchUri);
                  //                           FlutterPhoneDirectCaller.callNumber(
                  //                               phoneNumber);
                  //                         },
                  //                         color: Colors.white,
                  //                         icon: Icon(Icons.call)),
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //           height: 300,
                  //           width: 300,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   LatLng(double.parse(droute[i]["lat"]),
                  //       double.parse(droute[i]["lang"])),
                  // );
                  //custom window marker
                  _customInfoWindowController.addInfoWindow!(
                    Stack(
                      children: [
                        AnimatedPositioned(
                          bottom: 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 3, left: 3, right: 3, bottom: 3),
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 156, 154, 247),
                                    blurRadius: 7.0,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            // ignore: sort_child_properties_last
                            child: ListView.builder(
                              itemCount: studentstoplist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shadowColor:
                                  Color.fromARGB(255, 246, 211, 255),
                                  elevation: 15,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 3.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color:
                                        Color.fromARGB(226, 173, 189, 241)),
                                    child: ListTile(
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 7.0, vertical: 5.0),
                                      leading: Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    width: 1.0,
                                                    color: Colors.white24))),
                                        child: const Icon(
                                            Icons.person_outline_sharp,
                                            color: Colors.white),
                                      ),
                                      title: Text(
                                        studentstoplist[index]["firstname"],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                                      trailing: IconButton(
                                          onPressed: () async {
                                            var phoneNumber =
                                                '+91${studentstoplist[index]["mobileno"]}';
                                            // final Uri launchUri = Uri(
                                            //   scheme: 'tel',
                                            //   path: phoneNumber,
                                            // );
                                            // await launchUrl(launchUri);
                                            FlutterPhoneDirectCaller.callNumber(
                                                phoneNumber);
                                          },
                                          color: Colors.white,
                                          icon: Icon(Icons.call)),
                                    ),
                                  ),
                                );
                              },
                            ),
                            height: 300,
                            width: 300,
                          ),
                        ),
                      ],
                    ),
                    LatLng(double.parse(droute[i]["lat"]),
                        double.parse(droute[i]["lang"])),
                  );
                  ///////////////
                },
                markerId: MarkerId("$i"),
                position: LatLng(double.parse(droute[i]["lat"]),
                    double.parse(droute[i]["lang"]))),
            child:
            _customMarker(droute[i]['student_count'] ?? "0", Colors.blue),
          ),
        );
      }
    } catch (e) {
      print("EEEEEEEEEEEEEEEEE");
      print(e);
    }
  }


  _livebusmarker() {
    return Center(
      child: Image.asset(
        "assets/images/livebusmarker.png",
        width: 55,
        height: 60,
      ),
    );
  }

  _customMarker(String symbol, Color color) {
    return Stack(
      children: [
        Icon(
          Icons.add_location,
          color: color,
          size: 42,
        ),
        Positioned(
          left: 11.5,
          top: 7,
          child: Container(
            width: 19,
            height: 20,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text(symbol)),
          ),
        )
      ],
    );
  }

  _getPolyline(
      _originLatitude, _originLongitude, _destLatitude, _destLongitude) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(_originLatitude, _originLongitude),
      PointLatLng(_destLatitude, _destLongitude),
      travelMode: TravelMode.driving,
      wayPoints: [],
      optimizeWaypoints: true,
    );

    print(result.errorMessage);
    if (result.points.isNotEmpty) {
      print("enter...............");
      print(result.points);
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(19.0759837, 72.8776559));
      });
    }
    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = PolylineId("1");
    Polyline polyline = Polyline(
        polylineId: id,
        color: const Color.fromARGB(255, 35, 106, 240),
        points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 95, 130, 206),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('dmdm',
                          style: const TextStyle(color: Colors.white)),
                      Container(
                        width: size.width * 0.4,
                        height: size.height * 0.120,
                        child: Image.network('logo'),
                      ),
                    ]),
              ),
              ListTile(
                title: const Text('Call to Manager'),
                leading: Icon(Icons.call_to_action),
                trailing: InkWell(
                  child: Icon(Icons.call),
                  onTap: () async {
                    var phoneNumber = '+91${4566787888}';

                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: phoneNumber,
                    );
                    await launchUrl(launchUri);
                  },
                ),
                onTap: () async {
                  var phoneNumber = '+91${45566}';

                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: phoneNumber,
                  );
                  await launchUrl(launchUri);
                },
              ),
              ListTile(
                title: const Text('massege to Manager'),
                leading: const Icon(Icons.manage_accounts),
                trailing: InkWell(
                  child: const Icon(Icons.message),
                  onTap: () {

                  },
                ),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('messege to Manager'),
                        content: TextField(
                          cursorColor: Colors.redAccent,
                          controller: msg,
                          decoration:
                          const InputDecoration(labelText: 'Enter Message'),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // <-- SEE HERE
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Disable'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: Text('Send'),
                            onPressed: () async {
                              var body = json.encode({
                                // "company_key": company_key.toString(),
                                // "route_id": route_id.toString(),
                                // "stop_id": stop_id.toString(),
                                // "msg_flag": "T",
                                // "msg": msg.text.toString()
                              });
                              final urlapi = Uri.parse(
                                  "https://e-gyan.co.in/api/Transportwebservices/sendMessagebyDriver");
                              var response =
                              await http.post(urlapi, body: body);
                              print(response);
                              if (response.statusCode == 200) {
                                var saveroute = jsonDecode(response.body);
                                print(saveroute["error"]);
                                print(saveroute["message"]);
                                if (saveroute["status"] == true) {
                                  Fluttertoast.showToast(
                                      msg: "Send Message successfully",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: const Color.fromARGB(
                                          255, 141, 158, 253),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Error",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: const Color.fromARGB(
                                          255, 141, 158, 253),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              }
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text('messege to parents'),
                leading: Icon(Icons.manage_accounts),
                trailing: InkWell(
                  child: Icon(Icons.message),
                  onTap: () {
                    // var body = json.encode({
                    //   "company_key": company_key.toString(),
                    //   "route_id": route_id.toString(),
                    //   "stop_id": stop_id,
                    //   "msg_flag": "P",
                    //   "msg": msg.text
                    // });
                    // final urlapi = Uri.parse(
                    //     "https://e-gyan.co.in/api/Transportwebservices/sendMessagebyDriver");
                    // var response = await http.post(urlapi, body: body);
                    // print(response);
                    // if (response.statusCode == 200) {
                    //   var saveroute = jsonDecode(response.body);
                    //   print(saveroute["error"]);
                    //   print(saveroute["message"]);
                    //   if (saveroute["status"] == true) {
                    //     ScaffoldMessenger.of(context)
                    //         .showSnackBar(const SnackBar(
                    //       content: Text("Send Message successfully"),
                    //     ));
                    //   }
                    // }
                  },
                ),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('massege to parent'),
                        content: TextField(
                          cursorColor: Colors.redAccent,
                          controller: msg,
                          decoration:
                          const InputDecoration(labelText: 'Enter Message'),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          // <-- SEE HERE
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Disable'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: Text('Send'),
                            onPressed: () async {
                              var body = json.encode({
                                // "company_key": company_key.toString(),
                                // "route_id": route_id.toString(),
                                // "stop_id": stop_id.toString(),
                                // "msg_flag": "P",
                                // "msg": msg.text.toString()
                              });
                              final urlapi = Uri.parse(
                                  "https://e-gyan.co.in/api/Transportwebservices/sendMessagebyDriver");
                              var response =
                              await http.post(urlapi, body: body);
                              print(response);
                              if (response.statusCode == 200) {
                                var saveroute = jsonDecode(response.body);
                                print(saveroute["error"]);
                                print(saveroute["message"]);
                                if (saveroute["status"] == true) {
                                  Fluttertoast.showToast(
                                      msg: "Send Message successfully",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: const Color.fromARGB(
                                          255, 141, 158, 253),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Error",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: const Color.fromARGB(
                                          255, 141, 158, 253),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Server not responce",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: const Color.fromARGB(
                                        255, 141, 158, 253),
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 141, 158, 253),
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          title: const Text("Google Map"),
          leading: Builder(
              builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset('assets/images/menuw.png'),
                  ))),
          actions: <Widget>[
            CustomPopupMenu(
              // ignore: sort_child_properties_last
              child: Container(
                padding: const EdgeInsets.all(13),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset('assets/images/ppmenu.png'),
                ),
              ),
              menuBuilder: () => ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 120,
                  color: Color.fromARGB(255, 95, 130, 206),
                  child: IntrinsicWidth(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            // onTap: () async {
                            //   try {
                            //     final box = Hive.box("SchoolData");
                            //     await box.delete("driver_contact");
                            //     // Get.off(Login());
                            //   } catch (e) {
                            //     print("log out");
                            //   }
                            // },
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.logout,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      padding:
                                      EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        "logout",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () async {},
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.info,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      padding:
                                      EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        "about",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              pressType: PressType.singleClick,
              verticalMargin: -10,
              controller: _controllerpopupmenu,
            ),
          ],
        ),
        body: CustomGoogleMapMarkerBuilder(
            customMarkers: _customMarkers,
            builder: (BuildContext context, Set<Marker>? cmarkers) {
              return Stack(children: [
                GoogleMap(
                  trafficEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(22.7172809, 75.913142),
                    zoom: 15.0,
                    bearing: 30.0,
                  ),
                  mapType: MapType.normal,

                  onMapCreated: (GoogleMapController controller) {
                    _customInfoWindowController.googleMapController =
                        controller;
                  },
                  compassEnabled: true,
                  myLocationEnabled: true,
                  markers: Set<Marker>.of(cmarkers ?? []), //?? []
                  onTap: (Position) {
                    _customInfoWindowController.hideInfoWindow!();
                  },
                  polylines: Set<Polyline>.of(polylines.values),
                ),
                CustomInfoWindow(
                  controller: _customInfoWindowController,
                  height: 350,
                  width: 350,
                  offset: 50,
                ),
              ]);
            })
    );
  }
}