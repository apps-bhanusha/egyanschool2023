import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuildCalender extends StatefulWidget {
  @override
  _BuildCalenderState createState() => _BuildCalenderState();
}

class _BuildCalenderState extends State<BuildCalender> {
// Initial Selected Value
  String _currentItemSelected = "October 2022";

// List of items in our dropdown menu
  var _calendar = [
    "October 2022",
    'September 2022',
  ];

  final month = DateTime.now().month;
  final day = DateTime.now().day;
  final year = DateTime.now().year;
  final days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
@override
  void initState() {
    print(month);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final start = difference();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bhanusha app"),
      ),
      body: SafeArea(
        child: Card(
          child: Container(
            height: 0.50.sh,
            margin: EdgeInsets.all(5),
            width: double.infinity,
            child: Column(
              children: [

                FutureBuilder(
                  builder: (context, items) {
                    if (items.hasData) {
                      return BuildCalender();
                    }

                    return Container(
                      // color: Color.fromARGB(255, 243, 229, 33),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Sun'),
                              Text('Mon'),
                              Text('Tue'),
                              Text('Wed'),
                              Text('Thu'),
                              Text('Fri'),
                              Text('Sat'),
                            ],
                          ),
                          Container(
                            child: GridView.builder(
                              shrinkWrap: true,

                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7),
                              itemBuilder: (context, index) {
                                if (index < start) {
                                  return Container();
                                }
                                return Container(
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(0.0),
                                      color: Color.fromARGB(
                                          255, 221, 217, 217),
                                      border: Border.all(
                                          color: Colors.grey
                                              .withOpacity(0.4))),
                                  child: Text('${index + 1 - start}'),
                                );
                              },
                              itemCount: (month == 1
                                  ? checkYear(year)
                                  ? days[month - 1] + 1
                                  : days[month - 1]
                                  : days[month - 1]) +
                                  start,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  int difference() {
    String date = DateTime.now().toString();
    String firstDay = date.substring(0, 7) + '01' + date.substring(10);
    int weekDay = DateTime.parse(firstDay).weekday;
    if (weekDay == 7) {
      return 0;
    }
    return weekDay;
  }

  bool checkYear(int year) {
    if (year % 400 == 0) return true;
    if (year % 100 == 0) return false;
    if (year % 4 == 0) return true;
    return false;
  }
}