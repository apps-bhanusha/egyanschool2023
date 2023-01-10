
import 'package:ecom_desgin/constant/Colors.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:flutter/material.dart';
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:AgentColor.appbarbackgroundColor,
        title: Text('Notification',style: MyGoogeFont.mydmSans),
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
        children:   [
          for(int i=0;i<=5;i++)
         const ListTile(
          title:Text("student "),
          subtitle: Text("sharma"),
          leading: Icon(Icons.notifications),
          trailing: Text("notifiacation"),
         )
        ],
      ),
    );
  }
}