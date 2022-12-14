import 'package:ecom_desgin/controller/school_id_controller.dart';
import 'package:ecom_desgin/main.dart';
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
  final SchoolIdController schoolIdController = Get.put(SchoolIdController());
  String _selectdrop = "select";
  List<String> dropdata = ["hindi", "math"];
  bool uploadDone = false;

  @override
  void initState() {
    super.initState();
  }

  ////
  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 0.61.sh,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SizedBox.expand(
                child: Material(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                
                  Container(
                    width: double.infinity,
                    height: 0.02.sh,
                    color: Colors.blue,
                  ),
                  const Text("Home Work Upload",style: TextStyle(fontSize: 20),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                     
                       
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'Home Work List',
                              style: TextStyle(color: Colors.black,),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '*',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                              
                              ],
                            ),
                          ),
                        DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(_selectdrop,
                              style: const TextStyle(color: Colors.blueAccent)),
                          items: dropdata.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.blueAccent),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            print(newValue);
                            setState(() {
                              _selectdrop = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'Content Title',
                              style: TextStyle(color: Colors.black,),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '*',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                              
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      )),
                       Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'Description',
                              style:TextStyle(color: Colors.black,),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '*',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                              
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                            ),
                            child: const TextField(
                              maxLength: 4,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      )),
                        Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'File',
                             style:TextStyle(color: Colors.black,),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '*',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                              
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                    width: 0.2.sw,
                    height: 0.05.sh,
                    
                    color: Colors.green,
                    child: const Text("Upload",style: TextStyle(color: Colors.white),),
                  ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Work"),
        ),
        body: Column(
          children: [
            for(int i=0;i<=3;i++)
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
                      Container(
                        width: double.infinity,
                        color: Colors.blueAccent,
                        height: 0.05.sh,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Hindi",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () => showCustomDialog(context),
                                child: SizedBox(
                                  child: Row(
                                    children: const [
                                      Text("Upload",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 15)),
                                      Icon(Icons.upload),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, right: 3),
                                child: Container(
                                  color: Color.fromARGB(255, 204, 0, 0),
                                  height: 40,
                                  width: 1,
                                ),
                              ),
                              const Text("Download",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 15)),
                              Icon(Icons.download)
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text("Start Date:-",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 15)),
                                  Text("20/11/2022",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 15)),
                                ],
                              ),
                       
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("Submit Date:-",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15)),
                              Text("20/11/2022",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15))
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("Evulationdate:-",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15)),
                              Text("20/11/2022",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15))
                            ],
                          ),
                          ],
                        ),
                         
                          Container(
                            color: Color.fromARGB(255, 199, 0, 0),
                            height: 47,
                            width: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0.01.sw, right: 0.01.sw, bottom: 0.01.sh),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    uploadDone == true&&i==3
                                        ? InkWell(
                                            onTap: () => setState(() {
                                              uploadDone = false;
                                            }),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(7.4).r,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 0.2.sw,
                                                height: 0.05.sh,
                                                color: Colors.green,
                                                child: const Text(
                                                  "Complate",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.all(7.4).r,
                                            child: InkWell(
                                              onTap: () => setState(() {
                                                uploadDone = true;
                                              }),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 0.23.sw,
                                                height: 0.05.sh,
                                                color: Colors.red,
                                                child: const Text("Incomplate",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
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
