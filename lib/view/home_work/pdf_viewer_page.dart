import 'dart:io';
import 'package:flutter/material.dart';
class PdfViewerPage extends StatefulWidget {
   String padfpath;
 PdfViewerPage(this.padfpath,{super.key});
 
  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
} 

class _PdfViewerPageState extends State<PdfViewerPage> {

  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(widget.padfpath.characters.last.toString())),
      body:Text("data")
   );
  }
}