
import 'package:ecom_desgin/controller/About_Controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';
class AboutSchool extends StatefulWidget {
  const AboutSchool({super.key});

  @override
  State<AboutSchool> createState() => _AboutSchoolState();
}

class _AboutSchoolState extends State<AboutSchool> {
  final AboutController aboutController= Get.put(AboutController()); 

@override
  void initState() {
    // TODO: implement initState
    super.initState();
     aboutController.isloading.value=false;
    aboutController.aboutSchool();
  }

  @override
  Widget build(BuildContext context) {
    
     

    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
         // ignore: prefer_const_constructors
        //  Obx(() => aboutController.isloading.value?  Text(Bidi.guardBracketInHtml("${aboutController.aboutModel.value?.response.description}")):Center(
        //   child: const Padding(
        // padding: EdgeInsets.only(top: 300),
        // child: CircularProgressIndicator(
        //   color:Colors.blue,
        // ),
        //   ),
        //  )),

          Obx(
            () => aboutController.isloading.value? Html( data:"${aboutController.aboutModel.value?.response.description}" , 
                  style: {
            "hr":Style(
                 padding: const EdgeInsets.all(0)
                  
             )
                  },) :const Center(
                    child: Padding(
                          padding: EdgeInsets.only(top: 300),
                          child: CircularProgressIndicator(
                            color:Colors.blue,
                          ),
                            ),
                  ),
          ),
          ],
        ),
      )
        
    );
  }
}