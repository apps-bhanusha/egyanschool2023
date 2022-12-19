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
              for (int i = 0; i <= 3; i++)
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Center(
                    child: InkWell(
                      child: Card(
                        elevation: 10,
                        child: Container(
                          width: 0.95.sw,
                          height: 0.12.sh,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffE3F2FB),
                          ),
                          child: Stack(
                        
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 19,top: 5
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      "English",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 25),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 14,bottom: 15),
                                      child: Text(
                                        "Room No. 12",
                                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               Positioned(
                                top: 0.033.sh,
                               
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                     padding: EdgeInsets.only(top: 38),
                                        child: Icon(
                                          Icons.date_range,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 0.05.sw,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 38),
                                        child: Text(
                                          "22/22/2222",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 15),
                                        ),
                                      ),
                                      // const Icon(Icons.timelapse),
                                      SizedBox(
                                        width: 0.054.sw,
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 0.01.sw, right: 2,top: 2,bottom: 2),
                                        child: Container(
                                          width: 0.52.sw,
                                          height: 0.06.sh,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff828181),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text("Start Time",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 255, 255, 255),
                                                          fontSize: 15)),
                                                  Container(
                                                    color: Colors.black,
                                                    width: 0.24.sw,
                                                    height: 1,
                                                  ),
                                                  const Text("11:00: AM",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 255, 255, 255),
                                                          fontSize: 15)),
                                                ],
                                              ),
                                              Container(
                                                width: 2,
                                                height: 0.1.sh,
                                                color: Colors.white,
                                              ),
                                               Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text("End Time",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 15)),
                                            Container(
                                              color: Colors.black,
                                              width: 0.24.sw,
                                              height: 1,
                                            ),
                                            const Text("10:00: AM",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 15)),
                                          ],
                                        ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    
                                    ],
                                  ),
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
