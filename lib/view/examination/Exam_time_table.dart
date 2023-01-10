import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/getexamsSchedule_controller.dart';
import 'package:ecom_desgin/routes/routes.dart';
import 'package:ecom_desgin/view/examination/ExamTimeDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

class ExamTimeTable extends StatefulWidget {
  const ExamTimeTable({super.key});

  @override
  State<ExamTimeTable> createState() => _ExamTimeTableState();
}

class _ExamTimeTableState extends State<ExamTimeTable> {
  GetexamsScheduleController getexamview=Get.put(GetexamsScheduleController());

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:AgentColor.appbarbackgroundColor,
          title: Text('Examination',style: MyGoogeFont.mydmSans),
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
        body: Column(
          children: [
            for (int i = 0; i <getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"].length; i++)
              Center(
                child: InkWell(
                  onTap: () => Get.toNamed(RoutesName.examiTimeDetial),
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
   () =>Text(getexamview.loadingGetexamsSchedule.value?getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["exam_group_name"]:CircularProgressIndicator(),style: GoogleFonts.dmSans(
     fontStyle: FontStyle.normal,
     fontSize: 15.sp,
     fontWeight: FontWeight.bold,
     color: Colors.white,
   )),),
                                      Obx(
                                            () =>Text(getexamview.loadingGetexamsSchedule.value?getexamview.GetexamsScheduleControllerList[0]["response"]["examSchedule"][i]["exam"]:CircularProgressIndicator(),style: GoogleFonts.dmSans(
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
        ));
  }
}
