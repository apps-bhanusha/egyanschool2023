

import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getexamsResult_controller.dart';
import 'package:ecom_desgin/controller/getexamsSchedule1_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_list_controller.dart';
import 'package:ecom_desgin/model/Teacher_model/exam_result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


class ExamResultStudent extends StatefulWidget {
  final String title;
  final String exam_id;
  const ExamResultStudent({super.key,required this.title,required this.exam_id});



  @override
  State<ExamResultStudent> createState() => _ExamResultStudentState();
}

class _ExamResultStudentState extends State<ExamResultStudent> {

  GetexamsSchedule1Controller getexamview1 =
  Get.put(GetexamsSchedule1Controller());
  // GetexamsResultController GetexamsResult = Get.put(GetexamsResultController());
  StudentListController studentListController=Get.put(StudentListController());
  // int autohight=0;
  var company_key;
  var selectdata;
  bool datafull=false;
  @override
  void initState() {
    studentListController.StudentListapi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Result",style: MyGoogeFont.mydmSans,)),
      
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 1.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              // expandFlag
                              //     ? Icons.keyboard_arrow_up
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          // var box = Hive.box("schoolData");
                          // company_key = box.get("company_key");
                          // student_id = box.get("student_id");
                          // GetexamsResult.GetexamsResultapi(
                          //     company_key, student_id, widget.id);

                          // setState(() {
                          //   print("fddffds");
                          //
                          //   expandFlag = !expandFlag;
                          //   autovalue = 60.0 *
                          //       double.parse(GetexamsResult
                          //           .loadingGetexamsResult.value
                          //           ? GetexamsResult
                          //           .GetexamsResultControllerList[0]
                          //       ["response"]["examResult"]
                          //           .length
                          //           .toString()
                          //           : "0.0");
                          // });
                        })


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0 ,left:13).r,
              child: RichText(
                text: const TextSpan(
                  text: 'Student Id',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                 
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
              child: Container(
                height: 0.060.sh,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Obx(()=>studentListController.loadingStudentList.value?
                   DropdownButton(

                    isExpanded: true,
                    isDense: true,
                    iconSize: 35,
                    // alignment: Alignment.center,
                    value: selectdata,


                    items: studentListController
                        .studentList !=
                        null
                        ?studentListController.studentList.map((country){
                      return DropdownMenuItem(
                        child:Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text(country),
                        ),
                        value: country,
                      );
                    }).toList():[],
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("selectdata"),
                    ),
                    onChanged: (country){
                      // print("You selected: $country");
                      selectdata=country!;
                      studentListController.GetexamsResultapi(selectdata,widget.exam_id);
                      studentListController.loadingStudentList1.value=false;
                      studentListController.examResultModel.value=[] as ExamResultModel?;

                      setState(() {

                      });
                    },


                  ):Center(child: Container(width:0.05.sw,height:0.026.sh,child: CircularProgressIndicator(color: Colors.green,))),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: ExpandableContainer(
                    autohight: 400,

                    child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.3, color: Colors.grey),
                                color: const Color.fromARGB(
                                    255, 250, 254, 255)),
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Subject"),
                                  Text("Passing Marks"),
                                  Text("Marks Obtained"),
                                  Text("Result"),
                                ]),
                          ),
                         Expanded(
                              child:Obx(()=>
                               studentListController.loadingStudentList1.value?   ListView.builder(
                                  itemBuilder:
                                      (BuildContext context,
                                      int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.3,
                                              color: Colors.grey),
                                          color: const Color
                                              .fromARGB(255,
                                              250, 254, 255)),
                                      child: ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Text(
                                        '${studentListController.examResultModel.value?.response.examResult[index].minMarks}',
                                              style: const TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  color: Color
                                                      .fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0)),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              '${studentListController.examResultModel.value?.response.examResult[index].getMarks}/${studentListController.examResultModel.value?.response.examResult[index].maxMarks}',
                                              style: const TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  color: Color
                                                      .fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0)),
                                            ),
                                          ],
                                        ),
                                        leading: Text(
                                            '${studentListController.examResultModel.value?.response.examResult[index].subjectName}',

                                        ),
                                        trailing: Text(
                                          '${studentListController.examResultModel.value?.response.examResult[index].result}',
                                        ),

                                      ));
                                  },
                                  itemCount: studentListController.examResultModel.value?.response.examResult
                                      .length,
                                ):Center(child:Text("Data is not Found") )
                              )
                         )



                        ],
                      )


                    ))
          ],
        ),
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