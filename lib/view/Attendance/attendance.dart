import 'dart:async';
import 'dart:convert';

import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/attendance_controller.dart';
import 'package:ecom_desgin/controller/monthly_present_summary_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:pull_to_refresh/pull_to_refresh.dart';
class Attendance extends StatefulWidget {

  @override
  _AttendanceState createState() => new _AttendanceState();
}
var  lengthchart=0.0;
var  length=0.0;
// List<DateTime> absentDates = [
//   DateTime(2022, 1,4),
//   DateTime(2022, 11, 7),
//   DateTime(2022, 11, 8),
//   DateTime(2022, 11, 12),
//   DateTime(2022, 11, 13),
//   DateTime(2022, 11, 14),
//   DateTime(2022, 11, 16),
//   DateTime(2022, 11, 17),
//   DateTime(2022, 11, 18),
//   DateTime(2022, 11, 19),
//   DateTime(2022, 12, 20),
// ];

class _AttendanceState extends State<Attendance> {


  final AttendanceController studentattendance = Get.put(AttendanceController());
  MonthlyPresentSummaryController monthlypresentssummary = Get.put(MonthlyPresentSummaryController());
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);


// var dateapi;
  var date;
  //  late final outputFormat;
  //  late String title;
  //  var allsplit;

  var id;
var student_id;
var company_key;
  final index=0;
  var year;
  var month;
  var days;
  late String present;
  late String months;
  var test;
  bool getyear=false;
  int formattedString=DateTime.now().year;
  DateTime now = new DateTime.now();
  late String g = ('${now.year},${now.month}');
  late int month1=now.month;
  late int year1=now.year;
