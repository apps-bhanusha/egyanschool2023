
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
class NotificationPage extends StatefulWidget {
  NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationController notificationController = Get.put(NotificationController());

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationController.notifactionApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AgentColor.appbarbackgroundColor,
        title: Text('Notification',style: MyGoogeFont.mydmSans),

      ),
      body: Obx(
      () =>  notificationController.isloading.value ? notificationController.notificationList.value?.response?.length != null? ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
           itemCount:notificationController.notificationList.value?.response?.length,
          itemBuilder: (context, index) {
            return  Card(
              
              color:"${notificationController.notificationList.value?.response?[index]?.isRead}"=="1"?Color.fromARGB(255, 255, 255, 255):const Color.fromARGB(255, 181, 216, 255) ,
              elevation: 10,
              child: ListTile(
                onTap: (){
                  print(notificationController.notificationList.value?.response?[index]?.notiId);
                  notificationController.setnotificationread(notificationController.notificationList.value?.response?[index]?.notiId);
                },
                      title:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${notificationController.notificationList.value?.response?[index]?.notificationText}"),
                          Text("${notificationController.notificationList.value?.response?[index]?.sendBy}"),

                        ],
                      ),
                      subtitle: Text("${MyDateFormat.dateformatmethod2(notificationController.notificationList.value?.response?[index]?.createdAt.toString())}"),
                      leading: const Icon(Icons.notifications),
                      // trailing: Text("${notificationController.notificationList.value?.response?[index]?.studentId}"),
                     ),
            );
        },):const Center(child: Text("Record Not Found"),):const Center(child: CircularProgressIndicator(color: Colors.blue,),),
      ),
    );
  }
}