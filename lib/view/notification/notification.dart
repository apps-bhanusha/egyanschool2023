
import 'package:flutter/material.dart';
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Notification"),
      

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