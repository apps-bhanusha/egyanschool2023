// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
class FeesWidget extends StatefulWidget {
 
String? total_balance_amount;
String? total_amount;
String? name;
String? profileimage;
String ? responseClass;
String?  section;
String? total_discount_amount;
String?  total_deposite_amount;
String?  total_fine_amount;
   FeesWidget({
    Key? key,
    required this.total_balance_amount,
    required this.total_amount,
    required this.name,
    required this.profileimage,
    required this.responseClass,
    required this.section,
    required this.total_discount_amount,
    required this.total_deposite_amount,
    required this.total_fine_amount,
  }) : super(key: key);
  @override
  State<FeesWidget> createState() => _FeesWidgetState();
}

class _FeesWidgetState extends State<FeesWidget> {

   final colorList = <Color>[
    const Color.fromRGBO(245, 10, 45, 1.0),
    const Color.fromRGBO(37, 171, 29, 1.0)
  ];
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 0.010.sh,),
                PieChart(dataMap: {
                  "Due Fees":double.parse(widget.total_balance_amount!),
                  "Paid  Fees":double.parse('${(int.parse(widget.total_amount!)-int.parse(widget.total_balance_amount!))}'),
                },
                  animationDuration: const Duration(milliseconds: 800),
                  chartLegendSpacing: 12,
                  chartRadius: MediaQuery.of(context).size.width / 2.5,
                  initialAngleInDegree: 0,
                  chartType: ChartType.disc,

centerTextStyle: const TextStyle(
  fontWeight: FontWeight.bold,
      color: Colors.white
),

                  legendOptions: const LegendOptions(
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.bottom,
                    showLegends: true,

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
                  emptyColorGradient: const [
                    Color(0xff6c5ce7),
                    Colors.blue,

                  ],

                ),


            Stack(
              children: [

                SizedBox(
                  height: 0.60.sw,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.only(
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
                          padding: const EdgeInsets.only(top: 10,left: 100).r,
                          child: Text(
                            widget.name??"",
                              // _allsetController.SchoolIdControllerList[0]["response"][0]["name"] ??"",
                              style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue),
                            ),

                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30).r,
                              child: Transform.scale(
                                scale:  2,
                                // transform: Matrix4.identity(),

                                child:  ClipRRect(
                                  // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                                  child:   CircleAvatar(
                                    radius: 20.0,
                                    backgroundImage:
                                    NetworkImage('${ApiUrl.imagesUrl.toString()}${widget.profileimage}'),
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
                                  Text(
                                    'Class',
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize:15.sp,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                  Text(
                                    'Section',
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize:15.sp,
                                      fontWeight: FontWeight.bold,

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
                                  Text(
                              widget.responseClass??"",
                                      // _allsetController.SchoolIdControllerList[0]["response"][0]["class"] ?? "",

                                      style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightBlue),
                                    ),

                                  Text(
                                      widget.section??'',
                                      // _allsetController.SchoolIdControllerList[0]["response"][0]["section"] ?? "",

                                      style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightBlue),
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
                                    
                                      Text(
                                        widget.total_amount??"",
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],

                                        ),

                                      )
                                    
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
                                   
                                       Text(
                                        widget.total_balance_amount??"",
                                        // _allsetController.SchoolIdControllerList[0]["response"][0]["fee"]["total_balance_amount"].toString(),

                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],

                                        ),

                                    
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

                                      backgroundColor: Colors.blue,
                                      onPressed: () async {

                                      },

                                      child: Text("Pay",style: GoogleFonts.dmSans(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize:15.sp,
                                                    fontWeight: FontWeight.bold,
color: Colors.white,
                                                  ),
                                                  ) ),
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
                SizedBox(
                  height: 0.60.sw,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.only(
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
      Text(
        'Grand Total',
        style: GoogleFonts.dmSans(
          fontStyle: FontStyle.normal,
          fontSize:15.sp,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
      ),
   Text(
          widget.total_amount??"",

        style: GoogleFonts.dmSans(
          fontStyle: FontStyle.normal,
          fontSize:15.sp,
          fontWeight: FontWeight.normal,
          color: Colors.lightBlue,
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
                              Text(
                                'Discount',
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize:15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                    widget.total_discount_amount??"",

                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize:15.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.lightBlue,
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
                              Text(
                                'Paid',
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize:15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                             Text(
                                   widget.total_deposite_amount??"",

                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize:15.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.lightBlue,
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
                              Text(
                                'Fine',
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize:15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                             
                                     Text(
                                      widget.total_fine_amount??"",

                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize:15.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.lightBlue,
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
                              Text(
                                'Balance',
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize:15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                        Text(
                                        widget.total_balance_amount??"",

                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize:15.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.lightBlue,
                                    ),
                                  )
                              
                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
              ],
            ),

          );
  }
}