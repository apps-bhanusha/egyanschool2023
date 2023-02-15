import 'dart:async';
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/api_url.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/student_login_controller.dart';
import 'package:ecom_desgin/controller/student_login_update_controller.dart';
import 'package:ecom_desgin/controller/student_profile-Controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/payslip_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/staff_detial_contriller.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
class TeacherPayroll extends StatefulWidget {
  @override
  State<TeacherPayroll> createState() => _TeacherPayrollState();
}

class _TeacherPayrollState extends State<TeacherPayroll> {

  final StaffDetailController staffdetailsController = Get.put(StaffDetailController());
  PaySlipController paySlipController=Get.put(PaySlipController());
  var  selectdata;
  late String year1;
  late String year2;
  bool isselected=false;
  var countries = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "Jun",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  String _selectdrop = "Select";

  List <dynamic> parentinfo=[];

  var box = Hive.box("schoolData");
  @override
  void initState() {
    var id=box.get("staff_id");
    staffdetailsController.staffDetail(id);
    var now=DateTime.now();
    print(now);
   var  newDate =now.month+1;


    print("dfdf");
    print(newDate);


    String year_start_date=box.get("year_start_date");
    String year_end_date=box.get("year_end_date");
    var date_object=DateTime.parse(year_end_date);
    var date_object1=DateTime.parse(year_start_date);
    print(date_object.year);
    print(date_object1.year);
    year1=date_object.year.toString();
    year2=date_object1.year.toString();
    // countries1.add(year1);
   String date3=date_object.toString();
    var dateTime = Jiffy(date_object1, "yyyy-MM-dd").format("dd/MM/yyyy");
    var dateTime1 = Jiffy(date_object, "yyyy-MM-dd").format("dd/MM/yyyy");
    print(dateTime);
    var date1 = DateFormat("dd/MM/yyyy").parse(dateTime);
    var date2 = DateFormat("dd/MM/yyyy").parse(dateTime1);
    print("fdfdfddall");


    while (date1.isBefore(date2)) {
      print(DateFormat("yyyy").format(date1));
      date1 = DateTime(date1.year, date1.month + 1);
//      var  dateconvert=DateFormat("M").format(date1);
// print(dateconvert);
// print(date1.year);
      var dateall=DateFormat.MMMM().format(date1);
      var dateall1=DateFormat.y().format(date1);
print(dateall);
      // var dateall=DateFormat.yM().format(date1);
    // something like 2019-Jun-20
    //   countries.add(dateall);
    //   countries1.add(dateall1);
    }
    // var date1 = DateFormat("dd/MM/yyyy").parse("20/12/2021");
    // var date2 = DateFormat("dd/MM/yyyy").parse("22/08/2022");
    // while (date1.isBefore(date2)) {
    //   print(DateFormat("M/yyyy").format(date1));
    //   date1 = DateTime(date1.year, date1.month + 1);
    // }
    super.initState();
  }
   var  selectdata1;
  late var countries1=["${year2}","${year1}"];
  // Datebetween(DateTime doPurchase, DateTime doRenewel) {
  //   var dt1 = Jiffy(2021);
  //   var dt2 = Jiffy(2022);
  //
  //   int years = int.parse("${dt2.diff(dt1, Units.YEAR)}");
  //   dt1.add(years: years);
  //
  //   int month = int.parse("${dt2.diff(dt1, Units.MONTH)}");
  //   dt1.add(months: month);
  //
  //   var days = dt2.diff(dt1, Units.DAY);
  //
  //
  //   print( "$years Years $month Month $days Days");
  //   print(month);
  // }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        AlwaysScrollableScrollPhysics();
        setState(() {

          var id=box.get("staff_id");
          staffdetailsController.staffDetail(id);

        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:AgentColor.appbarbackgroundColor,
          title: Text('Payroll ',style: MyGoogeFont.mydmSans),

        ),
        body: Obx(
                () =>  staffdetailsController.isloding.value ?
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 0.250.sh,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.blue.shade300],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.5, 0.9],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            CircleAvatar(
                                backgroundColor: Colors.white70,
                                minRadius: 45.0,
                                child:    CircleAvatar(
                                    foregroundImage: "${staffdetailsController.staffDetailModel.value?.response.image}"!="null"?
                                    NetworkImage("${ApiUrl.imagesUrl.toString()}${staffdetailsController.staffDetailModel.value?.response.image}")
                                        :  NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU"),
                                    radius: 40.0,
                                    backgroundImage:
                                    NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7M4Z0v1HP2Z9tZmfQaZFCuspezuoxter_A&usqp=CAU")
                                )
                            ),
                            // CircleAvatar(
                            //   backgroundColor: Colors.blue.shade300,
                            //   minRadius: 35.0,
                            //   child: Icon(
                            //     Icons.message,
                            //     size: 30.0,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 0.010.sh,
                        ),
                        Text(
                          '${staffdetailsController.staffDetailModel.value?.response.name.toString().capitalizeFirst} ${staffdetailsController.staffDetailModel.value?.response.surname.toString().capitalizeFirst}',

                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          '${staffdetailsController.staffDetailModel.value?.response.department.toString().capitalizeFirst}-${staffdetailsController.staffDetailModel.value?.response.designation.toString().capitalizeFirst}',
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0,).r,
                        child: RichText(
                          text: TextSpan(
                            text: 'Year',
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            
                          ),
                        ),
                      ),
                      Container(
                        height: 0.050.sh,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: DropdownButton(

                          // isExpanded: true,
                          isDense: true,
                          iconSize: 35,
                          // alignment: Alignment.center,
                          value: selectdata1,

                          items: countries1.map((country){
                            return DropdownMenuItem(
                              value: country,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(country),
                              ),
                            );
                          }).toList(),
                          hint: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Select Year",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                            ),
                          ),
                          onChanged: (country){
                            // print("You selected: $country");
                            selectdata1=country!;
                            setState(() {
                              paySlipController.isloding.value=false;
                              paySlipController.isSelectMonth.value=false;
                              isselected=true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Month',
                          style: GoogleFonts.dmSans(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                     
                        ),
                      ),

                  Container(
                    height: 0.050.sh,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: DropdownButton(

                      // isExpanded: true,
                      isDense: true,
                      iconSize: 35,
                      // alignment: Alignment.center,
                      value: selectdata,

                      items: isselected==true?countries.map((country){
                        return DropdownMenuItem(
                          value: country,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(country),
                          ),
                        );
                      }).toList():null,
                      hint: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Select Month",style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                        ),
                      ),
                      onChanged: (country){
                        // print("You selected: $country");
                        selectdata=country!;

                        var box = Hive.box("schoolData");
                        var year_end_date=box.get("year_end_date");
                        var date_object=DateTime.parse(year_end_date);
                        print(date_object);
                        print("fdffddddddatetime");
                        print(date_object.year);


                        var id=box.get("staff_id");
                        paySlipController.PaySlipapi(id,selectdata1,selectdata);
                     
                        setState(() {
                           paySlipController.isloding.value=false;
                   paySlipController.isSelectMonth.value=true;
                        });
}

                    ),
                  ),
                    ],
                  ),
                    ],
                  ),
                  Obx(()=>
                     paySlipController.isloding.value ?Padding(
                      padding: const EdgeInsets.only(top: 5,left: 10,right: 10).r,
                      child: Column(
                        children: [
                          Container(
                              height: 0.010.sh,
                              width: 0.99.sw,
                              color:Colors.blue
                          ),

                          Container(
                            // color: Colors.grey[200],
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
                            child: Obx(()=>
                              paySlipController.paySlipModel.value!=null?Column(

                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,right: 8.0),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: SizedBox(
                                            width:0.5.sw,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: AgentColor.appBarColor,
                                                  borderRadius: BorderRadius.circular(10)),
                                              width: 0.5.sw,
                                              height: 0.05.sh,
                                              child: Center(
                                                child: Text(
                                                  'Month And Year',
                                                  style: GoogleFonts.dmSans(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[200]
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 0.3.sw,
                                          child: Center(
                                            child: Text(
                                              '${paySlipController.paySlipModel.value?.response[0].month.substring(0,3).capitalizeFirst}-${paySlipController.paySlipModel.value?.response[0].year}',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
Container(height: 0.01.sh,color: Colors.grey[200]),
                                  // Divider(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,right: 8.0),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                              color: AgentColor.appBarColor,
                                              borderRadius: BorderRadius.circular(10)),
                                          width: 0.5.sw,
                                          height: 0.05.sh,
                                          child: Center(
                                            child: Text(
                                              'Basic',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[200]
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 0.3.sw,
                                          child: Center(
                                            child: Text(
                                              '${paySlipController.paySlipModel.value?.response[0].basic}',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  // Divider(),
                                  Container(height: 0.01.sh,color: Colors.grey[200]),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,right: 8.0),
                                    child: Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                              color: AgentColor.appBarColor,
                                              borderRadius: BorderRadius.circular(10)),
                                          width: 0.5.sw,
                                          height: 0.05.sh,
                                          child: Center(
                                            child: Text(
                                              "Total Allowance",
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 0.3.sw,
                                          child: Center(
                                            child: Text(
                                              '${paySlipController.paySlipModel.value?.response[0].totalAllowance}',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  // Divider(),
                                  Container(height: 0.01.sh,color: Colors.grey[200]),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,right: 8.0),
                                    child: Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                              color: AgentColor.appBarColor,
                                              borderRadius: BorderRadius.circular(10)),
                                          width: 0.5.sw,
                                          height: 0.05.sh,
                                          child: Center(
                                            child: Text(
                                              "Total Deduction",
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 0.3.sw,
                                          child: Center(
                                            child: Text(
                                              '${paySlipController.paySlipModel.value?.response[0].totalDeduction}',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  // Divider(),
                                  Container(height: 0.01.sh,color: Colors.grey[200]),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,right: 8.0),
                                    child: Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                              color: AgentColor.appBarColor,
                                              borderRadius: BorderRadius.circular(10)),
                                          width: 0.5.sw,
                                          height: 0.05.sh,
                                          child: Center(
                                            child: Text(
                                              "Leave Deduction",
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 0.3.sw,
                                          child: Center(
                                            child: Text(
                                              '${paySlipController.paySlipModel.value?.response[0].leaveDeduction}',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  // Divider(),
                                  Container(height: 0.01.sh,color: Colors.grey[200]),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,right: 8.0),
                                    child: Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                              color: AgentColor.appBarColor,
                                              borderRadius: BorderRadius.circular(10)),
                                          width: 0.5.sw,
                                          height: 0.05.sh,
                                          child: Center(
                                            child: Text(
                                              "Tax",
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 0.3.sw,
                                          child: Center(
                                            child: Text(
                                              '${paySlipController.paySlipModel.value?.response[0].tax}',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  // Divider(),
                                  Container(height: 0.01.sh,color: Colors.grey[200]),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,right: 8.0),
                                    child: Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                              color: AgentColor.appBarColor,
                                              borderRadius: BorderRadius.circular(10)),
                                          width: 0.5.sw,
                                          height: 0.05.sh,
                                          child: Center(
                                            child: Text(
                                              "Net Salary",
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 0.3.sw,
                                          child: Center(
                                            child: Text(
                                              '${paySlipController.paySlipModel.value?.response[0].netSalary}',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                  // Divider(),
                                  Container(height: 0.01.sh,color: Colors.grey[200],),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,right: 8.0,bottom: 8.0).r,
                                    child: Row(
                                      children: [

                                        Container(
                                          decoration: BoxDecoration(
                                              color: AgentColor.appBarColor,
                                              borderRadius: BorderRadius.circular(10)),
                                          width: 0.5.sw,
                                          height: 0.05.sh,
                                          child: Center(
                                            child: Text(
                                              "Status",
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 0.3.sw,
                                          child: Center(
                                            child: Text(
                                              '${paySlipController.paySlipModel.value?.response[0].status.toString().capitalizeFirst}',
                                              style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ):Center(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("No Data Found"),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ): paySlipController.isSelectMonth.value?
                    Center(child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: CircularProgressIndicator(color: Colors.blue,),
                    )):Padding(
                      padding: const EdgeInsets.only(top: 5,left: 10,right: 10).r,
                      child: Column(
                        children: [
                          Container(
                              height: 0.010.sh,
                              width: 0.99.sw,
                              color:Colors.blue
                          ),

                          Container(
                            // color: Colors.grey[200],
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
                            child:Text(""))
                        ],
                      ),
                    )
                  )
                ],
              ),
            ):Center(child: CircularProgressIndicator(color: Colors.blue,))
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Profile"),),
//       body: ClipOval(
//
//         child: Image.asset("assets/images/girls.png",width: 80,height: 80,),)
//       );
//
//   }
// }