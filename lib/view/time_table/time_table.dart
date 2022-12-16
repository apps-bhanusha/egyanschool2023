import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
var  _selectedIndex =0;
  List<String> _options = ['Sunday', 'Monday', 'Tuesday',"Wedanesday","Thursday","Friday","Saturday"];

List<String> dataset1=["09.00 AM-09.45 AM","09.00 AM-09.45 AM","09.00 AM-09.45 AM","09.00 AM-09.45 AM","09.00 AM-09.45 AM"];
List<String> dataset2=["English","Hindi","Mathematics","Science","Social Studies"];
List<String> dataset3=["101","102","103","104","105"];
List <dynamic>datalist=[];
  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i], style: TextStyle(color: Colors.white)),
        elevation: 3,
        pressElevation: 5,
        backgroundColor: Colors.grey[400],
        selectedColor: Colors.lightGreen,
        onSelected: (bool selected) {
          setState(() {

            if (selected) {
              _selectedIndex = i;
              if (selected) {
                datalist=dataset1;
              }else if(selected){
                datalist=dataset2;
              }else if(selected){
                datalist=dataset2;
              }


            }

          });
        },
      );
      chips.add(choiceChip);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   title:Text("all"),
      ),
      body: Column(


        children: <Widget>[

          _buildChips(),
          _selectedIndex == null
              ? Container()
              : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 0.47.sw,
                    height: 0.04.sh,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),
                    child: Text(
                      "Time",
                      style: GoogleFonts.dmSans(
                          textStyle:
                          const TextStyle(fontSize: 15)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 0.25.sw,
                    height: 0.04.sh,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),
                    child: Text(
                      "Subject",
                      style: GoogleFonts.dmSans(
                          textStyle:
                          const TextStyle(fontSize: 15)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 0.23.sw,
                    height: 0.04.sh,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),
                    child: Text(
                      "Room no",
                      style: GoogleFonts.dmSans(
                          textStyle:
                          const TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      for (int s = 0; s < dataset1.length; s++)
                      Row(

                        children: [

                          Container(
                            alignment: Alignment.center,
                            width: 0.47.sw,
                            height: 0.04.sh,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Text(
                              dataset1[s],
                              // datalist[_selectedIndex],
                              style: GoogleFonts.dmSans(
                                  textStyle:
                                  const TextStyle(fontSize: 15)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 0.25.sw,
                            height: 0.04.sh,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Text(
                              dataset2[s],
                              style: GoogleFonts.dmSans(
                                  textStyle:
                                  const TextStyle(fontSize: 15)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 0.23.sw,
                            height: 0.04.sh,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Text(
                              dataset3[s],
                              style: GoogleFonts.dmSans(
                                  textStyle:
                                  const TextStyle(fontSize: 15)),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Text(
                  '${_options[_selectedIndex]}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              // ElevatedButton(
              //   child: Text('Open route'),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => SecondRoute(
              //             selectedValue: _options[_selectedIndex],
              //           )),
              //     );
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  final String selectedValue;

  SecondRoute({required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$selectedValue"),
        ),
        body: Center(child: Text("$selectedValue")));
  }
}

