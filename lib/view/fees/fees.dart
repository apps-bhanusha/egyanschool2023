import 'dart:async';

import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/fees_controller.dart';
import 'package:ecom_desgin/controller/getschoolsetting_controller.dart';
import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/controller/student_login_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:get/get.dart';
class Fees extends StatefulWidget {
  const Fees({Key? key}) : super(key: key);

  @override
  State<Fees> createState() => _FeesState();
}

class _FeesState extends State<Fees> {
  var schoolname;
  var session;
  var studentname;
  var studentclass;
  var studentsection;
  var studenttotalfees;
  var studentduefees;
  var studentpresent;
  var total_deposite_amount;
  var id;
  var company_key;
  var studentpro;
  var username;
  var password;
  bool dataMap1=false;
final UserNameController _allsetController = Get.put(UserNameController());
final FeeController all = Get.put(FeeController());
final GetSchoolSettingController _schoolsetting =
Get.put(GetSchoolSettingController());
  FeeController feeController=Get.put(FeeController());
  final StudentLoginUpdateController studentLoginUpdateControllers =Get.put( StudentLoginUpdateController());
  final StudentProfileController studentProfileController = Get.put(StudentProfileController());

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
  var box = Hive.box("schoolData");
  @override
  void initState() {
    studentname = box.get("studentname");
    studentclass = box.get("studentclass");
    studentsection = box.get("studentsection");
    studenttotalfees = box.get("studenttotalfees");
    studentduefees = box.get("studentduefees");
    studentpresent = box.get("studentpresent");
    total_deposite_amount = box.get("total_deposite_amount");

    schoolname = box.get("schoolname");
    session = box.get("session");
    id = box.get("student_id");
    company_key = box.get("company_key");

    print("CKECKCKCKCKCKKKCKCK");
    print(studentduefees);
    super.initState();
    feeController.loadingfees.value=false;
    feeController.Feesapi(studentProfileController.studentProfileModel.value?.response.studentId, company_key);
    studentpro=box.get("studentprofileimage");
    username = box.get("username");
    password =box.get("password");
    // studentLoginUpdateControllers.apicallpost(username,password);
  }
  // late Map<String, double> dataMap = {
  //   "Due Fees":double.parse('${ dataMap1?all.FeeControllerList[0]["response"]["total_balance_amount"]:dataMap}'),
  //   "Paid  Fees":double.parse('${(dataMap1?all.FeeControllerList[0]["response"]["total_amount"]-all.FeeControllerList[0]["response"]["total_balance_amount"]:dataMap)}'),
  //
  // };
  final colorList = <Color>[
    Color.fromRGBO(245, 10, 45, 1.0),
    Color.fromRGBO(37, 171, 29, 1.0)

  ];




  double? _chartLegendSpacing = 12;

  bool _showLegendsInRow = true;
  bool _showLegends = true;





  LegendPosition? _legendPosition = LegendPosition.bottom;

  int key = 0;
  final index=0;
  int _index=0;
  int s=0;
  String dropdownvalue = 'Select your Address';
  String area = 'Select your Area';

