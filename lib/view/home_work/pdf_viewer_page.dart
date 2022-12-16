import 'dart:io';
import 'package:flutter/material.dart';
class PdfViewerPage extends StatefulWidget {
   String padfpath;
 PdfViewerPage(this.padfpath,{super.key});
 
  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
} 

class _PdfViewerPageState extends State<PdfViewerPage> {
  // late PDFDocument document=document;
  @override
  void initState() {
   
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    // print(loaddpf());
    });
  }
// loaddpf() async {
//     document = await PDFDocument.fromURL(widget.padfpath);
//    setState(() {
//     document=document;
//    });
//     document;
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(widget.padfpath.characters.last.toString())),
    body: Text("")
      // PDFViewer(
      //           document: document,
      //           lazyLoad: false,
      //           zoomSteps: 1,
      //           numberPickerConfirmWidget: const Text(
      //             "Confirm",
      //           ),
      //           //uncomment below line to preload all pages
      //           // lazyLoad: false,
      //           // uncomment below line to scroll vertically
      //           // scrollDirection: Axis.vertical,

      //           //uncomment below code to replace bottom navigation with your own
      //           /* navigationBuilder:
      //                 (context, page, totalPages, jumpToPage, animateToPage) {
      //               return ButtonBar(
      //                 alignment: MainAxisAlignment.spaceEvenly,
      //                 children: <Widget>[
      //                   IconButton(
      //                     icon: Icon(Icons.first_page),
      //                     onPressed: () {
      //                       jumpToPage()(page: 0);
      //                     },
      //                   ),
      //                   IconButton(
      //                     icon: Icon(Icons.arrow_back),
      //                     onPressed: () {
      //                       animateToPage(page: page - 2);
      //                     },
      //                   ),
      //                   IconButton(
      //                     icon: Icon(Icons.arrow_forward),
      //                     onPressed: () {
      //                       animateToPage(page: page);
      //                     },
      //                   ),
      //                   IconButton(
      //                     icon: Icon(Icons.last_page),
      //                     onPressed: () {
      //                       jumpToPage(page: totalPages - 1);
      //                     },
      //                   ),
      //                 ],
      //               );
      //             }, */
      //         ),
    );
  
  }
}