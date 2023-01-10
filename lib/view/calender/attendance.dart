import 'dart:convert';
import 'dart:math';
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/attendance_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:date_format/date_format.dart';
import 'package:jiffy/jiffy.dart';
class Attendance extends StatefulWidget {

  @override
  _AttendanceState createState() => new _AttendanceState();
}
var  lengthchart=0.0;
 var  length=0.0;
List<DateTime> absentDates = [
  DateTime(2022, 1,4),
  DateTime(2022, 11, 7),
  DateTime(2022, 11, 8),
  DateTime(2022, 11, 12),
  DateTime(2022, 11, 13),
  DateTime(2022, 11, 14),
  DateTime(2022, 11, 16),
  DateTime(2022, 11, 17),
  DateTime(2022, 11, 18),
  DateTime(2022, 11, 19),
  DateTime(2022, 12, 20),
];

class _AttendanceState extends State<Attendance> {


  final AttendanceController studentattendance = Get.put(AttendanceController());
// var dateapi;
  var date;
 //  late final outputFormat;
 //  late String title;
 //  var allsplit;
  var id;
  var company_key;
  final index=0;
 var year;
 var month;
 var days;

  var test;


// var AttendanceControllerList;


  // late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
 // late DateTime dateTime = dateFormat.parse(date);
  // DateTime _currentDate2 = DateTime.now();
  var dt = DateTime.now();
  var box = Hive.box("schoolData");

  // static get dateFormat => 'yyyy,MM,dd';
  List <dynamic> AttendanceControllerList = [];
  List<dynamic> presentDates = [

  ];

  // late double datelength=0.0;
  List<_ChartData>  data = [
  // _ChartData('Feb', 25, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('Mar', 31, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('Apr', 0, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('May', 0, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('Jun', 0, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('Jul', 0, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('Aug', 0, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('Spt', 0, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('Oct', 0, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('Nov', 0, Color.fromRGBO(37, 171, 29, 1.0)),
  // _ChartData('Dec', 0, Color.fromRGBO(37, 171, 29, 1.0)),
  ];
  @override
  void initState() {
    print("444444");
    print(presentDates);


    _tooltip = TooltipBehavior(enable: true);

    id = box.get("student_id");
    company_key = box.get("company_key");

    Attendanceapi("2022","12", id ,company_key);

    // date=box.get("date");

    // AttendanceControllerList=box.get("AttendanceControllerList");

    // print(AttendanceControllerList);

     // print(absentDates);
    // print(DateTime(2022, 1,4),);
   //  allsplit=date.toString().split("-");
   //  print(allsplit);
   //  dateapi=allsplit.join(", ");
   // print(dateapi);

    // var a = Jiffy(DateTime(int.parse(date))).yMMMMd;
    // print(year);
    // print(month);
    // print(days);
   // print(dateapi.days);
   // print(dateapi.year);
   // print(dateapi.month);

    // var formattedDate = DateTime.parse(dateapi);
    // print(formattedDate);
    // int? test = int.parse(dateapi);
    //
    // print("$test");

  // outputFormat = DateFormat('yy,M,d').format(date);
  //   print(formatDate(DateTime((int.parse(date.toString()))), [yyyy, ',', mm, ',', dd]));

// print(dateTime);
    // DateTime outputFormat = DateFormat('y,MM,dd').parse(date);
    // print(date);
    // print(title);
// print(outputFormat);

    // presentDates.add(DateTime(year,month,days));

    // title=box.get("title");




    super.initState();

  }

