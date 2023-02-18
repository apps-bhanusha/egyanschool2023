
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/notifications_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/teacher_notification-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
class TeacherNotificationPage extends StatefulWidget {
  TeacherNotificationPage({super.key});

  @override
  State<TeacherNotificationPage> createState() => _TeacherNotificationPageState();
}

class _TeacherNotificationPageState extends State<TeacherNotificationPage> {
  final TeacherNotificationController teahernotificationController = Get.put(TeacherNotificationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teahernotificationController.teachernotifactionApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Notification',style: MyGoogeFont.mydmSans,),
      ),
      body: Obx(
            () =>  teahernotificationController.isloading.value ? teahernotificationController.teachernotificationList.value?.response?.length != null? ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:teahernotificationController.teachernotificationList.value?.response?.length,
          itemBuilder: (context, index) {
            return  Card(

              color:"${teahernotificationController.teachernotificationList.value?.response?[index]?.isRead}"=="1"?Colors.white:const Color.fromARGB(255, 181, 216, 255) ,
              elevation: 10,
              child: ListTile(
                onTap: (){
                  print(teahernotificationController.teachernotificationList.value?.response?[index]?.notiId);
                  teahernotificationController.teachersetnotificationread(teahernotificationController.teachernotificationList.value?.response?[index]?.notiId);
                },
                title:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${teahernotificationController.teachernotificationList.value?.response?[index]?.notificationText}"),
                    Text("${teahernotificationController.teachernotificationList.value?.response?[index]?.sendBy}"),

                  ],
                ),
                subtitle: Text("${MyDateFormat.dateformatmethod2(teahernotificationController.teachernotificationList.value?.response?[index]?.createdAt.toString())}"),
                leading: const Icon(Icons.notifications),
                // trailing: Text("${notificationController.notificationList.value?.response?[index]?.studentId}"),
              ),
            );
          },):const Center(child: Text("Record Not Found"),):const Center(child: CircularProgressIndicator(color: Colors.blue,),),
      ),
    );
  }
}