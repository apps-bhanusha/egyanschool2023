import 'dart:async';

import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/home_word_controller.dart';
import 'package:ecom_desgin/controller/homeworkcreate_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';

class HomeWork extends StatefulWidget {
  const HomeWork({super.key});

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  final HomeWorkController _homeWorkController = Get.put(HomeWorkController());
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

  var contenttileController = TextEditingController();
  var noteController = TextEditingController();
  bool noteValidate = false;
  final HomeWorkCreateController homeworkcreate =
      Get.put(HomeWorkCreateController());
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
  var student_id;
  var file;
  var fileData;
  // FormData formData = new FormData.from({
  //   "name": "wendux",
  //   "file1": new UploadFileInfo(new File("./upload.jpg"), "upload1.jpg")
  // });
  // response = await dio.post("/info", data: formData)
  String _selectdrop = "select";
  List<String> dropdata = ["hindi", "math"];
  bool uploadDone = false;

  double progress = 0;

  bool didDownloadPDF = false;
  bool isdownloadin = true;
  int index = 0;
  var box = Hive.box("schoolData");
  late var id = box.get("student_id");

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

  @override
  void initState() {
    company_key = box.get("company_key");
    student_id = box.get("student_id");
    _homeWorkController.homeworkapi(studentProfileController.studentProfileModel.value?.response.studentId );
    super.initState();
    initDownloadsDirectoryState();
  }

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
            await Dio().download(ApiUrl.imagesUrl+pdfurl.toString(), savePath,
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
void filepicker(){
    setState(() {

    });
}
  void showCustomDialog(BuildContext context) {
    noteController.clear();
                                            contenttileController.clear();
                                             fileData="";
                                             
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Material(
          color: Colors.transparent,
          child: StatefulBuilder(
              builder: (context, setState) {
              return Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    print("dfd");


                  });
                },
                child: Container(
                  height: 0.65.sh,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SizedBox.expand(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 0.02.sh,
                        color: Colors.blue,
                      ),
                      const Text(
                        "Home Work Upload",
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'Home Work List',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red)),
                                ],
                              ),
                            ),
                            // DropdownButton<String>(
                            //   isExpanded: true,
                            //   hint: Text(_selectdrop,
                            //       style: const TextStyle(color: Colors.blueAccent)),
                            //   items: dropdata.map((String value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(
                            //         value,
                            //         style:
                            //             const TextStyle(color: Colors.blueAccent),
                            //       ),
                            //     );
                            //   }).toList(),
                            //   onChanged: (String? newValue) {
                            //     print(newValue);
                            //     setState(() {
                            //       _selectdrop = newValue!;
                            //     });
                            //   },
                            // ),
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
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
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
                                child: TextFormField(
                                  controller: contenttileController,
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
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
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
                                child: TextFormField(
                                  controller: noteController,
                                  // maxLength: 4,
                                  onFieldSubmitted: (value) {
                                    //Validator
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter The Text!';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
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
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
                                  ],
                                ),
                              ),
                              Container(
                                height: 0.08.sh,
                                width: 0.95.sw,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    FloatingActionButton(
                                        child: Icon(Icons.upload_sharp),
                                        backgroundColor: Colors.white,
                                        onPressed: () async {
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
                                            userfile = file.path;
                                            fileData = file.name;

                                            // Get.snackbar(
                                            //  "file select is sucessful",
                                            //   "",
                                            //   duration: 5.seconds, // it could be any reasonable time, but I set it lo-o-ong
                                            //   snackPosition: SnackPosition.BOTTOM,
                                            //   showProgressIndicator: true,
                                            //
                                            //   isDismissible: true,
                                            //   backgroundColor: Colors.lightGreen,
                                            //   colorText: Colors.white,
                                            //   mainButton: TextButton(
                                            //       onPressed: Get.back,
                                            //       child: const Text(
                                            //           "Close"
                                            //
                                            //       )),
                                            // );
                                            setState(() {
                                              if (fileData
                                                      .toString()
                                                      .isNotEmpty &&
                                                  contenttileController.text
                                                      .toString()
                                                      .isNotEmpty &&
                                                  noteController.text
                                                      .toString()
                                                      .isNotEmpty) {


                                                print("fdfhgh");

                                              } if (content_title.toString().isNotEmpty) {

                                                if(note.toString().isNotEmpty){

                                                  if(fileData.toString()!="null"){

                                                    if(homework_id.toString().isNotEmpty){


                                                      fileselected = true;
                                                    
                                                    }

                                                  }else{
                                                    Get.snackbar(
                                                      "Please Select File",
                                                      "",
                                                      duration: 5.seconds, // it could be any reasonable time, but I set it lo-o-ong
                                                      snackPosition: SnackPosition.BOTTOM,
                                                      showProgressIndicator: true,

                                                      isDismissible: true,
                                                      backgroundColor: Colors.lightGreen,
                                                      colorText: Colors.white,
                                                      mainButton: TextButton(
                                                          onPressed: Get.back,
                                                          child: const Text(
                                                              "Close"

                                                          )),
                                                    );
                                                  }
                                                }else{
                                                  Get.snackbar(
                                                    "Please Select Description",
                                                    "",
                                                    duration: 5.seconds, // it could be any reasonable time, but I set it lo-o-ong
                                                    snackPosition: SnackPosition.BOTTOM,
                                                    showProgressIndicator: true,

                                                    isDismissible: true,
                                                    backgroundColor: Colors.lightGreen,
                                                    colorText: Colors.white,
                                                    mainButton: TextButton(
                                                        onPressed: Get.back,
                                                        child: const Text(
                                                            "Close"

                                                        )),
                                                  );
                                                }




                                                // _submit();

                                              }else{
                                                Get.snackbar(
                                                  "Please Select Content Title",
                                                  "",
                                                  duration: 5.seconds, // it could be any reasonable time, but I set it lo-o-ong
                                                  snackPosition: SnackPosition.BOTTOM,
                                                  showProgressIndicator: true,

                                                  isDismissible: true,
                                                  backgroundColor: Colors.lightGreen,
                                                  colorText: Colors.white,
                                                  mainButton: TextButton(
                                                      onPressed: Get.back,
                                                      child: const Text(
                                                          "Close"

                                                      )),
                                                );
                                              }
                                              ;
                                            });
                                            filepicker();
                                          } else {
                                            fileselected = false;
                                            // Get.snackbar(
                                            //   "No file selected",
                                            //   "",
                                            //   duration: 5.seconds, // it could be any reasonable time, but I set it lo-o-ong
                                            //   snackPosition: SnackPosition.BOTTOM,
                                            //   showProgressIndicator: true,
                                            //
                                            //   isDismissible: true,
                                            //   backgroundColor: Colors.lightGreen,
                                            //   colorText: Colors.white,
                                            //   mainButton: TextButton(
                                            //       onPressed: Get.back,
                                            //       child: const Text(
                                            //           "Close"
                                            //
                                            //       )),
                                            // );

                                            throw "Cancelled File Picker";
                                            print('No file selected');
                                          }
                                        }),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(fileData ?? ""),
                                  ],
                                ),
                              ),
                              // Container(
                              //         decoration: BoxDecoration(
                              //           shape: BoxShape.rectangle,
                              //           border: Border.all(
                              //             color: Colors.blue,
                              //             width: 1.0,
                              //           ),
                              //         ),
                              //         child: const TextField(
                              //           decoration: InputDecoration(
                              //             border: InputBorder.none,
                              //           ),
                              //         ),
                              //       ),

                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Center(
                                    child: InkWell(
                                        onTap: () {
                                          print("uploading  data");
                                          print(content_title);
                                          print(note);
                                          print(fileData);
                                          print(homework_id);
                                          note = noteController.text;
                                          content_title = contenttileController.text;

                                          if(fileselected==true){
                                            homeworkcreate.HomeWorkCreateapi(
                                                company_key,
                                                student_id,
                                                content_title,
                                                note,
                                                userfile,
                                                homework_id);

                                            noteController.clear();
                                            contenttileController.clear();
                                             fileData="";

                                          }
                                          Navigator.pop(context);
                                        },
                                        child:fileselected? Container(
                                                alignment: Alignment.center,
                                                width: 0.3.sw,
                                                height: 0.07.sh,
                                                // color: Colors.green,
                                                decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(30),
                                                  ),
                                                ),
                                                child: const Text(
                                                  "Upload",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ):Container(
                                          alignment: Alignment.center,
                                          width: 0.3.sw,
                                          height: 0.07.sh,
                                          // color: Colors.green,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                          child: const Text(
                                            "Upload",
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        )
                                          )
                                ),
                              ),
                            ],
                          ))
                    ],
                  )),
                ),
              ),
            );
              }  ),
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
          backgroundColor: AgentColor.appbarbackgroundColor,
          title: Text('Home Work', style: MyGoogeFont.mydmSans),
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
        body: Obx(() => _homeWorkController.isloading.value
            ? RefreshIndicator(
                onRefresh: () {
                  print("4444444444444444444444444444333");
                  setState(() {
                    _homeWorkController.homeworkapi(id);
                  });
                  Timer timer;

                  timer = Timer.periodic(Duration(seconds: 3),(t){
                    _homeWorkController.homeworkapi(id);
                  });
                  return Future.delayed(
                    Duration(seconds: 1),
                  );
                },
                child: ListView.builder(
                    itemCount:
                        _homeWorkController.homeWorkControllerList[0].length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, int i) => Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Card(
                              elevation: 10,
                              child: Container(
                                width: 0.95.sw,
                                height: 0.20.sh,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Row(
                                  /////////////////////////////////////////////////////////////////////////////////                          // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10))
                                            .r,
                                        color: Colors.red,
                                      ),
                                      width: 0.001.sw,
                                      height: 0.20.sh,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 0.94.sw,
                                          height: 0.002.sh,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20).r,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                                  left: 10, top: 5)
                                              .r,
                                          child: Row(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                _homeWorkController
                                                        .homeWorkControllerList[
                                                            0][i]["status"]
                                                        .toString()
                                                        .capitalizeFirst ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 0.33.sw,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 18),
                                                child: InkWell(
                                                  onTap: () async {
                                                    _homeWorkController
                                                        .isdownloadinmethod();

                                                    // download(
                                                    //     Dio(),
                                                    //     _homeWorkController
                                                    //             .homeWorkControllerList[i]
                                                    //         [0]["document"],
                                                    //     dir.path);

                                                    pdfDownload(
                                                        _homeWorkController
                                                                    .homeWorkControllerList[0]
                                                                [
                                                                i]["document"] ??
                                                            "",
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
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            Icon(Icons.download)
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
                                                                    child: Text(
                                                                      "Download:$progressString",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
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
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : Row(
                                                              children: [
                                                                Text(
                                                                  "Download",
                                                                  style:
                                                                      GoogleFonts
                                                                          .dmSans(
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                Icon(Icons
                                                                    .download)
                                                              ],
                                                            ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0)
                                                  .r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 0.25.sw,
                                                child: Text(
                                                  _homeWorkController
                                                          .homeWorkControllerList[
                                                              0][i]
                                                              ["subject_name"]
                                                          .toString()
                                                          .toUpperCase() ??
                                                      "",
                                                  style: GoogleFonts.dmSans(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (ctx) =>
                                                          AlertDialog(
                                                        title: Text(
                                                          "Description",
                                                          style: GoogleFonts
                                                              .dmSans(
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                            Colors.white,
                                                        content: Text(
                                                            Bidi.stripHtmlIfNeeded(
                                                                _homeWorkController
                                                                            .homeWorkControllerList[
                                                                        0][i][
                                                                    "description"]),
                                                            style: GoogleFonts
                                                                .dmSans(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            )),

                                                        // content:Text(
                                                        //   _homeWorkController
                                                        //       .homeWorkControllerList[0][i]["description"]?? "",
                                                        //   style: GoogleFonts.dmSans(
                                                        //     fontStyle: FontStyle.normal,
                                                        //     fontSize: 10.sp,
                                                        //     fontWeight: FontWeight.bold,
                                                        //     color: Colors.black,
                                                        //   ),
                                                        //   overflow: TextOverflow.ellipsis,
                                                        // ),
                                                        actions: <Widget>[
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        ctx)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                "okay",
                                                                style:
                                                                    GoogleFonts
                                                                        .dmSans(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .blue),
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  icon: Icon(Icons
                                                      .visibility_outlined)),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 54.0)
                                                        .r,
                                                child: InkWell(
                                                  onTap: () {
                                                    if (_homeWorkController
                                                            .homeWorkControllerList[
                                                                0][i]["status"]
                                                            .toString()
                                                            .toLowerCase() ==
                                                        "pending") {
                                                      if (_homeWorkController
                                                                  .homeWorkControllerList[
                                                              0] !=
                                                          null) {
                                                        homework_id = _homeWorkController .isloading.value ? _homeWorkController.homeWorkControllerList[ 0][i]["id"]
                                                                : "";
                                                      }
                                                      fileselected = false;
                                                      showCustomDialog(context);
                                                    }
                                                    ;
                                                  },
                                                  child: _homeWorkController
                                                              .homeWorkControllerList[
                                                                  0][i]
                                                                  ["status"]
                                                              .toString()
                                                              .toLowerCase() ==
                                                          "pending"
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "Upload",
                                                              style: GoogleFonts
                                                                  .dmSans(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 0.05.sw,
                                                            ),
                                                            const Icon(
                                                                Icons.upload),
                                                          ],
                                                        )
                                                      : Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "Upload",
                                                              style: GoogleFonts
                                                                  .dmSans(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 0.05.sw,
                                                            ),
                                                            const Icon(
                                                              Icons.upload,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ],
                                                        ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(
                                        //  height: 0.05.sw,
                                        // ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Evulationdate:-",
                                                style: GoogleFonts.dmSans(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 0.25.sw,
                                                child: Obx(() => Text(
                                                      _homeWorkController.homeWorkControllerList[
                                                                          0][
                                                                      i][
                                                                  "evaluation_date"] !=
                                                              null
                                                          ? MyDateFormat.dateformatmethod1(
                                                              _homeWorkController
                                                                          .homeWorkControllerList[
                                                                      0][i][
                                                                  "evaluation_date"])
                                                          : "",
                                                      style: GoogleFonts.dmSans(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 0.02.sw,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  // ignore: prefer_const_constructors
                                                  Text(
                                                    "submission Date:-",
                                                    style: GoogleFonts.dmSans(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => Text(
                                                      _homeWorkController.homeWorkControllerList[
                                                                          0][
                                                                      i][
                                                                  "submit_date"] !=
                                                              null
                                                          ? MyDateFormat.dateformatmethod1(
                                                              _homeWorkController
                                                                          .homeWorkControllerList[
                                                                      0][i][
                                                                  "submit_date"])
                                                          : "",
                                                      style: GoogleFonts.dmSans(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                                  top: 3, left: 8.0)
                                              .r,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/teacher.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              Obx(
                                                () => Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 3)
                                                          .r,
                                                  child: Text(
                                                    _homeWorkController
                                                            .isloading.value
                                                        ? _homeWorkController
                                                                .homeWorkControllerList[
                                                                    0][i][
                                                                    "staff_name"]
                                                                .toString()
                                                                .capitalize ??
                                                            ""
                                                        : "",
                                                    style: GoogleFonts.dmSans(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Column(
                                    //   children: [
                                    //     Container(
                                    //       width: double.infinity,
                                    //       height: 2,
                                    //       decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.circular(20),
                                    //         color: Colors.red,
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding: const EdgeInsets.all(0),
                                    //       child: Row(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.start,
                                    //         children: [
                                    //           const Spacer(),
                                    //           Padding(
                                    //             padding:
                                    //                 const EdgeInsets.only(right: 20),
                                    //             child: InkWell(
                                    //               onTap: () async {
                                    //                 _homeWorkController
                                    //                     .isdownloadinmethod();

                                    //                 // Directory dir = Directory(
                                    //                 //     '/storage/emulated/0/Download');
                                    //                 // download(
                                    //                 //     Dio(),
                                    //                 //     _homeWorkController
                                    //                 //             .homeWorkControllerList[i]
                                    //                 //         [0]["document"],
                                    //                 //     dir.path);

                                    //                 pdfDownload(_homeWorkController
                                    //                         .homeWorkControllerList[i]
                                    //                     [0]["document"]);
                                    //               },
                                    //               child: _homeWorkController
                                    //                       .isdownloadin.value
                                    //                   ? Row(
                                    //                       children: const [
                                    //                         Text("Download",
                                    //                             style: TextStyle(
                                    //                                 color: Color
                                    //                                     .fromARGB(255,
                                    //                                         0, 0, 0),
                                    //                                 fontSize: 15)),
                                    //                         Icon(Icons.download)
                                    //                       ],
                                    //                     )
                                    //                   : Row(
                                    //                       children: [
                                    //                         InkWell(
                                    //                           onTap: () async {
                                    //                             // ignore: use_build_context_synchronously
                                    //                             // Navigator.push(
                                    //                             //   context,
                                    //                             //   MaterialPageRoute(
                                    //                             //     builder: (context) =>
                                    //                             //         PdfViewerPage(
                                    //                             //             tempDir.path),
                                    //                             //   ),
                                    //                             // );
                                    //                           },
                                    //                           child: SizedBox(
                                    //                             width: 150,
                                    //                             child: Text(
                                    //                                 "Download: $progressString",
                                    //                                 overflow:
                                    //                                     TextOverflow
                                    //                                         .ellipsis,
                                    //                                 style: const TextStyle(
                                    //                                     color: Color
                                    //                                         .fromARGB(
                                    //                                             255,
                                    //                                             0,
                                    //                                             0,
                                    //                                             0),
                                    //                                     fontSize:
                                    //                                         15)),
                                    //                           ),
                                    //                         ),
                                    //                       ],
                                    //                     ),
                                    //             ),
                                    //           )
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ],
                                    //   // ),
                                    //  Column(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceEvenly,
                                    //     children: [
                                    //       Padding(
                                    //         padding: const EdgeInsets.only(
                                    //           left: 10,
                                    //         ),
                                    //         child: Text(
                                    //           _homeWorkController
                                    //               .homeWorkControllerList[i][0]["name"],
                                    //           style: const TextStyle(
                                    //               color: Color.fromARGB(255, 0, 0, 0),
                                    //               fontSize: 20),
                                    //         ),
                                    //       ),

                                    //       Padding(
                                    //         padding: const EdgeInsets.only(left: 10),
                                    //         child: IconButton(
                                    //             onPressed: () {},
                                    //             icon: Icon(Icons.visibility_outlined)),
                                    //       ),
                                    //       Spacer(),

                                    //     // Container(
                                    //     //   color: Color.fromARGB(255, 199, 0, 0),
                                    //     //   height: 47,
                                    //     //   width: 1,
                                    //     // ),
                                    //     // Padding(
                                    //     //   padding: EdgeInsets.only(
                                    //     //       left: 0.01.sw,
                                    //     //       right: 0.01.sw,
                                    //     //       bottom: 0.01.sh),
                                    //     //   child: Column(
                                    //     //     mainAxisAlignment:
                                    //     //         MainAxisAlignment.spaceEvenly,
                                    //     //     children: [
                                    //     //       Row(
                                    //     //         children: [
                                    //     //           uploadDone == true && i == 3
                                    //     //               ? InkWell(
                                    //     //                   onTap: () => setState(() {
                                    //     //                     uploadDone = false;
                                    //     //                   }),
                                    //     //                   child: Padding(
                                    //     //                     padding:
                                    //     //                         const EdgeInsets.all(
                                    //     //                                 7.4)
                                    //     //                             .r,
                                    //     //                     child: Container(
                                    //     //                       alignment:
                                    //     //                           Alignment.center,
                                    //     //                       width: 0.2.sw,
                                    //     //                       height: 0.05.sh,
                                    //     //                       color: Colors.green,
                                    //     //                       child: const Text(
                                    //     //                         "Complate",
                                    //     //                         style: TextStyle(
                                    //     //                             color:
                                    //     //                                 Colors.white),
                                    //     //                       ),
                                    //     //                     ),
                                    //     //                   ),
                                    //     //                 )
                                    //     //               : Padding(
                                    //     //                   padding:
                                    //     //                       const EdgeInsets.all(
                                    //     //                               7.4)
                                    //     //                           .r,
                                    //     //                   child: InkWell(
                                    //     //                     onTap: () => setState(() {
                                    //     //                       uploadDone = true;
                                    //     //                     }),
                                    //     //                     child: Container(
                                    //     //                       alignment:
                                    //     //                           Alignment.center,
                                    //     //                       width: 0.23.sw,
                                    //     //                       height: 0.05.sh,
                                    //     //                       color: Colors.red,
                                    //     //                       child: const Text(
                                    //     //                           "Incomplate",
                                    //     //                           style: TextStyle(
                                    //     //                               color: Colors
                                    //     //                                   .white)),
                                    //     //                     ),
                                    //     //                   ),
                                    //     //                 )
                                    //     //         ],
                                    //     //       )
                                    //     //     ],
                                    //     //   ),
                                    //     // )
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )));
  }
}
