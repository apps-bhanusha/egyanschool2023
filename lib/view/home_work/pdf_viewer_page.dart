import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfViewerPage extends StatefulWidget {
   String padfpath;
 PdfViewerPage(this.padfpath,{super.key});
 
  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
} 

class _PdfViewerPageState extends State<PdfViewerPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         resizeToAvoidBottomInset: false,
         appBar: AppBar(
            title: Text("Download File from URL"),
            backgroundColor: Colors.deepPurpleAccent,
         ),
          body: Container(
             margin: EdgeInsets.only(top:50),
             child: Column(
                 children: [
                      Text("File URL: ${widget.padfpath}"),
                      Divider(),
                      ElevatedButton(
                         onPressed: () async {
                            Map<Permission, PermissionStatus> statuses = await [
                                Permission.storage, 
                                //add more permission to request here.
                            ].request();

                            // if(statuses[Permission.storage]!.isGranted){ 
                            //     var dir = await DownloadsPathProvider.downloadsDirectory;
                            //     if(dir != null){
                            //           String savename = "file.pdf";
                            //           String savePath = dir.path + "/$savename";
                            //           print(savePath);
                            //           //output:  /storage/emulated/0/Download/banner.png

                            //           try {
                            //               await Dio().download(
                            //                  widget.padfpath, 
                            //                   savePath,
                            //                   onReceiveProgress: (received, total) {
                            //                       if (total != -1) {
                            //                           print((received / total * 100).toStringAsFixed(0) + "%");
                            //                           //you can build progressbar feature too
                            //                       }
                            //                     });
                            //                print("File is saved to download folder.");  
                            //          } on DioError catch (e) {
                            //            print(e.message);
                            //          }
                            //     }
                            // }else{
                            //    print("No permission to read and write.");
                            // }

                         },
                         child: Text("Download File."),
                      )

                 ],
             ),
          )
      );
  }
}