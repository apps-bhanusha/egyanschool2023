import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/home_word_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_homework_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class EvaluatehomeWork extends StatefulWidget {
  const EvaluatehomeWork({Key? key}) : super(key: key);

  @override
  State<EvaluatehomeWork> createState() => _EvaluatehomeWorkState();
}

class _EvaluatehomeWorkState extends State<EvaluatehomeWork> {
  var datatest;
  bool clickdata=false;
  List multipleSelected = [];

  bool buttonclick=false;
  var data4;
  RxList<String> student = <String>[].obs;
  void chekbox(){
    teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response.forEach((element) {
      student.add(element.studentName.toString());
    });
  }
  bool data = false;
  TeacherHomeWorkController teacherHomeWorkController =
  Get.put(TeacherHomeWorkController());
  String dropdownValue = 'Dog';
  var id;
  bool valuefirst = false;
  bool valuesecond = false;


  var radiobutton;
  var studentId;
  var selectedIndexes = [];
  var evaluationDate = "";
  var selectdata = "india";
  var selectdata1 = "india";
  var countries = ["india", "pakistan", "hindustan", "afiganistan"];
  var countries1 = ["india", "pakistan", "hindustan", "afiganistan"];

  String _selectdrop = "Select";
  List<String> dropdata = ["india", "pakistan", "hindustan", "afiganistan"];

  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  final HomeWorkController _homeWorkController = Get.put(HomeWorkController());

  var contenttileController = TextEditingController();
  var noteController = TextEditingController();
  bool noteValidate = false;

  var show;
  var showall;
  var title;
  var company_key;
  var content_title;
  bool fileselected = false;
  var homework_date;
  var submit_date;
  var note;
  var homework_id;
  var userfile;
  late var context;

  var file;
  var fileData;
  // FormData formData = new FormData.from({
  //   "name": "wendux",
  //   "file1": new UploadFileInfo(new File("./upload.jpg"), "upload1.jpg")
  // });
List<String> checkBoxList=[];
List <int>indexListAll=[];
  bool uploadDone = false;

  double progress = 0;

  bool didDownloadPDF = false;
  bool isdownloadin = true;
  int index = 0;
  var box = Hive.box("schoolData");

  String progressString = 'Now';
  late Directory _downloadsDirectory;

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  var homeworkevaluteController = TextEditingController();

  bool value = false;
  bool value1 = false;
  bool value2 = false;
  @override
  void initState() {
    teacherHomeWorkController.homeworkevaluationapi();
    super.initState();
  }

   List  availableHobbies = [];

  Future<void> initDownloadsDirectoryState() async {
    Directory? downloadsDirectory;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    } on PlatformException {
      print('Could not get the downloads directory');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _downloadsDirectory = downloadsDirectory!;
  }

  Future download(Dio dio, String Path, String savePath) async {
    try {
      var response = await dio.get(
        Path,
        onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      var file = File(savePath).openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      await file.close();
    } catch (e) {
      print(e);
    }
  }

  void updateProgress(done, total) {
    progress = done / total;
    setState(() {
      if (progress >= 1) {
        progressString = '✅ finished downloading';
        didDownloadPDF = true;
      } else {
        progressString = (progress * 100).toStringAsFixed(0) + '% done.';
      }
    });
  }

//pdf dwonlad work it
  pdfDownload(pdfurl, value) async {
    print('dkkdkdkd');
    print(pdfurl);
    setState(() {
      isdownloadin = false;
      index = value;
    });
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      //add more permission to request here.
    ].request();
    String i = "";
    i = DateTime.now().toString();
    if (pdfurl.toString().isNotEmpty) {
      if (statuses[Permission.storage]!.isGranted) {
        var dir = await DownloadsPathProvider.downloadsDirectory;

        Future<Directory?> downloadsDirectory =
            DownloadsPathProvider.downloadsDirectory;
        // Directory dir = Directory('/storage/emulated/0/Download');
        if (dir != null) {
          String savename = "file.pdf";
          String savePath = "${dir.path}/$savename";
          print(savePath);
          //output:  /storage/emulated/0/Download/banner.png

          try {
            await Dio().download(ApiUrl.imagesUrl + pdfurl.toString(), savePath,
                onReceiveProgress: (received, total) {
                  if (total != -1) {
                    print((received / total * 100).toStringAsFixed(0) + "%");
                    setState(() {
                      progressString =
                          (received / total * 100).toStringAsFixed(0) + "%";
                    });
                    //you can build progressbar feature too
                  }
                });
            Get.snackbar(
                "download Succesfull", "File is saved to download folder");
          } on DioError catch (e) {
            print(e.message);
          }
        }
      } else {
        print("No permission to read and write.");
      }
    } else {
      Get.snackbar("File Not Available", "");
    }
  }

