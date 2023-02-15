import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getexamsSchedule1_controller.dart';
import 'package:ecom_desgin/controller/getexamsSchedule_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/examination/ExamTimeDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

class ExamTimeTable extends StatefulWidget {
  const ExamTimeTable({super.key});

  @override
  State<ExamTimeTable> createState() => _ExamTimeTableState();
}

class _ExamTimeTableState extends State<ExamTimeTable> {


  GetexamsSchedule1Controller getexamview1=Get.put(GetexamsSchedule1Controller());
  GetexamsScheduleController getexamview=Get.put(GetexamsScheduleController());
  var company_key;
  var exam_id;

  var box = Hive.box("schoolData");
@override
void initState() {
        super.initState();
        company_key = box.get("company_key");
        getexamview1.GetexamsSchedule1api(company_key, 0);
        print("dddddsvvv");


        exam_id = box.get("exam_id");

  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:AgentColor.appbarbackgroundColor,
          title: Text('Examination',style: MyGoogeFont.mydmSans),

        ),
        body: Obx(()=>
            getexamview1.loadingGetexamsSchedule1.value?Column(
            children: [
              for (int i = 0; i <getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"].length; i++)
                Center(
                  child: InkWell(
                    onTap: () {

                      getexamview.GetexamsScheduleapi(company_key, getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][i]["exam_group_id"]);
                      getexamview.loadingGetexamsSchedule.value=false;
                        Get.toNamed(RoutesName.examiTimeDetial);
                        },


                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            color: Colors.blue,
                            child: Container(

                              width: double.infinity,
                                decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),

                                            ),
                              height: 0.10.sh,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
   Obx(
   () =>Text(getexamview1.loadingGetexamsSchedule1.value?getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][i]["exam_group_name"]:CircularProgressIndicator(),style: GoogleFonts.dmSans(
     fontStyle: FontStyle.normal,
     fontSize: 15.sp,
     fontWeight: FontWeight.bold,
     color: Colors.white,
   )),),
                                        Obx(
                                              () =>Text(getexamview1.loadingGetexamsSchedule1.value?getexamview1.GetexamsSchedule1ControllerList[0]["response"]["examSchedule"][i]["exam"]:CircularProgressIndicator(),style: GoogleFonts.dmSans(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ), ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Opacity(
                              opacity: 0.5,
                               child: Image.asset("assets/images/arr.png",width: 30,height: 40,)
                                 )
                                          // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_outlined,size: 50,color: Colors.white,))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ):Center(child: CircularProgressIndicator()),
        ));
  }
}
