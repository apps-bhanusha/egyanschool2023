import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ExamTimeTable extends StatelessWidget {
  const ExamTimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exam TIme Table")),
      body: Column(
        children: [
           Container(
                     padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Table(
                       textDirection: TextDirection.ltr,
                      border: TableBorder.all(color: Colors.black),
                      
                      columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1.5),
                2: FlexColumnWidth(1.6),
                3: FlexColumnWidth(2),
                6: FlexColumnWidth(1.6),
                7: FlexColumnWidth(2),
              },  
                      children: [
                        // ignore: prefer_const_constructors
                        TableRow(children:  [
                          Center(child: Text('Subject',style: GoogleFonts.dmSans(textStyle: TextStyle(fontWeight: FontWeight.bold)))),
                          Center(child: Text('Date From.',style: GoogleFonts.dmSans(textStyle: TextStyle(fontWeight: FontWeight.bold)))),
                          Center(child: Text('Start Time',style: GoogleFonts.dmSans(textStyle: TextStyle(fontWeight: FontWeight.bold)))),
                          Center(child: Text('Duration',style: GoogleFonts.dmSans(textStyle: TextStyle(fontWeight: FontWeight.bold)))),
                          Center(child: Text('Room No.',style: GoogleFonts.dmSans(textStyle: TextStyle(fontWeight: FontWeight.bold)))),
                          Center(child: Text('A',style: GoogleFonts.dmSans(textStyle: TextStyle(fontWeight: FontWeight.bold)))),
                        ]),
                    
                      ],
                    ),
                  ),
     Container(
      width: 1.sw,
      height: 0.5.sh,
        color: Color.fromARGB(255, 255, 247, 247),
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            
            children: [
              Table(
                border: TableBorder.all(color: Colors.black),
              defaultColumnWidth: IntrinsicColumnWidth(),
                children: [
               
                  for(int i=0;i<=10;i++)
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(11),
                      child: Text('29-11-2022',),
                    ),
                    InkWell(
                      onTap: () {
                    
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(11),
                        child: Text('80221129102651.'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(11),
                      child: Text('20'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(11),
                      child: Text('25688₹'),
                    ),
                  ]),
                ],
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