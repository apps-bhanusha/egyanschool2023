
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {

final List<String> _options = ["Sun ", "Mon ", "Tue ","Wed ","Thu ","Fri ","Sat "];
List<String> dataset1=["09.00-09.00 AM ","09.00 AM-09.00 AM ","09.00-09.00 AM ","09.00-09.00 AM","09.00-09.00 AM "];
List<String> dataset2=["English","Hindi","Mathematics","Science","Social Studies"];
List<String> dataset3=["101","102","103","104","105"];
List <dynamic>datalist=[];
List<dynamic>  timeTable= [
  {
    "time":"09:00 AM 09:45 AM",
    "subject":"hindi",
    "RoomNo.":"101",
  },
   {
    "time":"09:00 AM 09:45 AM",
    "subject":"math",
    "RoomNo.":"102",
  },
   {
    "time":"12:05 PM 12:45 PM",
    "subject":"english",
    "RoomNo.":"103",
  }
  
];

  List<String> weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

  Color activeCardColor = Colors.white;
  Color inactiveCardColor = Colors.black26;

  Color activeTextColor = Colors.black;
  Color inactiveTextColor = Colors.white;

  List<List<Color>> cardColorList = [
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        title: const Text("Class Time Table ",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekdays.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
             onTap: () {
              setState(() {
                for (int i = 0; i < cardColorList.length; i++) {
                  cardColorList[i][0] = inactiveCardColor;
                  cardColorList[i][1] = inactiveTextColor;
                }

                cardColorList[index][0] = activeCardColor;
                cardColorList[index][1] = activeTextColor;
              });
             if(index==0){
              datalist=timeTable;
             }else if(index==1){
              datalist=timeTable;
             }else if(index==2){
              datalist=timeTable;
             }else if(index==3){
              datalist=[];
             }
            },
           
            child: Container(
              margin: const EdgeInsets.only(left: 4,),
              height: 60,
              width: 50,
              decoration: BoxDecoration(
                  color: cardColorList[index][0],
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15,),
                  Text(weekdays[index], style: TextStyle(fontSize: 12, color: cardColorList[index][1], fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          );
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
        Text("Time",style: TextStyle(color: Colors.white,fontSize: 18),),
        Text("Subject",style: TextStyle(color: Colors.white,fontSize: 18),),
        Text("Room No.",style: TextStyle(color: Colors.white,fontSize: 18),),
      ],),
    ),
          const SizedBox(height: 20,),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                boxShadow: [BoxShadow(blurRadius: 10.0)]
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      
                      decoration: BoxDecoration(
                        color:Color.fromARGB(255, 74, 150, 173),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      width: 0.05.sw,
                      height: 0.05.sh,
                      child: Row(
                       
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
      Text(datalist[index]["time"],style: TextStyle(color: Colors.white,fontSize: 18),),
      Text(datalist[index]["subject"],style: TextStyle(color: Colors.white,fontSize: 18),),
      Text(datalist[index]["RoomNo."],style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 18),),
    ],),
                    ),
                  );
                },
                itemCount: datalist.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
}
} 