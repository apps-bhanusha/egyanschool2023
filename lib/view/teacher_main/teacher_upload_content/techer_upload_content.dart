import 'package:ecom_desgin/constant/font.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadContent1 extends StatefulWidget {
  const UploadContent1({Key? key}) : super(key: key);

  @override
  State<UploadContent1> createState() => _UploadContent1State();
}

class _UploadContent1State extends State<UploadContent1> {
  DateTime today = DateTime.now();
  var dateStr;
  @override
  void initState() {
 dateStr = "${today.day}-${today.month}-${today.year}";
    super.initState();
  }
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
    "hindustan",
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
          title: Text("Upload Content", style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.008.sh,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0).r,
                child: Container(
                    width: 0.99.sw,
                    height: 0.86.sh,
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
                              text:TextSpan(
                                text: 'Content Title',
                                style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
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
                        Material(
                            color: Colors.white,
                            child: Container(
                              child: Form(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Content Type',
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
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
                                      child: DropdownButton(

                                        isExpanded: true,
                                        isDense: true,
                                        iconSize: 35,
                                        // alignment: Alignment.center,
                                        value: selectdata,
                                        hint: Text(selectdata),
                                        items: countries.map((country){
                                          return DropdownMenuItem(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(country),
                                            ),
                                            value: country,
                                          );
                                        }).toList(),
                                        onChanged: (country){
                                          // print("You selected: $country");
                                          selectdata=country!;
                                          setState(() {

                                          });
                                        },
                                      ),
                                    ),
                                  ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0).r,
                                child: Text("Available For",style: GoogleFonts.dmSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0).r,
                                child: Row(
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
                                    Text("All Super Admin", style: GoogleFonts.dmSans(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0).r,
                                    child: Row(
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
                                        Text("Student", style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),)
                                      ],
                                    ),
                                  ),
                                  Container(height: 0.005.sh,color: Colors.grey[300],),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0).r,
                                    child: Row(
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
                                        Text("Avilable For All Classes", style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                    child: RichText(
                                      text: const TextSpan(
                                        text: 'Class',
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
                                      child: this.value2==false? DropdownButton(

                                        isExpanded: true,
                                        isDense: true,
                                        iconSize: 35,
                                        // alignment: Alignment.center,
                                        value: selectdata,
                                        hint: Text(selectdata),
                                        items: countries.map((country){
                                          return DropdownMenuItem(
                                            child:Padding(
                                              padding:  EdgeInsets.all(8.0),
                                              child: Text(country),
                                            ),
                                            value: country,
                                          );
                                        }).toList(),
                                        onChanged: (country){
                                          // print("You selected: $country");
                                          selectdata=country!;
                                          setState(() {

                                          });
                                        },
                                      ):DropdownButton(

                                        isExpanded: true,
                                        isDense: true,
                                        iconSize: 35,
                                        // alignment: Alignment.center,
                                        value: selectdata,
                                        disabledHint: Text(selectdata),

                                        items: countries.map((country){
                                          return DropdownMenuItem(
                                            child:Padding(
                                              padding:  EdgeInsets.all(8.0),
                                              child: Text(country),
                                            ),
                                            value: country,
                                          );
                                        }).toList(),
                                        onChanged: null
                                            // (country){
                                          // print("You selected: $country");
                                          // selectdata=country!;

                                        // },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                    child: RichText(
                                      text: const TextSpan(
                                        text: 'Section',
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
                                      child:this.value2==false? DropdownButton(

                                        isExpanded: true,
                                        isDense: true,
                                        iconSize: 35,
                                        // alignment: Alignment.center,
                                        value: selectdata1,
                                        hint: Text(selectdata1),
                                        items: countries1.map((country){
                                          return DropdownMenuItem(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(country),
                                            ),
                                            value: country,
                                          );
                                        }).toList(),
                                        onChanged: (country){
                                          // print("You selected: $country");
                                          selectdata1=country!;
                                          setState(() {

                                          });
                                        },
                                      ):DropdownButton(

                                        isExpanded: true,
                                        isDense: true,
                                        iconSize: 35,
                                        // alignment: Alignment.center,
                                        value: selectdata1,
                                        disabledHint: Text(selectdata1),
                                        items: countries1.map((country){
                                          return DropdownMenuItem(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(country),
                                            ),
                                            value: country,
                                          );
                                        }).toList(),
                                        onChanged: null
                                        //     (country){
                                        //   // print("You selected: $country");
                                        //   selectdata1=country!;
                                        //   setState(() {
                                        //
                                        //   });
                                        // },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                    child:   RichText(
                                      text: const TextSpan(
                                        text: 'Upload Date',
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
                                      height: 0.060.sh,

                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:15,left: 3.0).r,
                                        child: TextFormField(

                                          decoration:  InputDecoration(
                                            hintText:dateStr,
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
                                        text: 'Description',
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
                                    child:   RichText(
                                      text:  TextSpan(
                                        text: 'Content File',
                                        style: GoogleFonts.dmSans(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
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
                              )),
                              //     Card(
                              //       elevation: 5,
                              //       shape: Border(top: BorderSide(color: Colors.green, width: 5)),
                              //
                              //       child: ListTile(
                              //         title:Padding(
                              //             padding: const EdgeInsets.all(10.0),
                              //             child: Column(
                              //               mainAxisAlignment: MainAxisAlignment.start,
                              //               crossAxisAlignment: CrossAxisAlignment.start,
                              //               children: [
                              //
                              //                 RichText(
                              //                   text: const TextSpan(
                              //                     text: 'Content Type',
                              //                     style: TextStyle(
                              //                       color: Colors.black,
                              //                     ),
                              //                     children: <TextSpan>[
                              //                       TextSpan(
                              //                           text: '*',
                              //                           style: TextStyle(
                              //                               fontWeight: FontWeight.bold,
                              //                               color: Colors.red)),
                              //                     ],
                              //                   ),
                              //                 ),
                              //
                              //
                              //
                            ))
                      ]),
                    )),
              ),
            ],
          ),
        ));
  }
}