// var AttendanceControllerList;
  RxBool loadingmonthlyattendence =false.obs;

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
  ];
  @override
  void initState() {

    _tooltip = TooltipBehavior(enable: true);


    student_id = box.get("student_id");
   company_key = box.get("company_key");
    monthlypresentssummary.MonthlyPresentSummaryapi(studentProfileController.studentProfileModel.value?.response.studentId,company_key);
    Attendanceapi(studentProfileController.studentProfileModel.value?.response.studentId ,company_key);



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

    child: title!=""?Container(
      height: 0.40.sh,
      width: 0.40.sw,
      alignment: Alignment.center,
      color: title=="Present"?Colors.green:title=="Holiday"?Colors.grey:title=="Late"?Colors.yellow:title=="Half Day"?Colors.orange:Color.fromARGB(255, 206, 204, 204),
      child: Text(
        day,
        style: TextStyle(
          color: Colors.white,

        ),
      ),
    ):Container(),
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
    print("sssss");

    // data.add( _ChartData(months,present, Color.fromRGBO(37, 171, 29, 1.0)));


    // for (var s=0; s<monthlypresentssummary.MonthlyPresentSummaryControllerList[0]["response"].length;s++)
    // if (monthlypresentssummary.MonthlyPresentSummaryControllerList[0]["response"][s]["present"]=="Present"){
    //
    //   count+=monthlypresentssummary.MonthlyPresentSummaryControllerList[0]["response"][s]["present"].length.toDouble();
    //   print("3333ffff");
    //   print(count);
    //   late String monthconvert='${DateFormat('MMMM').format(DateFormat("yyyy-MM-dd").parse(monthlypresentssummary.MonthlyPresentSummaryControllerList[0]["response"][s]["month"]))}';
    //   print(monthconvert);
    //
    //   data.add( _ChartData(monthconvert,count, Color.fromRGBO(37, 171, 29, 1.0)));
    // }

    var a = Jiffy(DateTime(2019, 10, 18)).month.toString();
    print("444ddddddddd");
    print(a);
    monthlypresentssummary.monthlyPresentSummaryModel.value?.response.forEach((element) {
     var   present1=element.present.toString();
      data.add(_ChartData(element.month.toString(),present1=="null" ?0.0:double.parse(present1),
        const Color.fromRGBO(37, 171, 29, 1.0)));
    });
//   for (int i = 0; i <
//       monthlypresentssummary.MonthlyPresentSummaryControllerList[0]["response"]
//           .length; i++) {
// //     print( monthlypresentssummary.MonthlyPresentSummaryControllerList[0]["response"]
// //         .length);
// // print(monthlypresentssummary
// //     .MonthlyPresentSummaryControllerList[0]["response"][i]["present"]);
// //
// //     double present =monthlypresentssummary
// //         .MonthlyPresentSummaryControllerList[0]["response"][i]["present"] ?? 0.0;
// //     print(present.runtimeType);
// //     print(present);
//
//     // months = monthlypresentssummary
//     //     .MonthlyPresentSummaryControllerList[0]["response"][i]["month"];
//     data.add(_ChartData(monthlypresentssummary
//             .MonthlyPresentSummaryControllerList[0]["response"][i]["month"].toString(),5.5,
//         const Color.fromRGBO(37, 171, 29, 1.0)));
//   }

    for (int i = 0; i <presentDates.length; i++) {

// if(length==0){
//   lengthchart=double.parse(length.toString());
// }


      _markedDateMap.add(
        DateFormat("yyyy-MM-dd").parse(presentDates[i]["date"]),

        Event(
          date:DateFormat("yyyy-MM-dd").parse(presentDates[i]["date"]),
          title: "event 5",
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



  void Attendanceapi(student_id,company_key) async {
    var body = json.encode({
      "company_key": company_key,
      "student_id": student_id,

    });
    print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
    print(body);
    final urlapi = Uri.parse(ApiUrl.baseUrl + ApiUrl.monthlyattendenceUrl);
    var response = await http.post(urlapi, body: body);
    print(response);
    if (response.statusCode == 200) {
      var sdata = jsonDecode(response.body);

      AttendanceControllerList = [];
      AttendanceControllerList.add(sdata);
      print(AttendanceControllerList);

      if (sdata["status"] == true) {
        print("Loading month");
        loadingmonthlyattendence.value=true;
        getyear=true;
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
  Widget build(BuildContext context)  {
    // cHeight = MediaQuery.of(context).size.height;
    _onRefresh() async {
      // await Future.delayed(Duration(milliseconds: 1000));
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>super.widget));
      // student_id = box.get("student_id");
      // company_key = box.get("company_key");
      // Attendanceapi(student_id ,company_key);
      // _refreshController.loadComplete();
      //
      // monthlypresentssummary.MonthlyPresentSummaryapi(student_id,company_key);

      setState(() {
        student_id = box.get("student_id");
        company_key = box.get("company_key");
        monthlypresentssummary.MonthlyPresentSummaryapi(student_id,company_key);
        Attendanceapi(student_id ,company_key);
      });
      Timer timer;

      timer = Timer.periodic(Duration(seconds: 3),(t){
        student_id = box.get("student_id");
        company_key = box.get("company_key");
        monthlypresentssummary.MonthlyPresentSummaryapi(student_id,company_key);
        Attendanceapi(student_id ,company_key);
      });
      return Future.delayed(
        Duration(seconds: 1),
      );
    }
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
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(


            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                SizedBox(
                  height: 0.25.sh,
                  child:SfCartesianChart(
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
                            dataSource:data,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
name:"",
                            pointColorMapper: (_ChartData data, _) => data.color,
                            // dataLabelSettings: DataLabelSettings(isVisible: true)
                          )
                        ]
                    ),
                  ),

                SizedBox(
                  height: 0.60.sh,
                  child: loadingmonthlyattendence.value?Card(margin: EdgeInsets.only(left: 16.0, right: 16.0,).r,child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),  topRight: Radius.circular(10)),),

                        height: 0.0035.sh,

                      ) ,

                   Container(
                     margin: EdgeInsets.symmetric(horizontal: 16.0).r,
                    child:_calendarCarouselNoHeader =  CalendarCarousel<Event>(
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
                      markedDateMoreShowTotal: true,
                      minSelectedDate:DateFormat("yyyy-MM-dd").parse( AttendanceControllerList[0]["year_date"]["start_date"]),
                      maxSelectedDate:DateFormat("yyyy-MM-dd").parse(AttendanceControllerList[0]["year_date"]["end_date"]),
                      thisMonthDayBorderColor: Color.fromARGB(255, 206, 204, 204),// null for not showing hidden events indicator
                      markedDateIconBuilder: (event) {
                        return event.icon;
                      },
                    ),
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.red),
                          Text("Absent",style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize:12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.green),

                          Text("Present",style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize:12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.yellow),
                          Text("Late",style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize:12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.orange),
                          Text("HalfDay",style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize:12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),),
                          Container(
                              height: 15,
                              width: 15,
                              color: Colors.grey),
                          Text("Holiday",
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize:12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),),
                        ],
                      ),
                    ],
                  ),

                  ):Center(child: CircularProgressIndicator()),
                ),
                // markerRepresent(Colors.red, "Absent"),
                // markerRepresent(Colors.green, "Present"),
              ],
            ),

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