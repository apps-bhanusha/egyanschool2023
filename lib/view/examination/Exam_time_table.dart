import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

class ExamTimeTable extends StatelessWidget {
  const ExamTimeTable({super.key});

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 0.61.sh,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SizedBox.expand(
                child: Material(
                    child: Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: () => showCustomDialog(context),
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
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

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
                  onTap: () => showCustomDialog(context),
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
