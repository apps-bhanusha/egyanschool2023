import 'dart:async';

import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getexamsResult_controller.dart';
import 'package:ecom_desgin/controller/getexamsSchedule1_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ExamResult extends StatefulWidget {
  const ExamResult({super.key});

  @override
  State<ExamResult> createState() => _ExamResultState();
}

class _ExamResultState extends State<ExamResult> {
  GetexamsSchedule1Controller getexamview1=Get.put(GetexamsSchedule1Controller());
  GetexamsResultController GetexamsResult=Get.put(GetexamsResultController());
 var id;
 var company_key;

 var box = Hive.box("schoolData");
// int autohight=0;

@override
  void initState() {
  id = box.get("student_id");

  company_key = box.get("company_key");

  getexamview1.GetexamsSchedule1api( company_key, 0);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(

      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 211, 245, 255),
        appBar: AppBar(
          backgroundColor:AgentColor.appbarbackgroundColor,
          title: Text('Result',style: MyGoogeFont.mydmSans),
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) {
                return <PopupMenuEntry<int>>[
                  const PopupMenuItem(child: Text('0'), value: 0),
                  const PopupMenuItem(child: Text('1'), value: 1),
                ];
              },
            ),
          ],
        ),
        body:Obx(()=> getexamview1.loadingGetexamsSchedule1.value ?ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ExpandableListView(title: '${getexamview1.loadingGetexamsSchedule1.value?getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][index]["exam_group_name"]:""}${getexamview1.loadingGetexamsSchedule1.value?getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][index]["exam"]:""}',id:getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][index]["exam_group_id"],value:GetexamsResult.loadingGetexamsResult.value=false);
            },
            itemCount:getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"].length,
          ):Center(child: CircularProgressIndicator()),
        ),
      ),
      onRefresh: () async {
        AlwaysScrollableScrollPhysics();
        setState(() {
          getexamview1.GetexamsSchedule1api(company_key, 0);

        });


        await Future.value({

          Duration(seconds: 3),

        });
      },
    );
  }
}

class ExpandableListView extends StatefulWidget {
  final String title;
  final String id;
  final bool value;
  const ExpandableListView({Key? key, required this.title,required this.id,required this.value}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExpandableListViewState createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {

  double autovalue=0;
  bool expandFlag = false;
  GetexamsResultController GetexamsResult=Get.put(GetexamsResultController());
  GetexamsSchedule1Controller getexamview1=Get.put(GetexamsSchedule1Controller());
  var company_key;
  var student_id;
  List result = [
    {
      "subjectname": "hindi",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "english",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "math",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "physics",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "physics",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    },
    {
      "subjectname": "physics",
      "passingmarks": "33",
      "Marks Obtained": "6.00/23",
      "Result": "pass",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 1.0,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  IconButton(
                      icon: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            expandFlag
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        var box = Hive.box("schoolData");
                        company_key = box.get("company_key");
                        student_id = box.get("student_id");
                        GetexamsResult.GetexamsResultapi(company_key,student_id,widget.id);

                        setState(()  {

                          expandFlag = !expandFlag;
                          autovalue=62.0*double.parse(GetexamsResult.loadingGetexamsResult.value ?GetexamsResult.GetexamsResultControllerList[0]["response"]["examResult"].length.toString():"0.0");
print("dffdfd");
                          print(expandFlag);
                          print(autovalue);
                        });



                      }),
                ],
              ),
            ),
          ),


           Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                child: ExpandableContainer(
                 autohight: autovalue,
                    expanded: expandFlag,
                    child:  Obx(()=> GetexamsResult.loadingGetexamsResult.value==true?Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.3, color: Colors.grey),
                                color: const Color.fromARGB(255, 250, 254, 255)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Subject"),
                                  Text("Passing Marks"),
                                  Text("Marks Obtained"),
                                  Text("Result"),
                                ]),
                          ),

                              Expanded(

                                child:

                                     ListView.builder(
                                      itemBuilder: (BuildContext context, int index) {

                                        return Container(
                                            decoration: BoxDecoration(
                                                border:
                                                    Border.all(width: 0.3, color: Colors.grey),
                                                color: const Color.fromARGB(255, 250, 254, 255)),
                                            child: ListTile(
                                              title: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [

                                                  Text(
                                              GetexamsResult.GetexamsResultControllerList[0]["response"]["examResult"][index]["min_marks"].toString(),
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Color.fromARGB(255, 0, 0, 0)),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    '${GetexamsResult.GetexamsResultControllerList[0]["response"]["examResult"][index]["get_marks"].toString()}/${GetexamsResult.GetexamsResultControllerList[0]["response"]["examResult"][index]["max_marks"].toString()}',
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Color.fromARGB(255, 0, 0, 0)),
                                                  ),
                                                ],
                                              ),
                                              leading: Text(GetexamsResult.GetexamsResultControllerList[0]["response"]["examResult"][index]["subject_name"].toString(),),
                                              trailing: Text(GetexamsResult.GetexamsResultControllerList[0]["response"]["examResult"][index]["result"].toString(),),
                                            ),

                                        );
                                      },
                                      itemCount:GetexamsResult.GetexamsResultControllerList[0]["response"]["examResult"].length,
                                  ),
                                   ),




                        ],
                    ):Center(child: CircularProgressIndicator()),

                    )
              ),

          )
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;
  final double autohight;
  
  const ExpandableContainer({
    super.key,
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 200,
    this.expanded = true,
   required this.autohight,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? autohight : collapsedHeight,
      child: Container(
        child: child,
        // decoration:  BoxDecoration(border:  Border.all(width: 1.0, color: Color.fromARGB(255, 119, 127, 134))),
      ),
    );
  }
}
