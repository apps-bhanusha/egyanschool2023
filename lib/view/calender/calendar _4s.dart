import 'package:ecom_desgin/view/dashboard/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
class CalendarShow extends StatefulWidget {
  @override
  _CalendarShowState createState() => _CalendarShowState();
}

class _CalendarShowState extends State<CalendarShow> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  late CalendarCarousel _calendarCarouselNoHeader;

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
       DateTime(2022, 12, 12): [
         Event(
          date: DateTime(2022, 12, 12),
          title: 'halfday',
          icon: Icon(Icons.add_box),
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        //  Event(
        //   date: DateTime(2020, 2, 10),
        //   title: 'Event 2',
        //   icon: _eventIcon,
        // ),
        // Event(
        //   date: DateTime(2020, 2, 15),
        //   title: 'Event 3',
        //   icon: _eventIcon,
        // ),
      ],
    },
  );

  @override
  void initState() {
    _markedDateMap.add(
        new DateTime(2020, 2, 25),
        new Event(
          date: new DateTime(2020, 2, 25),
          title: 'Event 5',
          icon: _eventIcon,

        ));

    _markedDateMap.add(
        new DateTime(2020, 2, 10),
        new Event(
          date: new DateTime(2020, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(new DateTime(2019, 2, 11), [
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }
  String dropdownvalue = 'Select your Address';
  String area = 'Select your Area';

  int _currentIndex = 0;
  late PageController _pageController;
  // List of items in our dropdown menu


  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,


      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      dayButtonColor:  Color.fromARGB(255, 206, 204, 204),
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: true,

      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Color.fromARGB(255, 206, 204, 204),
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 380.0,
      weekDayBackgroundColor: Colors.white,
      weekdayTextStyle:  GoogleFonts.dmSans(
      fontStyle: FontStyle.normal,
      fontSize:12.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,

    ),

      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
      const CircleBorder(side: BorderSide(color: Colors.white)),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      showHeader: true,
      todayTextStyle: const TextStyle(
        color: Colors.black,
      ),

      todayButtonColor: Colors.red,
      selectedDayTextStyle: const TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: const TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);


        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');

      },

    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Row(
            children: [
              Container(
                child: Text(
                  'EGYAN Demo school',
                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize:15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26).r,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'Session',
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize:12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '2020-21',
                        style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize:12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) {
                return <PopupMenuEntry<int>>[
                  const PopupMenuItem(child: Text('0'), value: 0),
                  const PopupMenuItem(child: Text('1'), value: 1),
                ];
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(right: 150).r,
                child: Text(
                  'Student Atendance',
                  style: GoogleFonts.dmSans(
                    fontStyle: FontStyle.normal,
                    fontSize:18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Card(
elevation: 10,
                // margin: EdgeInsets.only(
                //
                //   bottom: 16.0,
                //   left: 16.0,
                //   right: 16.0,
                // ),
                child: Row(
                  children: const <Widget>[
                    // Expanded(
                    //     child: Text(
                    //       _currentMonth,
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 24.0,
                    //       ),
                    //     )),
                    // ElevatedButton(
                    //   child: Text('PREV'),
                    //   onPressed: () {
                    //     setState(() {
                    //       _targetDateTime = DateTime(
                    //           _targetDateTime.year, _targetDateTime.month - 1);
                    //       _currentMonth =
                    //           DateFormat.yMMM().format(_targetDateTime);
                    //     });
                    //   },
                    // ),
                    // ElevatedButton(
                    //   child: Text('NEXT'),
                    //   onPressed: () {
                    //     setState(() {
                    //       _targetDateTime = DateTime(
                    //           _targetDateTime.year, _targetDateTime.month + 1);
                    //       _currentMonth =
                    //           DateFormat.yMMM().format(_targetDateTime);
                    //     });
                    //   },
                    // )
                  ],
                ),

              ),
              Container(
                height: 0.68.sh,
                child: Card(
                  margin: EdgeInsets.only(

bottom: 30.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),  topRight: Radius.circular(10)),),

                        height: 0.0070.sh,

                      ) ,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.0).r,
                        child: _calendarCarouselNoHeader,
                      ),
                      Row(
mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.red),
                          Container(
                              child: Text("Absent",style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent,
                              ),),
                             ),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.black),

              Container(
                child: Text("Present",style: GoogleFonts.dmSans(
                  fontStyle: FontStyle.normal,
                  fontSize:12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),),
              ),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.grey),
                          Container(
                            child: Text("Late",style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize:12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),),
                          ),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.lightBlue),
                          Container(
                            child: Text("Half Day",style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize:12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),),
                          ),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.yellow),
                          Container(
                            child: Text("Holiday",
                              style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent,
                              ),),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
              ),
Container(child: Text("Record Not available", style: GoogleFonts.dmSans(
  fontStyle: FontStyle.normal,
  fontSize:12.sp,
  fontWeight: FontWeight.bold,
  color: Colors.lightBlueAccent,
),),)

            ],
          ),
        ),
   
    );
  }
}
