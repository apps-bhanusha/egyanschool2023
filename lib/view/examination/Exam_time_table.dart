import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/examination/ExamTimeDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

class ExamTimeTable extends StatelessWidget {
  const ExamTimeTable({super.key});


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Examination"),
          
        ),
        body: Column(
          children: [
            for (int i = 0; i <= 3; i++)
              Center(
                child: InkWell(
                  onTap: () => Get.toNamed(RoutesName.examiTimeDetial),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      width: 0.8.sw,
                      height: 0.1.sh,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.blueAccent,
                            height: 0.04.sh,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                Text(
                                  "Unit Test:-$i",
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ));
  }
}
