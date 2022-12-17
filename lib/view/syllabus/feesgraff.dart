import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';
class FeesGraff extends StatefulWidget {
  const FeesGraff({Key? key}) : super(key: key);

  @override
  State<FeesGraff> createState() => _FeesGraffState();
}

class _FeesGraffState extends State<FeesGraff> {
  Map<String, double> dataMap = {
    "Due Fees": 20.5,
    "Paid  Fees": 35.5,

  };
  // final gradientList = <List<Color>>[
  //   [
  //     Color.fromRGBO(223, 250, 92, 1),
  //     Color.fromRGBO(129, 250, 112, 1),
  //   ],
  //   [
  //     Color.fromRGBO(129, 182, 205, 1),
  //     Color.fromRGBO(91, 253, 199, 1),
  //   ],
  //   [
  //     Color.fromRGBO(175, 63, 62, 1.0),
  //     Color.fromRGBO(254, 154, 92, 1),
  //   ]
  // ];
 final colorList = <Color>[
  Color.fromRGBO(245, 10, 45, 1.0),
   Color.fromRGBO(37, 171, 29, 1.0)

  ];


  ChartType? _chartType = ChartType.disc;
  bool _showCenterText = true;

  double? _chartLegendSpacing = 12;

  bool _showLegendsInRow = true;
  bool _showLegends = true;


  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = false;
  bool _showChartValuesOutside = false;

  bool _showGradientColors = false;


  LegendPosition? _legendPosition = LegendPosition.bottom;

  int key = 0;
 final index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff8DD0E5),
        title: Text("Fees Status"),
      ),



    body: Column(
        children: [
          PieChart(dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: _chartLegendSpacing!,
            chartRadius: MediaQuery.of(context).size.width / 2.5,
            initialAngleInDegree: -50,
            chartType: ChartType.disc,

            legendOptions: LegendOptions(
              showLegendsInRow: _showLegendsInRow,
              legendPosition: _legendPosition!,
              showLegends: _showLegends,

legendShape:BoxShape.rectangle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),

              ),
            chartValuesOptions:  const ChartValuesOptions(
              decimalPlaces: 0,
              showChartValueBackground: true,
              showChartValues: false,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,

chartValueBackgroundColor: Colors.teal

            ),
            colorList: colorList,
            baseChartColor: Colors.transparent,
            // gradientList: gradientList,
            emptyColorGradient: [
              Color(0xff6c5ce7),
              Colors.blue,

            ],

          ),

        ],
      ),
    );
  }
}
