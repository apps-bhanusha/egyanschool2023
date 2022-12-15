import 'package:ecom_desgin/controller/home_word_controller.dart';
import 'package:ecom_desgin/controller/school_id_controller.dart';
import 'package:ecom_desgin/main.dart';
import 'package:ecom_desgin/view/home_work/Download_home_work.dart';
import 'package:ecom_desgin/view/home_work/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class HomeWork extends StatefulWidget {
  const HomeWork({super.key});

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  final HomeWorkController _homeWorkController = Get.put(HomeWorkController());
  
  String _selectdrop = "select";
  List<String> dropdata = ["hindi", "math"];
  bool uploadDone = false;

  double progress = 0;

  bool didDownloadPDF = false;

  String progressString = 'Error.';

  @override
  void initState() {
    _homeWorkController.homeworkapi();
    super.initState();
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
                        DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(_selectdrop,
                              style: const TextStyle(color: Colors.blueAccent)),
                          items: dropdata.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style:
                                    const TextStyle(color: Colors.blueAccent),
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
                                child: const Text(
                                  "Upload",
                                  style: TextStyle(color: Colors.white),
                                ),
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
        body: Obx(() => _homeWorkController.isloading.value
            ? ListView.builder(
                itemCount: _homeWorkController.homeWorkControllerList.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Center(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        _homeWorkController
                                                .homeWorkControllerList[i][0]
                                            ["name"],
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 20),
                                      ),
                                      const Spacer(),
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
                                        padding: const EdgeInsets.only(
                                            left: 3, right: 3),
                                        child: Container(
                                          color: Color.fromARGB(255, 204, 0, 0),
                                          height: 40,
                                          width: 1,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          // Get.to( PdfViewerPage(_homeWorkController.homeWorkControllerList[i][0]["document"]));
                                          _homeWorkController
                                              .isdownloadinmethod();
                                        
                                              Directory dir = Directory('/storage/emulated/0/Download');
                                          download(
                                              Dio(),
                                              _homeWorkController
                                                      .homeWorkControllerList[i]
                                                  [0]["document"],dir.path+'data.pdf'
                                              );
                                        },
                                        child: _homeWorkController
                                                .isdownloadin.value
                                            ? Row(
                                                children: const [
                                                  Text("Download",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontSize: 15)),
                                                  Icon(Icons.download)
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      var tempDir =
                                                          await getTemporaryDirectory();

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
                                                    child: SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                          "Download: $progressString",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              fontSize: 15)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text("Start Date:-",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 15)),
                                          Obx(() => Text(
                                              _homeWorkController
                                                      .homeWorkControllerList[i]
                                                  [0]["homework_date"],
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 15))),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // ignore: prefer_const_constructors
                                          Text("Submit Date:-",
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 15)),
                                          Obx(
                                            () => Text(
                                                _homeWorkController
                                                        .homeWorkControllerList[
                                                    i][0]["submit_date"],
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 15)),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text("Evulationdate:-",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 15)),
                                          Obx(
                                            () => Text(
                                                _homeWorkController
                                                        .homeWorkControllerList[
                                                    i][0]["evaluation_date"],
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 15)),
                                          )
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
                                        left: 0.01.sw,
                                        right: 0.01.sw,
                                        bottom: 0.01.sh),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            uploadDone == true && i == 3
                                                ? InkWell(
                                                    onTap: () => setState(() {
                                                      uploadDone = false;
                                                    }),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                                  7.4)
                                                              .r,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 0.2.sw,
                                                        height: 0.05.sh,
                                                        color: Colors.green,
                                                        child: const Text(
                                                          "Complate",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                                7.4)
                                                            .r,
                                                    child: InkWell(
                                                      onTap: () => setState(() {
                                                        uploadDone = true;
                                                      }),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 0.23.sw,
                                                        height: 0.05.sh,
                                                        color: Colors.red,
                                                        child: const Text(
                                                            "Incomplate",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
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
                    ),
                  );
                })
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )));
  }
}