  Widget _presentIcon(String day,String title) => ClipRect(

    // color: Colors.green,
    child: Container(
      height: 0.40.sh,
      width: 0.40.sw,
      alignment: Alignment.center,
      color: title=="Present"?Colors.green:title=="Holiday"?Colors.grey:title=="Late"?Colors.yellow:title=="HalfDay"?Colors.lightBlueAccent:Colors.red,
      child: Text(
        day,
        style: TextStyle(
          color: Colors.white,

        ),
      ),
    ),
  );
  static Widget _absentIcon(String day) => CircleAvatar(
    backgroundColor: Colors.red,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  late CalendarCarousel _calendarCarouselNoHeader;
double count=0.0;
// late String months=presentDates[0]["date"];

  // var len = min(absentDates.length, presentDates.length);
  // late double cHeight;
void markedDatedMap(){
  if (presentDates[0]["title"]=="Present"){

    count+=presentDates[0]["title"].length.toDouble();
    print("3333ffff");
    print(count);
  }
  var a = Jiffy(DateTime(2019, 10, 18)).month.toString();
  print("444ddddddddd");
  print(a);
  for (int i = 0; i <presentDates.length; i++) {
   print("4ggddc");
    // print(presentDates[i]["title"].length.toDouble());
   late String monthconvert='${DateFormat('MMMM').format(DateFormat("yyyy-MM-dd").parse(presentDates[i]["date"]))}';
   print(monthconvert);

   data.add( _ChartData(monthconvert,count, Color.fromRGBO(37, 171, 29, 1.0)));
print("44aaaa4333");
// print(month);

    print(length);
// if(length==0){
//   lengthchart=double.parse(length.toString());
// }


    _markedDateMap.add(
      DateFormat("yyyy-MM-dd").parse(presentDates[i]["date"]),

      Event(
        date:DateFormat("yyyy-MM-dd").parse(presentDates[i]["date"]),
        title: 'Event 5',
        icon: _presentIcon(
            DateFormat("yyyy-MM-dd").parse(presentDates[i]["date"]).day.toString(),presentDates[i]["title"]
          // presentDates[i].date.day.toString(),
        ),
      ),
    );
  }

  // for (int i = 0; i < absentDates.length; i++) {
  //   _markedDateMap.add(
  //     absentDates[i],
  //     new Event(
  //       date: absentDates[i],
  //       title: 'Event 5',
  // fo
  //       icon: _absentIcon(
  //         absentDates[i].day.toString(),
  //       ),
  //     ),
  //   );
  // }
  setState(() {
    print(_markedDateMap);
  });
}
  void Attendanceapi(year, month, id,
      company_key) async {
    var body = json.encode({
      "company_key": company_key,
      "student_id": id,
      "month": month,
      "year": year,
    });
    print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.attendanceUrl);
    var response = await http.post(urlapi, body: body);
    if (response.statusCode == 200) {
      var sdata = jsonDecode(response.body);

      AttendanceControllerList = [];
      AttendanceControllerList.add(sdata);
      print(AttendanceControllerList);
      if (sdata["status"] == true) {
        print("massage");
        var box = Hive.box("schoolData");

      }
      else {
        print("invalid cccid");
      }
      addcalendardata();

    }
    else {
      print("School ID Invailid");
    }
  }
  void addcalendardata(){
  print("ddd");
  print(AttendanceControllerList[0]["response"].length);

    for(var i=0; i<AttendanceControllerList[0]["response"].length; i++){

      presentDates.add(
         {
           "date": AttendanceControllerList[0]["response"][i]["date"],
           "title": AttendanceControllerList[0]["response"][i]["title"]
         }

          );
    }
    setState(() {
     print(presentDates);
      markedDatedMap();
    });
  }
  @override
  Widget build(BuildContext context) {
    // cHeight = MediaQuery.of(context).size.height;


    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: 0.56.sh,
      // height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      todayButtonColor: Colors.blue,

      markedDatesMap: _markedDateMap,
      daysHaveCircularBorder: false,
      markedDateShowIcon: true,
      showOnlyCurrentMonthDate: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:

      null,
      thisMonthDayBorderColor: Color.fromARGB(255, 206, 204, 204),// null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return Scaffold(
      appBar: AppBar(

        backgroundColor:AgentColor.appbarbackgroundColor,
        title: Text('Student Atendance',style: MyGoogeFont.mydmSans),

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Container(
              height: 0.25.sh,

              child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryXAxis: CategoryAxis(
                    majorGridLines: MajorGridLines(width: 0),


                    axisLine: AxisLine(width: 0),

                  ),

                  primaryYAxis: NumericAxis(minimum: 0, maximum: 31, interval: 5,  numberFormat: NumberFormat.compact(),  majorGridLines: MajorGridLines(width: 0),

                    axisLine: AxisLine(width: 0), ),
                  tooltipBehavior: _tooltip,

                  series: <ChartSeries<_ChartData, String>>[
                    // for(var i=5; i<data.length; i++)
                    ColumnSeries<_ChartData, String>(

                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      name: 'Gold',
                      pointColorMapper: (_ChartData data, _) => data.color,
                      // dataLabelSettings: DataLabelSettings(isVisible: true)
                    )

                  ]),
            ),
            Container(
              height: 0.60.sh,
              child: Card(margin: EdgeInsets.only(left: 16.0, right: 16.0,).r,child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),  topRight: Radius.circular(10)),),

                    height: 0.0035.sh,

                  ) ,
          Container(margin: EdgeInsets.symmetric(horizontal: 16.0).r,
                  child: _calendarCarouselNoHeader),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          color: Colors.green),

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
                          color: Colors.yellow),
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
                          color: Colors.orange),
                      Container(
                        child: Text("HalfDay",style: GoogleFonts.dmSans(
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
            // markerRepresent(Colors.red, "Absent"),
            // markerRepresent(Colors.green, "Present"),
          ],
        ),
      ),
    );
  }
  void loadingalldata() {
    // year = Jiffy(studentattendance.AttendanceControllerList[0]["response"][0]["date"]).year;
    // month=Jiffy(date).month;
    // days=Jiffy(date).date;
    // print(date);
    // var box = Hive.box("schoolData");
    // print("5555555555555555555555555555554444444444444");
    //
    //
    // box.put("date",AttendanceControllerList[0]["response"][0]["date"]);


    // box.put("title",AttendanceControllerList[0]["response"][0]["title"]);
    // box.put("AttendanceControllerList",AttendanceControllerList);
  }}
  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: 0.022.sh,
      ),
      title: new Text(
        data,
      ),
    );
  }


class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final Color? color;
  final String x;
  final double y;
}