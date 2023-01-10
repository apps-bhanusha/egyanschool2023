
//////////////////////////////////////////////

// import 'package:ecom_desgin/controller/attendance_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// class Attendance extends StatefulWidget {
//
//   @override
//   _AttendanceState createState() => _AttendanceState();
// }
//
// class _AttendanceState extends State<Attendance> {
//   final AttendanceController studentattendance = Get.put(AttendanceController());
//   late final date;
//   late String title;
//   var id;
//   var company_key;
//   // final colorList = <Color>[
//   //   Color.fromRGBO(245, 67, 44, 1.0),
//   //   Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //   // Color.fromRGBO(37, 171, 29, 1.0),
//   //
//   // ];
//
//   final index=0;
//   late List<_ChartData> data;
//   late TooltipBehavior _tooltip;
//   DateTime _currentDate = DateTime.now();
//   DateTime _currentDate2 = DateTime.now();
//   String _currentMonth = DateFormat.yMMM().format(DateTime.now());
//   DateTime _targetDateTime = DateTime.now();
//
//   late CalendarCarousel _calendarCarouselNoHeader;
//
//   // static final Widget _eventIcon = Container(
//   //   decoration: BoxDecoration(
//   //       color: Colors.indigo,
//   //       borderRadius: BorderRadius.all(Radius.circular(1000)).r,
//   //       border: Border.all(color: Colors.blue, width: 2.0)),
//   //   child: const Icon(
//   //     Icons.person,
//   //     color: Colors.amber,
//   //   ),
//   // );
//   var mark_icon = Container(
//
//     color: Colors.green,
//     height: 0.50.sh,
//     width: 0.50.sw,
//   );
//   // var mark_icon1 = Container(
//   //
//   //   color: Colors.green,
//   //   height: 0.50.sh,
//   //   width: 0.50.sw,
//   // );
//   final EventList<Event> _markedDateMap = EventList<Event>(
//     events: {
//       DateTime(2022, 12, 12): [
//         Event(
//           date: DateTime(2022, 12, 12),
//           title: 'halfday',
//           icon: Text("12",   style: GoogleFonts.dmSans(
//             fontStyle: FontStyle.normal,
//             fontSize: 10.sp,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),),
//           dot: Container(
//             margin: EdgeInsets.symmetric(horizontal: 2.0,vertical: 2.0),
//             color: Colors.red,
//             height: 25.0,
//             width: 25.0,
//           ),
//         ),
//         //  Event(
//         //   date: DateTime(2020, 2, 10),
//         //   title: 'Event 2',
//         //   icon: _eventIcon,
//         // ),
//         // Event(
//         //   date: DateTime(2020, 2, 15),
//         //   title: 'Event 3',
//         //   icon: _eventIcon,
//         // ),
//       ],
//     },
//   );
//   var dt = DateTime.now();
//   var box = Hive.box("schoolData");
//
//   @override
//   void initState() {
//
//     id = box.get("student_id");
//     company_key = box.get("company_key");
//     studentattendance.Attendanceapi("2022","12", id ,company_key);
//     date=box.get("date");
//     title=box.get("title");
//     data = [
//       _ChartData('Jan', 8, Color.fromRGBO(245, 67, 44, 1.0)),
//       _ChartData('Feb', 25, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('Mar', 31, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('Apr', 0, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('May', 0, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('Jun', 0, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('Jul', 0, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('Aug', 0, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('Spt', 0, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('Oct', 0, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('Nov', 0, Color.fromRGBO(37, 171, 29, 1.0)),
//       _ChartData('Dec', 0, Color.fromRGBO(37, 171, 29, 1.0)),
//
//     ];
//
//     _tooltip = TooltipBehavior(enable: true);
//     _markedDateMap.add(
//
//         DateTime(21,12,2022),
//         Event(
//           date: DateTime.parse(date??""),
//           title:title,
//           icon: mark_icon,
//
//         ));
//
//     // _markedDateMap.add(
//     //     DateTime(studentattendance.AttendanceControllerList[0]["response"][1]["date"]),
//     //     Event(
//     //       date: DateTime(studentattendance.AttendanceControllerList[0]["response"][0]["date"]),
//     //       title: studentattendance.AttendanceControllerList[0]["response"][0]["title"],
//     //       icon: _eventIcon,
//     //     ));
//
//     // _markedDateMap.addAll(DateTime(2019, 2, 11), [
//     //   Event(
//     //     date: DateTime(2019, 2, 11),
//     //     title: 'Event 1',
//     //     icon: _eventIcon,
//     //   ),
//     //   Event(
//     //     date: DateTime(2019, 2, 11),
//     //     title: 'Event 2',
//     //     icon: _eventIcon,
//     //   ),
//     //   Event(
//     //     date: DateTime(2019, 2, 11),
//     //     title: 'Event 3',
//     //     icon: _eventIcon,
//     //   ),
//     // ]);
//     super.initState();
//   }
//   String dropdownvalue = 'Select your Address';
//   String area = 'Select your Area';
//
//   int _currentIndex = 0;
//   late PageController _pageController;
//   // List of items in our dropdown menu
//
//
//   @override
//   Widget build(BuildContext context) {
//     _calendarCarouselNoHeader = CalendarCarousel<Event>(
//       todayBorderColor: Colors.green,
//
//
//       onDayPressed: (DateTime date, List<Event> events) {
//         this.setState(() => _currentDate2 = date);
//         events.forEach((event) => print(event.title));
//       },
//       dayButtonColor:  const Color.fromARGB(255, 206, 204, 204),
//       daysHaveCircularBorder: false,
//       showOnlyCurrentMonthDate: true,
//
//       weekendTextStyle: const TextStyle(
//         color: Colors.red,
//       ),
//       thisMonthDayBorderColor: Color.fromARGB(255, 206, 204, 204),
//       weekFormat: false,
//       // firstDayOfWeek: 4,
//
//       markedDatesMap: _markedDateMap,
//       height: 0.50.sh,
//       weekDayBackgroundColor: Colors.white,
//       weekdayTextStyle:  GoogleFonts.dmSans(
//         fontStyle: FontStyle.normal,
//         fontSize:12.sp,
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//
//       ),
//
//       selectedDateTime: _currentDate2,
//       targetDateTime: _targetDateTime,
//       // customGridViewPhysics: NeverScrollableScrollPhysics(),
//       // markedDateCustomShapeBorder:
//       // const CircleBorder(side: BorderSide(color: Colors.white)),
//       // markedDateCustomTextStyle:  TextStyle(
//       //   fontSize: 18.sp,
//       //   color: Colors.black,
//       // ),
//       showHeader: true,
//       todayTextStyle: const TextStyle(
//         color: Colors.black,
//       ),
//
//       todayButtonColor: Colors.red,
//       selectedDayTextStyle: const TextStyle(
//         color: Colors.yellow,
//       ),
//       minSelectedDate: _currentDate.subtract(Duration(days: 360)),
//       maxSelectedDate: _currentDate.add(Duration(days: 360)),
//       prevDaysTextStyle: TextStyle(
//         fontSize: 16.sp,
//         color: Colors.pinkAccent,
//       ),
//       inactiveDaysTextStyle: TextStyle(
//         color: Colors.tealAccent,
//         fontSize: 16.sp,
//       ),
//       onCalendarChanged: (DateTime date) {
//         this.setState(() {
//           _targetDateTime = date;
//           _currentMonth = DateFormat.yMMM().format(_targetDateTime);
//
//
//         });
//       },
//       onDayLongPressed: (DateTime date) {
//         print('long pressed date $date');
//
//       },
//
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Row(
//           children: [
//             Container(
//               child: Text(
//                 'EGYAN Demo school',
//                 style: GoogleFonts.dmSans(
//                   fontStyle: FontStyle.normal,
//                   fontSize:15.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.redAccent,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 26).r,
//               child: Column(
//                 children: [
//                   Container(
//                     child: Text(
//                       'Session',
//                       style: GoogleFonts.dmSans(
//                         fontStyle: FontStyle.normal,
//                         fontSize:12.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       '2020-21',
//                       style: GoogleFonts.dmSans(
//                         fontStyle: FontStyle.normal,
//                         fontSize:12.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           PopupMenuButton<int>(
//             itemBuilder: (context) {
//               return <PopupMenuEntry<int>>[
//                 const PopupMenuItem(child: Text('0'), value: 0),
//                 const PopupMenuItem(child: Text('1'), value: 1),
//               ];
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(right: 150).r,
//                 child: Text(
//                   'Student Atendance',
//                   style: GoogleFonts.dmSans(
//                     fontStyle: FontStyle.normal,
//                     fontSize:15.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 0.25.sh,
//
//                 child: SfCartesianChart(
//                     plotAreaBorderWidth: 0,
//                     primaryXAxis: CategoryAxis(
//                       majorGridLines: MajorGridLines(width: 0),
//
//
//                       axisLine: AxisLine(width: 0),
//
//                     ),
//
//                     primaryYAxis: NumericAxis(minimum: 0, maximum: 31, interval: 5,  numberFormat: NumberFormat.compact(),  majorGridLines: MajorGridLines(width: 0),
//
//                       axisLine: AxisLine(width: 0), ),
//                     tooltipBehavior: _tooltip,
//
//                     series: <ChartSeries<_ChartData, String>>[
//                       // for(var i=5; i<data.length; i++)
//                       ColumnSeries<_ChartData, String>(
//
//                         dataSource: data,
//                         xValueMapper: (_ChartData data, _) => data.x,
//                         yValueMapper: (_ChartData data, _) => data.y,
//                         name: 'Gold',
//                         pointColorMapper: (_ChartData data, _) => data.color,
//                         // dataLabelSettings: DataLabelSettings(isVisible: true)
//                       )
//
//                     ]),
//               ),
//
//               Card(
//                 elevation: 10,
//                 // margin: EdgeInsets.only(
//                 //
//                 //   bottom: 16.0,
//                 //   left: 16.0,
//                 //   right: 16.0,
//                 // ),
//                 child: Row(
//                   children: const <Widget>[
//                     // Expanded(
//                     //     child: Text(
//                     //       _currentMonth,
//                     //       style: TextStyle(
//                     //         fontWeight: FontWeight.bold,
//                     //         fontSize: 24.0,
//                     //       ),
//                     //     )),
//                     // ElevatedButton(
//                     //   child: Text('PREV'),
//                     //   onPressed: () {
//                     //     setState(() {
//                     //       _targetDateTime = DateTime(
//                     //           _targetDateTime.year, _targetDateTime.month - 1);
//                     //       _currentMonth =
//                     //           DateFormat.yMMM().format(_targetDateTime);
//                     //     });
//                     //   },
//                     // ),
//                     // ElevatedButton(
//                     //   child: Text('NEXT'),
//                     //   onPressed: () {
//                     //     setState(() {
//                     //       _targetDateTime = DateTime(
//                     //           _targetDateTime.year, _targetDateTime.month + 1);
//                     //       _currentMonth =
//                     //           DateFormat.yMMM().format(_targetDateTime);
//                     //     });
//                     //   },
//                     // )
//                   ],
//                 ),
//
//               ),
//               Container(
//                 height: 0.55.sh,
//                 child: Card(margin: EdgeInsets.only(left: 16.0, right: 16.0,).r,
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.lightBlueAccent,
//                           borderRadius: BorderRadius.only(topLeft: Radius.circular(10),  topRight: Radius.circular(10)),),
//
//                         height: 0.0035.sh,
//
//                       ) ,
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 16.0).r,
//                         child: _calendarCarouselNoHeader,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                               height: 15,
//                               width: 15,
//                               color: Colors.red),
//                           Container(
//                             child: Text("Absent",style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize:12.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.lightBlueAccent,
//                             ),),
//                           ),
//                           Container(
//                               height: 15,
//                               width: 15,
//                               color: Colors.black),
//
//                           Container(
//                             child: Text("Present",style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize:12.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.lightBlueAccent,
//                             ),),
//                           ),
//                           Container(
//                               height: 15,
//                               width: 15,
//                               color: Colors.grey),
//                           Container(
//                             child: Text("Late",style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize:12.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.lightBlueAccent,
//                             ),),
//                           ),
//                           Container(
//                               height: 15,
//                               width: 15,
//                               color: Colors.lightBlue),
//                           Container(
//                             child: Text("Half Day",style: GoogleFonts.dmSans(
//                               fontStyle: FontStyle.normal,
//                               fontSize:12.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.lightBlueAccent,
//                             ),),
//                           ),
//                           Container(
//                               height: 15,
//                               width: 15,
//                               color: Colors.yellow),
//                           Container(
//                             child: Text("Holiday",
//                               style: GoogleFonts.dmSans(
//                                 fontStyle: FontStyle.normal,
//                                 fontSize:12.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.lightBlueAccent,
//                               ),),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                 ),
//               ),
// // Container(child: Text("Record Not available", style: GoogleFonts.dmSans(
// //   fontStyle: FontStyle.normal,
// //   fontSize:12.sp,
// //   fontWeight: FontWeight.bold,
// //   color: Colors.lightBlueAccent,
// // ),),)
// //             for(var i=0; i<colorList.length-1; i++)
//
//
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
//
// }
// class _ChartData {
//   _ChartData(this.x, this.y,this.color);
//   final Color? color;
//   final String x;
//   final double y;
// }
