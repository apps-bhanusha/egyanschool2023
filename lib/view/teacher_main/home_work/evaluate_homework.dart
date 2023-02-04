import 'package:ecom_desgin/constant/font.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvaluatehomeWork extends StatefulWidget {
  const EvaluatehomeWork({Key? key}) : super(key: key);

  @override
  State<EvaluatehomeWork> createState() => _EvaluatehomeWorkState();
}

class _EvaluatehomeWorkState extends State<EvaluatehomeWork> {
  String dropdownValue = 'Dog';
  bool valuefirst = false;
  bool valuesecond = false;
  var  selectdata="india";
  var  selectdata1="india";
  var countries = [
    "india",
    "pakistan",
    "hindustan",
    "afiganistan"
  ];
  var countries1 = [
    "india",
    "pakistan",
    "hindustan",
    "afiganistan"
  ];

  String _selectdrop = "Select";
  List<String> dropdata = [
    "india",
    "pakistan",
    "hindustan"
        "afiganistan"
  ];
  bool value = false;
  bool value1 = false;
  bool value2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blue,
          title: Text("Evaluate HomeWork", style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.010.sh,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0).r,
                child: Container(
                    width: 0.99.sw,
                    height: 0.85.sh,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
                    child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Availuate Date",style: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                        SizedBox(height: 0.010.sh,),
                        Card(
                          elevation: 10,
                          child: TextFormField(
                            style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize:15,
                              fontWeight: FontWeight.bold,

                            ),

                            decoration: InputDecoration(
                              hintText: "2023-01-23",

                              labelText: "2023-01-23",
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              filled: true,
                              isDense: true,

                              enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),

                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),


                              ),
                              labelStyle: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize:15,
                                fontWeight: FontWeight.bold,

                              ),
                              suffix: InkWell(

                                onTap: (){


                                },

                                child: const Icon( Icons.check,
                                  color: Colors.green,),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Date cannot be empty";
                              }
                              return null;
                            },

                          ),
                        ),
                        SizedBox(height: 0.020.sh,),
                          Row(
                            children: [
                              Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                                value: this.value,
                                onChanged: (value) {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                              Text("Akanksha Shukla", style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),)
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                                value: this.value1,
                                onChanged: (value) {
                                  setState(() {
                                    this.value1 = value!;
                                  });
                                },
                              ),
                              Text("Akanksha Shukla", style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),)
                            ],
                          ),

                        Row(
                          children: [
                            Checkbox(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,

                              value: this.value2,
                              onChanged: (value) {
                                setState(() {
                                  this.value2 = value!;
                                });
                              },
                            ),
                            Text("Akanksha Shukla", style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),)
                          ],
                        ),


                        Row(
                          children: [
                            Checkbox(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              value: this.value,
                              onChanged: (value) {
                                setState(() {
                                  this.value = value!;
                                });
                              },
                            ),
                            Text("Akanksha Shukla", style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),)
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              value: this.value1,
                              onChanged: (value) {
                                setState(() {
                                  this.value1 = value!;
                                });
                              },
                            ),
                            Text("Akanksha Shukla", style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),)
                          ],
                        ),

                        Row(
                          children: [
                            Checkbox(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,

                              value: this.value2,
                              onChanged: (value) {
                                setState(() {
                                  this.value2 = value!;
                                });
                              },
                            ),
                            Text("Akanksha Shukla", style: GoogleFonts.dmSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),)
                          ],
                        ),
                        SizedBox(height: 0.010.sh,),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                              child: Container(
                                width: 0.25.sw,
                                height: 0.055.sh,
                                color: Colors.blue,
                                child: TextButton(

                                  onPressed: () {},

                                  child: Text("SAVE".toUpperCase(),
                                    style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))),
              ),
            ],
          ),
        ));
  }
}
