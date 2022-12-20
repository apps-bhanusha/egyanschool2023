import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class BusRoute extends StatefulWidget {
  const BusRoute({super.key});

  @override
  State<BusRoute> createState() => _BusRouteState();
}

class _BusRouteState extends State<BusRoute> {

      static const _backgroundColor = Color(0xFFF15BB5);

static const _colors = [
    Color(0xFFFEE440),
    Color(0xFF00BBF9),
];

static const _durations = [
    5000,
    4000,
];

static const _heightPercentages = [
    0.65,
    0.66,
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transport"),
        ),
        body: Column(
          children: [
            Card(
              elevation: 10,
              child: Container(
                width: 0.95.sw,
                height: 0.37.sh,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.child_care),
                          ),
                          Text("Mohan Sharma")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(Icons.bus_alert_rounded),
                          ),
                          Text("Bus TPS bus")
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.drive_eta_rounded),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.call),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Pickup Drop Locations",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    const Text(
                      "bangali square",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w800),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 0.5.sw,
                        height: 0.05.sh,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_history,
                                color: Colors.white,
                              ),
                              Text(
                                "Track Bus",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),


// Container(
//   width: 50,
//                   height: 48,
//                   child: WaveWidget(
//                     config: CustomConfig(
//                       colors: [
                       
//                         Colors.indigo[200]!,
//                         Colors.indigo[100]!
//                       ],
//                       durations: [18000, 8000,],
//                       heightPercentages: [0.65, 0.66,],
//                     ),
//                     size: Size(double.infinity, double.infinity),
//                     waveAmplitude: 0,
//                   ),
//                 ),
          ],
        ));
  }
}
