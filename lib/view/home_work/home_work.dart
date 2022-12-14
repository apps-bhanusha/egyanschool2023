import 'package:ecom_desgin/controller/school_id_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeWork extends StatefulWidget {
  const HomeWork({super.key});

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
 final SchoolIdController schoolIdController =Get.put(SchoolIdController());
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:  Obx(() => Text(schoolIdController.SchoolIdControllerList.length.toString()),)),
        body: Column(
          children: [
            // for(int i=0;i<=schoolIdController.SchoolIdControllerList.length-1;i++)
            Center(
              child: Card(
                elevation: 10,
                child: Container(
                  width: 0.95.sw,
                  height: 0.13.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                    const Text(
                       "Hindi",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                      ),
                      const Divider(),
                    
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 0.01.sw, right: 0.01.sw, bottom: 0.01.sh),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text("Start Date",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 15)),
                                    Text("20/11/2022",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 15)),
                                   
                                  ],
                                ),
                              ),
                      Container(
                        color: Color.fromARGB(255, 221, 0, 0),
                        height: 47,width: 1,),
                         Padding(
                           padding: EdgeInsets.only(
                               left: 0.01.sw, right: 0.01.sw, bottom: 0.01.sh),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: const [
                              
                               Text("Submit Date",
                                   style: TextStyle(
                                       color: Color.fromARGB(255, 0, 0, 0),
                                       fontSize: 15)),
                               Text("20/11/2022",
                                   style: TextStyle(
                                       color: Color.fromARGB(255, 0, 0, 0),
                                       fontSize: 15))
                             ],
                           ),
                         ),
                         Container(
                        color: Color.fromARGB(255, 199, 0, 0),
                        height: 47,width: 1,),
                            Padding(
                           padding: EdgeInsets.only(
                               left: 0.01.sw, right: 0.01.sw, bottom: 0.01.sh),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                           Row(
                            
                            children: [
                                 
                             Column(
                              children: const[
                                  Text("Upload",
                                   style: TextStyle(
                                       color: Color.fromARGB(255, 0, 0, 0),
                                       fontSize: 15)),
                                     Icon(Icons.upload)
                              ],
                              
                             ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3,right: 3),
                                child: Container(
                        color: Color.fromARGB(255, 204, 0, 0),
                        height: 40,width: 1,),
                              ),
                                 Column(
                              children: const[
                                  Text("Download",
                                   style: TextStyle(
                                       color: Color.fromARGB(255, 0, 0, 0),
                                       fontSize: 15)),
                                      Icon(Icons.download)
                              ],
                             )
                              
                            ],
                           )
                             ],
                           ),
                         )
                        ],
                      )
                   
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 20;
    Offset controlPoint = Offset(size.width / 10, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CurveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 5;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
