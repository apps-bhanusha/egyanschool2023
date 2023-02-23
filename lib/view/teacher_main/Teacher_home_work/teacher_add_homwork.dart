import 'package:ecom_desgin/Widgets/DropDown_widget.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/teacher_controller/class_list_controller.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TeacherAddHomeWork extends StatefulWidget {
  const TeacherAddHomeWork({Key? key}) : super(key: key);

  @override
  State<TeacherAddHomeWork> createState() => _TeacherAddHomeWorkState();
}

class _TeacherAddHomeWorkState extends State<TeacherAddHomeWork> {
  ClassCLSController classListController = Get.put(ClassCLSController());
  String dropdownValue = 'Dog';
  bool valuefirst = false;
  bool valuesecond = false;
  var selectdata="Select Class";
  var selectdata1="Select Section";
  var dropdata="Select Subject";
  var dropdata1;
  var userfile;
  var homework_date;
  var submit_date;
  var fileData;
  bool fileSelected = false;
  var countries = ["india", "pakistan", "hindustan", "afiganistan"];
  var countries1 = ["india", "pakistan", "hindustan", "afiganistan"];

  final String _selectdrop = "Select";

  bool value = false;
  bool value1 = false;
  bool value2 = false;
  var homeworkController = TextEditingController();
  var submitController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  void initState() {
    classListController.classListapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Add Home Work",style: MyGoogeFont.mydmSans,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.015.sh,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0).r,
                child: Container(
                    width: 0.99.sw,
                    height: 0.85.sh,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 5, color: Colors.grey)
                        ]),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 0.010.sh,
                                width: 0.99.sw,
                                color: Colors.blue),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 18).r,
                              child: RichText(
                                text:  TextSpan(
                                  text: 'Class',
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
                                  ],
                                ),
                              ),
                            ),
                                Padding(
                                padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
                                child: Obx(
                                  () =>  DropDownWidget(droph: 0.060.sh, selectText: selectdata, item:classListController.classList, isloading: classListController.isloding.value, empaty: "", onChange: (value) {
                                  // print("You selected: $country");
                                      selectdata=value!;
                                      setState(() {
                                                              classListController.classSectionapi(value);
                                      });
                                                          }, xpand: true,),
                                ),
                              ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(left: 18.0, right: 18.0)
                            //           .r,
                            //   child: Container(
                            //             height: 0.060.sh,
                            //             decoration: BoxDecoration(
                            //               shape: BoxShape.rectangle,
                            //               border: Border.all(
                            //                 color: Colors.grey,
                            //                 width: 1.0,
                            //               ),
                            //             ),
                            //             child: Obx(
                            //     () => classListController.isloding.value
                            //         ? DropdownButton(
                            //               isExpanded: true,
                            //               isDense: true,
                            //               iconSize: 35,
                            //               // alignment: Alignment.center,
                            //               value: selectdata,

                            //               items: classListController
                            //                           .classList !=
                            //                       null
                            //                   ? classListController.classList
                            //                       .map((country) {
                            //                       return DropdownMenuItem(
                            //                         value: country,
                            //                         child: Padding(
                            //                           padding:
                            //                               EdgeInsets.all(8.0),
                            //                           child: Text(country),
                            //                         ),
                            //                       );
                            //                     }).toList()
                            //                   : [],
                            //               hint: const Padding(
                            //                 padding: EdgeInsets.all(8.0),
                            //                 child: Text("Select Class"),
                            //               ),
                            //               onChanged: (country) {
                            //                 // print("You selected: $country");
                            //                 selectdata = country!;
                            //                 classListController
                            //                     .classSectionapi(selectdata);
                            //                 setState(() {});
                            //               },
                            //             )      : Center(
                            //             child: SizedBox(width: 0.05.sw,
                            //                 height: 0.025.sh,child: const CircularProgressIndicator(color: Colors.blue,strokeWidth: 2))),)
                              
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 18).r,
                              child: RichText(
                                text:  TextSpan(
                                  text: 'Section',
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
                                  ],
                                ),
                              ),
                            ),
                                     Padding(
                                padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
                                child: Obx(
                                  () =>   DropDownWidget(droph: 0.060.sh, selectText: selectdata1, item: value2==false?classListController.classSection:[], isloading: classListController.isloding2.value, empaty: "", onChange: (value) {
                                       // print("You selected: $country");
                                                selectdata1 = value;
                                                classListController
                                                    .classSubjectapi(selectdata1);
                                                setState(() {});
                                                          }, xpand: true,),
                                ),
                              ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(left: 18.0, right: 18.0)
                            //           .r,
                            //   child: SizedBox(
                            //     height: 0.060.sh,
                            //     child: Container(

                            //               decoration: BoxDecoration(
                            //                 shape: BoxShape.rectangle,
                            //                 border: Border.all(
                            //                   color: Colors.grey,
                            //                   width: 1.0,
                            //                 ),
                            //               ),
                            //               child: Obx(
                            //                       () => classListController.isloding2.value?DropdownButton(
                            //                 isExpanded: true,
                            //                 isDense: true,
                            //                 iconSize: 35,
                            //                 // alignment: Alignment.center,
                            //                 value: selectdata1,

                            //                 items: classListController
                            //                             .classSection !=
                            //                         null
                            //                     ? classListController.classSection
                            //                         .map((country) {
                            //                         return DropdownMenuItem(
                            //                           child: Padding(
                            //                             padding:
                            //                                 const EdgeInsets.all(
                            //                                     8.0),
                            //                             child: Text(country),
                            //                           ),
                            //                           value: country,
                            //                         );
                            //                       }).toList()
                            //                     : [],
                            //                 hint: Padding(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   child: Text("Select Section"),
                            //                 ),
                            //                 onChanged: (country) {
                            //                   // print("You selected: $country");
                            //                   selectdata1 = country!;
                            //                   classListController
                            //                       .classSubjectapi(selectdata1);
                            //                   setState(() {});
                            //                 },
                            //               ): Center(
                            //                           child: Container(width: 0.05.sw,
                            //                               height: 0.025.sh,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2))),
                            //               )),
                            //   )

                            //   ),

                            Form(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 18)
                                          .r,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Subject Group',
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ),
                                             Padding(
                                padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
                                child: Obx(
                                  () =>   DropDownWidget(droph: 0.060.sh, selectText: dropdata, item: classListController.classSubject, isloading: classListController.isloding3.value, empaty: "", onChange: (value) {
                              
                                                dropdata = value;

                                                setState(() {});
                                                          }, xpand: true,),
                                ),
                              ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //           left: 18.0, right: 18.0)
                                //       .r,
                                //   child:Container(
                                //             height: 0.060.sh,
                                //             decoration: BoxDecoration(
                                //               shape: BoxShape.rectangle,
                                //               border: Border.all(
                                //                 color: Colors.grey,
                                //                 width: 1.0,
                                //               ),
                                //             ),
                                //             child:  Obx(
                                //     () => classListController.isloding3.value
                                //         ? DropdownButton(
                                //               isExpanded: true,
                                //               isDense: true,
                                //               iconSize: 35,
                                //               // alignment: Alignment.center,
                                //               value: dropdata,

                                //               items: classListController
                                //                           .classSubject !=
                                //                       null
                                //                   ? classListController
                                //                       .classSubject
                                //                       .map((country) {
                                //                       return DropdownMenuItem(
                                //                         value: country,
                                //                         child: Padding(
                                //                           padding:
                                //                               const EdgeInsets
                                //                                   .all(8.0),
                                //                           child: Text(country),
                                //                         ),
                                //                       );
                                //                     }).toList()
                                //                   : [],
                                //               hint: const Padding(
                                //                 padding: EdgeInsets.all(8.0),
                                //                 child: Text("Select Subject"),
                                //               ),
                                //               onChanged: (country) {
                                //                 // print("You selected: $country");
                                //                 dropdata = country!;

                                //                 setState(() {});
                                //               },
                                //             ): Center(
                                //         child: Container(width: 0.05.sw,
                                //             height: 0.025.sh,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,))),
                                //           )
                                        
                                //   ),
                                // ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 18)
                                          .r,
                                  child: RichText(
                                    text:  TextSpan(
                                      text: 'HomeWork Date',
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                          left: 18.0, right: 18.0)
                                      .r,
                                  child: Container(
                                    height: 0.060.sh,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0).r,
                                      child: TextFormField(
                                        controller: homeworkController,
                                        decoration: const InputDecoration(
                                          // hintText: "2023-01-23",hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2023),
                                                  lastDate: DateTime(2025));
                                          if (pickedDate != null) {
                                            print(
                                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            homework_date =
                                                MyDateFormat.dateformatmethod(
                                                    formattedDate);
                                            homeworkController.text =
                                                MyDateFormat.dateformatmethod1(
                                                    formattedDate);
                                            print(
                                                formattedDate); //formatted date output using intl package =>  2021-03-16
                                            //you can implement different kind of Date Format here according to your requirement

                                            setState(() {});
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                        onFieldSubmitted: (value) {
                                          //Validator
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter The Text!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 18)
                                          .r,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Submission Date',
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                          left: 18.0, right: 18.0)
                                      .r,
                                  child: Container(
                                    height: 0.060.sh,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0).r,
                                      child: TextFormField(
                                        controller: submitController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        onFieldSubmitted: (value) {
                                          //Validator
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter The Text!';
                                          }
                                          return null;
                                        },
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2023),
                                                  lastDate: DateTime(2025));
                                          if (pickedDate != null) {
                                            print(
                                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            print(
                                                formattedDate); //formatted date output using intl package =>  2021-03-16
                                            //you can implement different kind of Date Format here according to your requirement
                                            submit_date =
                                                MyDateFormat.dateformatmethod(
                                                    formattedDate);
                                            setState(() {
                                              submitController.text =
                                                  MyDateFormat.dateformatmethod1(
                                                      formattedDate); //set output date to TextField value.
                                            });
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 18)
                                          .r,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Attachment',
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 1.0,
                                  ).r,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles();

                                          if (result != null) {
                                            PlatformFile file =
                                                result.files.first;

                                            print(file.name);
                                            print(file.bytes);
                                            print(file.size);
                                            print(file.extension);
                                            print(file.path);
                                            fileData = file.name.toString();
                                            userfile = file.path;
                                            setState(() {
                                              fileSelected=true;
                                            });
                                          } else {
                                            print('No file selected');
                                          }
                                        },
                                        child: Container(
                                          height: 0.060.sh,
                                          width: 0.87.sw,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(8.0).r,
                                            child:
                                                Text("Click Here To Pic File"),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: Row(
                                          children: [
                                            Text("file :- "),
                                            Text(fileData ??
                                                ""),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 1.0, left: 18)
                                          .r,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Description',
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                          left: 18.0, right: 18.0)
                                      .r,
                                  child: Container(
                                    height: 0.14.sh,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0).r,
                                      child: TextFormField(
                                        controller: descriptionController,
                                        maxLines: 40,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        onFieldSubmitted: (value) {
                                          //Validator
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter The Text!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                fileSelected?Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                            top: 10.0, left: 18)
                                        .r,
                                    child: Container(
                                      width: 0.20.sw,
                                      height: 0.055.sh,
                                        color: Colors.blue,


                                      child: TextButton(
                                        onPressed: () {
                                         classListController.buttonclick.value = true;
                                        
                                            if(fileSelected==true) {
                                              classListController
                                                  .HomeworkAddListapi(
                                                  homework_date,
                                                  submit_date,
                                                  descriptionController.text,
                                                  userfile,
                                                  dropdata,context);
                                            }
                                          
                                        },
                                        child:Obx(() =>  classListController.buttonclick.value?Center(
                                            child: SizedBox(width: 0.05.sw,
                                                height: 0.025.sh,child: const CircularProgressIndicator(color: Colors.white,strokeWidth: 2,))):Text(
                                          "SAVE",
                                          style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),),
                                      )
                                    ),
                                  ),
                                ):Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 18)
                                        .r,
                                    child: Container(
                                      width: 0.20.sw,
                                      height: 0.055.sh,
                                      color: Colors.grey,
                                      child: TextButton(
                                        onPressed: () {

                                        },
                                        child: Text(
                                          "SAVE".toUpperCase(),
                                          style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                          ]),
                    )),
              ),
            ],
          ),
        ));
  }
}


