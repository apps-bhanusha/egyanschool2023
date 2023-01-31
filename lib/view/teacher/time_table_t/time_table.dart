import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeTableTeacher extends StatefulWidget {
  const TimeTableTeacher({super.key});

  @override
  State<TimeTableTeacher> createState() => _TimeTableTeacherState();
}

class _TimeTableTeacherState extends State<TimeTableTeacher> {
List day=["Mon","Tus","Wed","Thu","Fri","Sat","Sun"];
int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:   AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home Work",style: TextStyle(color: Colors.white),),),
        body: Column(
          children: [

            SizedBox(height: 15,),
            Center(
              child:   Container(
                 width: double.infinity,
                height: 0.08.sh,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      // borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 3,
                              spreadRadius: 10)
                        ]),
                    width: double.infinity,
                    height: 272,
                    child:  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
         for(int i=0;i<=day.length-1;i++)
          Padding(
            padding: const EdgeInsets.all(4),
            child: InkWell(
              onTap: (){
                index=i;
                setState(() {
                  
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
              decoration:  BoxDecoration(
                color: index!=i? Colors.white:Colors.blue,
                boxShadow: const [
                    BoxShadow(
              color: Colors.grey,
              blurRadius: 2, ) ]),
              child: Text(day[i],style:TextStyle(color:  index!=i? Colors.black:Colors.white),),
              ),
            ),
          )

                        ],
                      ),
                    ),
                  )),
            
              
            ),

           
          SizedBox(
            height: 0.78.sh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                   for(int i=0;i<=5;i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      
                       width: double.infinity,
                      height: 0.17.sh,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3
                            )
                          ],
                            color: Colors.white,
                            // borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                        // padding: const EdgeInsets.all(10),
                        child: Row(
                          
                          children: [
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 250,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 209, 234, 255),
                      boxShadow: [
                    BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2, ) ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                    Text("Subject"),
                    Text("HINDI"),
                    Text("(001)"),
                      ],
                    ),
                    ),
                     Expanded(
                       child: Container(
                        alignment: Alignment.center,
                                 decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                             BoxShadow(
                                 color: Colors.grey,
                                 blurRadius: 2, ) ]),
                                 child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                        children:  [
                                 Text("10:00 AM-11:00 AM"),
                                 Text("Room Number : 101"),
                                 Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,         
                                   children: [
                                  Padding(
                                   padding: const EdgeInsets.only(right: 10),
                                    child: Icon(Icons.person_add_alt, color: Color.fromARGB(255, 68, 233, 255),),
                                  ),
                                     Text("Nikhil Shukla"),
                                   ],
                                 ),
                        ],
                                 ),
                                 ),
                     ),
            
            
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )
          ],
        ),
    );
  }
}