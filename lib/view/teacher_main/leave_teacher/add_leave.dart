import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddLeaveTeacher extends StatefulWidget {
  const AddLeaveTeacher({super.key});

  @override
  State<AddLeaveTeacher> createState() => _AddLeaveTeacherState();
}

class _AddLeaveTeacherState extends State<AddLeaveTeacher> {
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
   DateTime today = DateTime.now();
   var dateStr;
   @override
  void initState() {
     dateStr = "${today.day}-${today.month}-${today.year}";
    super.initState();
  }
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
   var fromdateController = TextEditingController();
   var todateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Add Leave",style: MyGoogeFont.mydmSans),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.015.sh,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0).r,
                child: Container(
                    width: 0.99.sw,
                    height: 0.85.sh,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                                height: 0.010.sh,
                                width: 0.99.sw,
                                color:Colors.blue
                            ),
                            Padding(
                                            padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                            child:   RichText(
                                              text: const TextSpan(
                                                text: 'Apply Date',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: '*',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.red)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 18.0,right: 18.0).r,
                                            child: Container(
                                              height: 0.06.sh,

                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,

                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(top:15,left: 3.0).r,
                                                child: TextFormField(
                                              readOnly: true,
                                                  decoration:  InputDecoration(

                                                    hintText: dateStr,hintStyle: TextStyle(color: Colors.grey),
                                                    border: InputBorder.none,
                                                  ),
                                                  onFieldSubmitted: (value) {
                                                    //Validator
                                                  },
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please Enter The Text!';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Available Leave',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
                              child: Container(
                                height: 0.060.sh,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                child:DropdownButton(

                                  isExpanded: true,
                                  isDense: true,
                                  iconSize: 35,
                                  // alignment: Alignment.center,
                                    value: selectdata1,
                                  hint: Text(selectdata1),
                                  items: countries1.map((country){
                                    return DropdownMenuItem(
                                      value: country,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(country),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (country){
                                    // print("You selected: $country");
                                    selectdata1=country!;
                                    setState(() {

                                    });
                                  },
                                )
                              ),
                            ),

                            Form(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                  

                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                      child:   RichText(
                                        text: const TextSpan(
                                          text: 'Leave From Date',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0,right: 18.0).r,
                                      child: Container(
                                        height: 0.065.sh,

                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,

                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0).r,
                                          child: TextFormField(
                                            controller: fromdateController,
                                            readOnly: true,
                                            onTap: () async {
                                              DateTimeRange? pickedRange =
                                              await showDateRangePicker(
                                                  context: context,
                                                  initialDateRange: DateTimeRange(
                                                    start: DateTime.now(),
                                                    end: DateTime.now(),
                                                  ),
                                                  firstDate: DateTime.now(),
                                                  lastDate:
                                                  DateTime(DateTime.now().year + 2),
                                                  helpText: 'Select Date Range',
                                                  cancelText: 'CANCEL',
                                                  confirmText: 'OK',
                                                  saveText: 'SAVE',
                                                  errorFormatText: 'Invalid format.',
                                                  errorInvalidText: 'Out of range.',
                                                  errorInvalidRangeText: 'Invalid range.',
                                                  fieldStartHintText: 'Start Date',
                                                  fieldEndLabelText: 'End Date');

                                              if (pickedRange != null) {
                                                print(
                                                    pickedRange); //pickedDate output format => 2021-03-10 00:00:00.000
                                                DateTimeRange formattedDate = pickedRange;
                                                print(formattedDate);
                                                setState(() {
                                                  fromdateController.text =
                                                      MyDateFormat.dateformatmethod1(
                                                          '${pickedRange?.start}');
                                                  todateController.text =
                                                      MyDateFormat.dateformatmethod1(
                                                          '${pickedRange?.end}');
                                                  // from_date = MyDateFormat.dateformatmethod(
                                                  //     '${pickedRange?.start}');
                                                  // to_date = MyDateFormat.dateformatmethod(
                                                  //     '${pickedRange?.end}');
                                                  // fromdateController.text =formatDate(DateTime.parse('${pickedRange?.start}'), [dd, '-', mm, '-', yyyy]);
                                                  // todateController.text =formatDate(DateTime.parse('${pickedRange?.end}'), [dd, '-', mm, '-', yyyy]);
                                                  print(
                                                      "tttttttttttttttttttttttttttgggggggggggggggg");

                                                  // from_date=fromdateController.text;
                                                  // to_date=todateController.text;

                                                  //set output date to TextField value.
                                                });
                                              }
                                              print("444444444444443444333");
                                              print(
                                                  'picked range ${pickedRange?.start} ${pickedRange?.end} ${pickedRange?.duration.inDays}');

                                              // pickedRange1='${pickedRange?.start}';
                                              // pickedRange2='${pickedRange?.end}';
                                              // print(pickedRange1);
                                              // print(pickedRange2);
                                            },
                                            decoration: const InputDecoration(
                                              // hintText: "2023-01-23",hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none,
                                            ),
                                            onFieldSubmitted: (value) {
                                              //Validator
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter The Text!';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                      child:   RichText(
                                        text:TextSpan(
                                          text: 'Leave To Date',
                                          style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),

                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0,right: 18.0).r,
                                      child: Container(
                                        height: 0.060.sh,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0).r,
                                          child: TextFormField(
                                            controller: todateController,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            onFieldSubmitted: (value) {
                                              //Validator
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter The Text!';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                      child:   RichText(
                                        text:  TextSpan(
                                          text: 'Attachment',
                                          style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0,).r,
                                      child: InkWell(
                                        onTap: () async {
                                          FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();

                                          if (result != null) {
                                            PlatformFile file = result.files.first;

                                            print(file.name);
                                            print(file.bytes);
                                            print(file.size);
                                            print(file.extension);
                                            print(file.path);

                                            setState(() {

                                            });
                                          } else {
                                            print('No file selected');
                                          }
                                        },
                                        child: Container(
                                          height: 0.060.sh,
                                          width: 0.87.sw,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,

                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0).r,
                                            child: Text("Click Here To Pic File"

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                      child:   RichText(
                                        text:  TextSpan(
                                          text: 'Resone',
                                          style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0,right: 18.0).r,
                                      child: Container(
                                        height: 0.15.sh,

                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,

                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0).r,
                                          child: TextFormField(
maxLines: 40,
                                            decoration: const InputDecoration(

                                              border: InputBorder.none,
                                            ),
                                            onFieldSubmitted: (value) {
                                              //Validator
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter The Text!';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0 ,left: 18).r,
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
                                ))
                          ]),
                    )),
              ),
            ],
          ),
        ));
  }
}