  void filepicker() {
    setState(() {});
  }

  static int _len = 10;
  List<bool> isChecked = List.generate(_len, (i) => false);
  String _getTitle() =>
      "Checkbox Demo : Checked = ${isChecked.where((check) => check == true).length}, Unchecked = ${isChecked.where((check) => check == false).length}";
  String _title = "Checkbox Demo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
           backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Evaluate HomeWork",style: MyGoogeFont.mydmSans,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.010.sh,
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
                    child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                print("chekup-------");
                                print(studentId);
                                print(availableHobbies);
                                },
                              child: Text(
                                "Availuate Date",
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.010.sh,
                            ),
                            Card(
                              elevation: 10,
                              child: TextFormField(
                                controller: homeworkevaluteController,
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hoverColor: Colors.white,
                                  filled: true,
                                  isDense: true,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelStyle: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  suffix: InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
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
                                    evaluationDate =
                                        MyDateFormat.dateformatmethod(
                                            formattedDate);
                                    homeworkevaluteController.text =
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Date cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 0.020.sh,
                            ),
                 Obx(
                                  () => teacherHomeWorkController
                                  .isdownloadinevaluation.value

                                  ? Expanded(
                                child:teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value!=null? ListView.builder(
                                    itemCount: teacherHomeWorkController
                                        .teacherHomeWorkForEvaluationModel
                                        .value
                                        ?.response
                                        .length ??
                                        0,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int i) =>
                                        Row(
                                          children: [
                                            Checkbox(
                                                onChanged: (checked) {
                                                  print(i);

                                                  print(
                                                      "lenthhhhhhhhhhhhh");

                                                  // var letters = [];
                                                  // String data3='${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].studentId}';
                                                  // letters.add(data3);
                                                  // var numbers = [];
                                                  //  numbers.add(i)
                                                  // var data = Map<String, int>.fromIterables(letters, numbers);
                                                  // print(data);
                                              //     var mapObj2 =  Map();
                                              //
                                              //     mapObj2["$i"]='${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].studentId}';
                                              //
                                              //     print(mapObj2);
                                              //
                                              // print(mapObj2);
                                              //     availableHobbies.add(mapObj2);
                                              //     print(availableHobbies);


                                          // Map data =  Map.from({"${i}": '${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].studentId}'});
                                          //         print(data);
                                          //
                                          //      data.putIfAbsent(i, () => '${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].studentId}');
                                          //         var mapObj2 = new SplayTreeMap<int, String>();
                                              // mapObj2[i]='${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].studentId}';
// print(mapObj2);
                                                  if(isChecked[i]==false) {
                                                    checkBoxList.add(
                                                        '${teacherHomeWorkController
                                                            .teacherHomeWorkForEvaluationModel
                                                            .value?.response[i]
                                                            .studentId}');


                                                  } else{
                                                    checkBoxList.removeAt(i);
                                                    print(checkBoxList);

                                                  }

                                                  // final index1 = datatest.indexWhere((element) => element[i] == i);
                                                  // print(index1);
                                                  // if (index1 != -1) {
                                                  //   print("Index $index1: ${checkBoxList[index1]}");}
                                                  // indexListAll.add(i);

                                                  //  datatest =  Map.from({"${i}": '${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].studentId}'});
                                                  //
                                                  //
                                                  // datatest.putIfAbsent(i+0, () => '${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].studentId}');
                                                  // // var fruit2 = Map.fromEntries(data)..addAll(data);
                                                  // print(fruit2);
    // checkBoxList.asMap();

                                                  setState(
                                                        () {
print(isChecked[i]);
                                                      isChecked[i] =
                                                      checked!;
                                                      _title =
                                                          _getTitle();
                                                    },
                                                  );
                                                },
                                                value: isChecked[i]),
                                            // Checkbox(
                                            //   materialTapTargetSize:
                                            //       MaterialTapTargetSize
                                            //           .shrinkWrap,
                                            //   visualDensity:
                                            //       VisualDensity
                                            //           .compact,
                                            //   value: i == radiobutton
                                            //       ? this.value
                                            //       : false,
                                            //   onChanged: (value) {
                                            //     setState(() {
                                            //       this.value = value!;
                                            //       print(i);
                                            //
                                            //       radiobutton = i;
                                            //
                                            //       studentId.add(
                                            //           '${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].id}');
                                            //     });
                                            //   },
                                            // ),
                                            Text(
                                              '${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].studentName}',
                                              style:
                                              GoogleFonts.dmSans(
                                                fontStyle:
                                                FontStyle.normal,
                                                fontSize: 12.sp,
                                                fontWeight:
                                                FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets
                                                  .only(
                                                  left: 75.0)
                                                  .r,
                                              child: InkWell(
                                                onTap: () async {
                                                  teacherHomeWorkController
                                                      .isdownloadingmethods();

                                                  // download(
                                                  //     Dio(),
                                                  //     _homeWorkController
                                                  //             .homeWorkControllerList[i]
                                                  //         [0]["document"],
                                                  //     dir.path);

                                                  pdfDownload(
                                                      '${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].document}',
                                                      i);
                                                  setState(() {});
                                                },
                                                child: isdownloadin
                                                    ? Row(
                                                  children: [
                                                    Text(
                                                      "Download",
                                                      style: GoogleFonts
                                                          .dmSans(
                                                        fontStyle:
                                                        FontStyle.normal,
                                                        fontSize:
                                                        15.sp,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors
                                                            .black,
                                                      ),
                                                    ),
                                                    Icon(Icons
                                                        .download)
                                                  ],
                                                )
                                                    : index == i
                                                    ? Row(
                                                  children: [
                                                    InkWell(
                                                      onTap:
                                                          () async {
                                                        // ignore: use_build_context_synchronously
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //     builder: (context) =>
                                                        //         PdfViewerPage(
                                                        //             tempDir.path),
                                                        //   ),
                                                        // );
                                                      },
                                                      child:
                                                      SizedBox(
                                                        width:
                                                        0.32.sw,
                                                        child:
                                                        Text(
                                                          "Download:$progressString",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: GoogleFonts.dmSans(
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 15.sp,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                                    : Row(
                                                  children: [
                                                    Text(
                                                      "Download",
                                                      style:
                                                      GoogleFonts.dmSans(
                                                        fontStyle:
                                                        FontStyle.normal,
                                                        fontSize:
                                                        15.sp,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color:
                                                        Colors.black,
                                                      ),
                                                    ),
                                                    Icon(Icons
                                                        .download)
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )):Center(child: Text("Record Is Not Found")),
                              )
                                  : Center(child: Center(child: CircularProgressIndicator())
                                // Container(width:0.06.sw,height:0.026.sh,child: CircularProgressIndicator(color: Colors.blue,))
                              )
                            ),
                            Center(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(top: 4.0, left: 18).r,
                                child: Container(
                                  width: 0.25.sw,
                                  height: 0.055.sh,
                                  color: Colors.blue,
                                  child: TextButton(
                                    onPressed: (){
                                    setState(() {
                                      buttonclick=true;
                                    });
                                    Future.delayed(Duration(seconds: 3),() {
                                      setState(() {
                                        buttonclick = false;
                                      });
                                    });      // Map<String, int> mapMonths  = data4;
                                      // Map<String, int> moreMonths = data4;
                                      //
                                      // mapMonths.addEntries(moreMonths.entries);
                                      // print(mapMonths);
                                      // mapMonths.forEach((key, value){
                                      //   print('$key: $value');
                                      // });


                                      //         var mapObj2 = new SplayTreeMap<int, String>();
                                      // mapObj2[i]='${teacherHomeWorkController.teacherHomeWorkForEvaluationModel.value?.response[i].studentId}';

                                      // print("mapMonths");
                                      // Map<String, int> data4 = Map<String ,int>.fromIterables(checkBoxList, indexListAll);
                                      // print(data4);

                                      teacherHomeWorkController
                                          .addEvaluationApi(
                                          evaluationDate,checkBoxList.asMap(),context);
                                    },
                                    child: buttonclick?Center(
                                        child: Container(width: 0.05.sw,
                                            height: 0.025.sh,child: CircularProgressIndicator(color: Colors.white,))):Text(
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
                        ))),
              ),
            ],
          ),
        ));
  }
}
