import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BusRoute extends StatefulWidget {
  const BusRoute({super.key});

  @override
  State<BusRoute> createState() => _BusRouteState();
}

class _BusRouteState extends State<BusRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bus Route"),),
      body: Center(child: Text("data")),
    );
  }
}