  int _currentIndex = 0;
  late PageController _pageController;
  // List of items in our dropdown menu
  var items = [
    'Mohan Sharma',
    'Mohan garase',
    'Shani patel',
    'Mohan kapoor',
    'Mohan panday',
  ];
  var items1 = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Scaffold(

        appBar: AppBar(
         backgroundColor: Theme.of(context).primaryColor,
          title: Text('Fees',style: MyGoogeFont.mydmSans),
        ),
        body:Obx(()=>
         feeController.loadingfees.value? SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 0.010.sh,),
                PieChart(dataMap: {
                  "Due Fees":double.parse('${all.FeeControllerList[0]["response"]["total_balance_amount"]}'),
                  "Paid  Fees":double.parse('${(all.FeeControllerList[0]["response"]["total_amount"]-all.FeeControllerList[0]["response"]["total_balance_amount"])}'),
                },
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: _chartLegendSpacing!,
                  chartRadius: MediaQuery.of(context).size.width / 2.5,
                  initialAngleInDegree: 0,
                  chartType: ChartType.disc,

centerTextStyle: const TextStyle(
  fontWeight: FontWeight.bold,
      color: Colors.white
),

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
                      showChartValueBackground: false,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: false,
chartValueStyle:TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white
) ,
                      chartValueBackgroundColor: Colors.white

                  ),
                  colorList: colorList,
                  // baseChartColor: Colors.white,
                  // gradientList: gradientList,
                  emptyColorGradient: [
                    Color(0xff6c5ce7),
                    Colors.blue,

                  ],

                ),


            Stack(
              children: [

                Container(
                  height: 0.60.sw,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        side: BorderSide(width: 0.001.sw, color: Colors.white60)),
                    child: Column(
                      children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),  topRight: Radius.circular(10)),),

                        height: 0.02.sh,

                      ) ,
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 100).r,
                          child: Container(
                            child:  Text(
                              '${studentProfileController.studentProfileModel.value?.response.name}',
                                // _allsetController.SchoolIdControllerList[0]["response"][0]["name"] ??"",
                                style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue),
                              ),
                            ),

                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30).r,
                              child: Container(

                                child:Transform.scale(
                                  scale: s == _index ?  2 : 2,
                                  // transform: Matrix4.identity(),

                                  child:  ClipRRect(
                                    // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                                    child:   CircleAvatar(
                                      radius: 20.0,
                                      backgroundImage:
                                      NetworkImage('${ApiUrl.imagesUrl.toString()}${studentProfileController.studentProfileModel.value?.response.profileimage}'),
                                    ),
                                  ),
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40).r,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Class',
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize:15.sp,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Section',
                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize:15.sp,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 150).r,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child:  Text(
                              '${studentProfileController.studentProfileModel.value?.response.responseClass}',
                                        // _allsetController.SchoolIdControllerList[0]["response"][0]["class"] ?? "",

                                        style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightBlue),
                                      ),
                                    ),

                                  Container(
                                    child:  Text(
                                        '${studentProfileController.studentProfileModel.value?.response.section}',
                                        // _allsetController.SchoolIdControllerList[0]["response"][0]["section"] ?? "",

                                        style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightBlue),
                                      ),
                                    ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:10,top: 30.0).r,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Fees",

                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[600],

                                      ),

                                    ),
                                    Obx(()=>   all.loadingfees.value?
                                      Text(
                                        all.FeeControllerList[0]["response"]["total_amount"].toString(),
                                        // _allsetController.SchoolIdControllerList[0]["response"][0]["attandance"]["present"].toString(),

                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],

                                        ),

                                      ):Text(""),
                                    ),
                                    // SizedBox(height: 0.010.sh),
                                    // Container(color:Colors.black,height:0.001.sh,width: 0.40.sw,),
                                  ],
                                ),
                              ),

                              SizedBox(width: 0.090.sw),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Fees Due",

                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[600],

                                      ),

                                    ),
                                    Obx(()=>all.loadingfees.value?
                                       Text(
                                        all.FeeControllerList[0]["response"]["total_balance_amount"].toString(),
                                        // _allsetController.SchoolIdControllerList[0]["response"][0]["fee"]["total_balance_amount"].toString(),

                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],

                                        ),

                                      ):Text(""),
                                    ),
                                    // SizedBox(height: 0.010.sh),
                                    // Container(color:Colors.black,height:0.001.sh,width: 0.40.sw,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10).r,
                                child: Container(
                                  height: 0.06.sh,
                                  width: 0.15.sw,

                                  child: FloatingActionButton(

                                      child: Text("Pay",style: GoogleFonts.dmSans(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize:15.sp,
                                                    fontWeight: FontWeight.bold,
color: Colors.white,
                                                  ),
                                                  ),

                                      backgroundColor: Colors.blue,
                                      onPressed: () async {

                                      } ),
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),

              ],
            ),
                SizedBox(height: 0.020.sw),
                Container(
                  height: 0.60.sw,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        side: BorderSide(width: 0.001.sw, color: Colors.white60)),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),  topRight: Radius.circular(10)),),

                          height: 0.02.sh,

                        ) ,
Padding(
  padding: const EdgeInsets.all(8.0).r,
  child:   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
      Container(
          child:  Text(
            'Grand Total',
            style: GoogleFonts.dmSans(
              fontStyle: FontStyle.normal,
              fontSize:15.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
      ),
      Container(
          child: Obx(
                () =>
            all.loadingfees.value? Text(
              all.FeeControllerList[0]["response"]["total_amount"].toString(),

            style: GoogleFonts.dmSans(
              fontStyle: FontStyle.normal,
              fontSize:15.sp,
              fontWeight: FontWeight.normal,
              color: Colors.lightBlue,
            ),
          ):Text("")
      ),
      )
  ],
  ),
),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Discount',
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize:15.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Obx(
                                        () =>
                                        all.loadingfees.value? Text(
                                      all.FeeControllerList[0]["response"]["total_discount_amount"].toString(),

                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize:15.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.lightBlue,
                                      ),
                                    ):Text("")
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child:  Text(
                                  'Paid',
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize:15.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Obx(
                                        () =>
                                        all.loadingfees.value? Text(
                                          all.FeeControllerList[0]["response"]["total_deposite_amount"].toString(),

                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize:15.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.lightBlue,
                                      ),
                                    ):Text("")
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child:  Text(
                                  'Fine',
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize:15.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Obx(
                                        () =>
                                        all.loadingfees.value? Text(
                                          all.FeeControllerList[0]["response"]["total_fine_amount"].toString(),

                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize:15.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.lightBlue,
                                      ),
                                    ):Text("")
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Balance',
                                  style: GoogleFonts.dmSans(
                                    fontStyle: FontStyle.normal,
                                    fontSize:15.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                child: Obx(
                                        () =>
                                        all.loadingfees.value? Text(
                                          all.FeeControllerList[0]["response"]["total_balance_amount"].toString(),

                                      style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize:15.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.lightBlue,
                                      ),
                                    ):Text("")
                                ),
                              ),
                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
              ],
            ),

          ):const Center(child: CircularProgressIndicator()),
        ),

      ),
      onRefresh: () async {
        const AlwaysScrollableScrollPhysics();
        setState(() {
          feeController.Feesapi(studentProfileController.studentProfileModel.value?.response.studentId, company_key);

          username = box.get("username");
          password =box.get("password");
         studentProfileController.studentProfileApi(studentProfileController.studentProfileModel.value?.response.studentId);
        });
        await Future.value({

          Duration(seconds:1 ),

        });
      },
    );

  }
}
