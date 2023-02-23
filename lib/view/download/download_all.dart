import 'package:ecom_desgin/Widgets/DropDown_widget.dart';
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/download_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart'; 
class DownloadAll extends StatefulWidget {
  const DownloadAll({super.key});

  @override
  State<DownloadAll> createState() => _DownloadAllState();
}

class _DownloadAllState extends State<DownloadAll> {
  final DownloadAllController _downloadAllController = Get.put(DownloadAllController());

  double progress = 0;

  bool didDownloadPDF = false;
  bool isdownloadin = true;
  int ind=0;
 String progressString = 'Now.';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }

 pdfDownload(pdfurl,value) async {
    print('dkkdkdkd');
    print(pdfurl);
    setState(() {
      isdownloadin=false;
      ind=value;

    });
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      //add more permission to request here.
    ].request();
    String i = "";
    i=DateTime.now().toString();
   if(pdfurl.toString().isNotEmpty){
     if (statuses[Permission.storage]!.isGranted) {
      await Permission.storage.request();
        var dir = await DownloadsPathProvider.downloadsDirectory;
          // Directory dir = Directory('/storage/emulated/0/Download');
      if (dir != null) { 
        String savename = "file.pdf";
        String savePath = "${dir.path}/$savename";
        print(savePath);
        //output:  /storage/emulated/0/Download/banner.png
         print("${ApiUrl.imagesUrl}"+pdfurl.toString());
        try {
          await Dio().download(ApiUrl.imagesUrl+pdfurl.toString(), savePath,
              onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) +"%");
              setState(() {
                progressString =(received / total * 100).toStringAsFixed(0) +"%";
              });
              //you can build progressbar feature too
            }
          });
          isdownloadin=true;
          Get.snackbar(
              "Download Successfull", "File is saved to download folder");
        } on DioError catch (e) {
          print(e.message);
          Get.snackbar(
              e.toString(), "");
        }
      }
    } else {
      print("No permission to read and write.");
      Get.snackbar(
              "No permission to read and write.", "");
    }
   }else{
    Get.snackbar(
              "File Not Available", "");
   }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Theme.of(context).primaryColor,
        title: Text('Download',style: MyGoogeFont.mydmSans),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    DropDownWidget(droph: 0.060.sh, selectText: _downloadAllController.selectDrop.value, item: _downloadAllController.dropdata, isloading: true, xpand: true, empaty: "", onChange: (value) {
                     
                         setState(() {
                           
                         });  
                          _downloadAllController.selectDropdown(value);
                          _downloadAllController.isloading.value=false;
                    },)
                  //   Container(
                  //      height: 0.060.sh,
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.rectangle,
                  //   border: Border.all(
                  //     color: Colors.grey,
                  //     width: 1.0,
                  //   ),
                  // ),
                  //     child: DropdownButton<String>(
                  //       underline: const SizedBox(),
                  //       autofocus: true,
                  //       isExpanded: true,
                  //       hint: Obx(
                  //         () => Text(
                  //             _downloadAllController.selectDrop.value,
                  //             style: const TextStyle(
                  //               fontSize: 20,color: Colors.black)),
                  //       ),
                  //       items: _downloadAllController.dropdata
                  //           .map((String value) {
                  //         return DropdownMenuItem<String>(
                  //           value: value,
                  //           child: Text(
                  //             value,
                  //             style:
                  //                 const TextStyle(color: Colors.blueAccent),
                  //           ),
                  //         );
                  //       }).toList(),
                  //       onChanged: (String? newValue) {
                  //         print(newValue);
                           
                  //         _downloadAllController.selectDropdown(newValue);
                  //         _downloadAllController.isloading.value=false;
                  //       },
                  //     ),
                  //   ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Obx(
                  () => _downloadAllController.isloading.value?_downloadAllController.norecord.value? ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(255, 164, 229, 255),
                        child: ListTile(
                          title:
                              Obx(() => Text("${_downloadAllController.assignmentDownloadModel.value?.response?.list?[index]?.title}")),
                              subtitle: Obx(() => Text("${MyDateFormat.dateformatmethod2(_downloadAllController.assignmentDownloadModel.value?.response?.list?[index]?.date.toString())}")),

                              trailing: isdownloadin?InkWell(onTap:(){
                                pdfDownload("${_downloadAllController.assignmentDownloadModel.value?.response?.list?[index]?.file}",index);
                              } ,child: const Icon(Icons.download)):index==ind ? Text(
                                  progressString,
                                  overflow:
                                      TextOverflow
                                          .ellipsis,
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),):const Icon(Icons.download),
                        ),
                      );
                    },
                    itemCount:_downloadAllController.assignmentDownloadModel.value?.response?.list?.length??0,

                  ):const Center(child: Text("No Record Found"),):const CircularProgressIndicator(color: Colors.blue,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
