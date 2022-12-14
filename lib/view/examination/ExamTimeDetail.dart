import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamTimeDetail extends StatelessWidget {
  const ExamTimeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exam Time Detail"),),
      body:  Container(
        height: 0.61.sh,
        
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SizedBox.expand(
            child: Column(
          children: [
            Center(
              child: InkWell(
           
            child: Card(
              elevation: 10,
              child: Container(
                width: 0.95.sw,
                height: 0.13.sh,
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
                      height: 0.05.sh,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children:const [
                             Icon(
                              Icons.book,
                            ),
                             Text(
                              "Unit Test",
                              style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 255, 255, 255),
                                  fontSize: 20),
                            ),
                             Icon(Icons.home_filled),
                         
                             Text("Room No.",
                                style: TextStyle(
                                    color: Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 15)),
                                      Text("20",
                                style: TextStyle(
                                    color: Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.date_range,
                        ),
                        const Text(
                          "22/22/2222",
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 15),
                        ),
                        const Spacer(),
                        // const Icon(Icons.timelapse),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Start Time",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15)),
                            Text("11:00:00 AM",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15)),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 3, right: 3),
                          child: Container(
                            color: Color.fromARGB(255, 204, 0, 0),
                            height: 60,
                            width: 1,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("End Time",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15)),
                            Text("10:00:00 AM",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15)),
                          ],
                        )
                      ],
                    ),
                  ],
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