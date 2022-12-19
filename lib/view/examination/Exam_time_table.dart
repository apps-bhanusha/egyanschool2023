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
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.blue,
                          child: Container(
                            
                            width: double.infinity,
                              decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            
                                          ),
                            height: 0.15.sh,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      Text("Unit Test:-$i",style: TextStyle(color: Colors.white), ),
                                      Text("Unit Test:-$i",style: TextStyle(color: Colors.white), ),
                                      
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/arr.png",width: 30,height: 40,),
                                  // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_outlined,size: 50,color: Colors.white,))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ));
  }
}
