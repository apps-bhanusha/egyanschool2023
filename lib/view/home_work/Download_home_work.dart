import 'dart:io';

import 'package:ecom_desgin/controller/home_word_controller.dart';
import 'package:ecom_desgin/view/home_work/pdf_viewer_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class DownloadHomeWork extends StatefulWidget {
   String padfpath;
   DownloadHomeWork(this.padfpath,{super.key});
 

  @override
  State<DownloadHomeWork> createState() => _DownloadHomeWorkState();
}

class _DownloadHomeWorkState extends State<DownloadHomeWork> {

 final  HomeWorkController _homeWorkController = HomeWorkController(); 

  static const fileName = "";


  double progress = 0;

  bool didDownloadPDF = false;

  String progressString = 'File has not been downloaded yet.';

  Future download(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
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
        progressString =
            '✅ File has finished downloading. Try opening the file.';
        didDownloadPDF = true;
      } else {
        progressString = 'Download progress: ' +
            (progress * 100).toStringAsFixed(0) +
            '% done.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'First, download a PDF file. Then open it.',
            ),
            TextButton(
              // Here, you download and store the PDF file in the temporary
              // directory.
              onPressed: didDownloadPDF
                  ? null
                  : () async {
                      var tempDir = await getTemporaryDirectory();
                      download(Dio(), widget.padfpath, tempDir.path);
                    },
              child: const Text('Download a PDF file'),
            ),
            Text(
              progressString,
            ),
            TextButton(
              // Disable the button if no PDF is downloaded yet. Once the
              // PDF file is downloaded, you can then open it using PSPDFKit.
              onPressed: !didDownloadPDF
                  ? null
                  : () async {
                      var tempDir = await getTemporaryDirectory();
                      //  await Pspdfkit.present(tempDir.path + fileName);

                      // ignore: use_build_context_synchronously
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         PDFScreen(path: tempDir.path),
                      //   ),
                      // );
                    },
              child: const Text('Open the downloaded file'),
            ),
          ],
        ),
      ),
    );
  }
}
