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
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Syllabus Status"),
      ),

      body: PieChart(dataMap: dataMap),
    );
  }
}
