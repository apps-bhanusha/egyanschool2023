import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamTimeDetail extends StatelessWidget {
  const ExamTimeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam schedule"),
      ),
      body: Container(
        height: 0.61.sh,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SizedBox.expand(
          child: Column(
            children: [
              for(int i=0;i<=3;i++)
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: InkWell(
                    child: Card(
                      elevation: 10,
                      child: Container(
                        width: 0.95.sw,
                        height: 0.11.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffE3F2FB),
                        ),
                        child: Column(
                          
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Row(
                                children: const [
                                  Text(
                                    "English",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: Text("Room No. 12",style: TextStyle(fontSize: 17),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  const Text(
                                    "22/22/2222",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                                  ),
                                 // const Icon(Icons.timelapse),
                                  SizedBox(
                                    width: 0.08.sw,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 0.25.sw,
                                      height: 0.06.sh,
                                      decoration: BoxDecoration(
                                         color: Color(0xff828181),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                     
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:  [
                                          const Text("Start Time",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 255, 255, 255),
                                                  fontSize: 15)),
                                                   Container(
                                            color: Colors.black,
                                            width: 0.24.sw,height: 1,
                                          ),
                                          Text("11:00:00 AM",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 255, 255, 255),
                                                  fontSize: 15)),
                                        ],
                                      ),
                                    ),
                                  ),
                                 SizedBox(width: 0.01.sw,),
                                  Container(
                                     decoration: BoxDecoration(
                                         color: Color(0xff828181),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
 width: 0.25.sw,
                                    height: 0.06.sh,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("End Time",
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                fontSize: 15)),
                                        Container(
                                          color: Colors.black,
                                          width: 0.24.sw,height: 1,
                                        ),
                                        Text("10:00:00 AM",
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                fontSize: 15)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
