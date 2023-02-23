import 'package:ecom_desgin/Widgets/DropDown_widget.dart';
import 'package:ecom_desgin/Widgets/TextFieldWidget.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_list_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/upload_content_Controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadContent1 extends StatefulWidget {
  const UploadContent1({Key? key}) : super(key: key);

  @override
  State<UploadContent1> createState() => _UploadContent1State();
}

class _UploadContent1State extends State<UploadContent1> {
   final UploadContentController uploadContentController = Get.put(UploadContentController());
   final ClassListController classListController = Get.put(ClassListController());

     TextEditingController contentTitler = TextEditingController();
     TextEditingController test = TextEditingController();
     TextEditingController test2 = TextEditingController();
     TextEditingController description = TextEditingController();

  DateTime today = DateTime.now();
  var dateStr;
  @override
  void initState() {
 dateStr = "${today.day}-${today.month}-${today.year}";
    super.initState();
    classListController.classListapi();
  }
  String dropdownValue = 'Dog';
  bool valuefirst = false;
  bool valuesecond = false;
 var  selecttype="Select Content Type";
 var  selectclass="Select Class";
 var  selectsection="Select Section";
 var  visibility="";
 var  filePath="";
 var  fileName="";
  var countries = [
    "Assinment",
    "Syllebus",
    "Other",
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
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
         backgroundColor: Theme.of(context).primaryColor,
          title: Text("Upload Content",style: MyGoogeFont.mydmSans,),
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
                            padding: const EdgeInsets.only( right: 18, top: 4.0 ,left: 18),
                            child: 
                           CustomTextField(hint: 'Content Title',controller: contentTitler,inputType: TextInputType.name,obscureText: false,onChange: (value){ },),
                          ),
//                        Padding(
//   padding: const EdgeInsets.only(top: 4.0 ,left: 18).r,
//   child:   RichText(
//                               text:TextSpan(
//                                 text: 'Content Title',
//                                 style: GoogleFonts.dmSans(
//                                   fontStyle: FontStyle.normal,
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black,
//                                 ),

//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                       text: '*',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.red)),
//                                 ],
//                               ),
//                             ),
// ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 18.0,right: 18.0).r,
//                             child: Container(
//                               height: 0.060.sh,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.rectangle,
//                                 border: Border.all(
//                                   color: Colors.grey,
//                                   width: 1.0,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0).r,
//                                 child: TextFormField(
//                                controller: contentTitler,
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                   ),
//                                   onFieldSubmitted: (value) {
//                                     //Validator
//                                   },
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Please Enter The Text!';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
                        Form(
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
                              padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
                         child:     DropDownWidget(droph: 0.060.sh, selectText: selecttype, item: countries, isloading: true, empaty: "", onChange: (value) {
                             print("You selected: $value");
                                    selecttype=value!;
                                    setState(() {
                         
                                    });
                         }, xpand: true,)
                             
                              //  Container(
                              //   height: 0.060.sh,
                              //   decoration: BoxDecoration(
                              //     shape: BoxShape.rectangle,
                              //     border: Border.all(
                              //       color: Colors.grey,
                              //       width: 1.0,
                              //     ),
                              //   ),
                              //   child: DropdownButton(

                              //     isExpanded: true,
                              //     isDense: true,
                              //     iconSize: 35,
                              //     hint: Text(selecttype),
                              //     items: countries.map((country){
                              //       return DropdownMenuItem(
                              //         value: country,
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(8.0),
                              //           child: Text(country),
                              //         ),
                              //       );
                              //     }).toList(),
                              //     onChanged: (country){
                              //       // print("You selected: $country");
                              //       selecttype=country!;
                              //       setState(() {

                              //       });
                              //     },
                              //   ),
                              // ),
                            ),
                     
                          
                            Container(height: 0.005.sh,color: Colors.grey[300],),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0).r,
                              child: Row(
                                children: [
                                  Checkbox(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    value: value2,
                                    onChanged: (value) {
                                      setState(() {                             
                                        value2 = value!;                                 
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
                          Obx(
                                  () =>   Padding(
                                padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
                                child:   DropDownWidget(droph: 0.060.sh, selectText: selectclass, item: value2?[]:classListController.classList, isloading: classListController.dropforcetrue.value, empaty: "", onChange: (value) {
                                  // print("You selected: $country");
                                      selectclass=value!;
                                      setState(() {
                                                              classListController.classSectionapi(value);
                                      });
                                    }, xpand: true,),
                                ),
                              ),
                             
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
                            //   child: Container(
                            //     height: 0.060.sh,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.rectangle,
                            //       border: Border.all(
                            //         color: Colors.grey,
                            //         width: 1.0,
                            //       ),
                            //     ),
                            //     child: value2==false? DropdownButton(

                            //       isExpanded: true,
                            //       isDense: true,
                            //       iconSize: 35,
                            //       hint: Text(selectclass),
                            //       items: classListController.classList.map((country){
                            //         return DropdownMenuItem(
                            //           value: country,
                            //           child:Padding(
                            //             padding:  const EdgeInsets.all(8.0),
                            //             child: Text(country),
                            //           ),
                            //         );
                            //       }).toList(),
                            //       onChanged: (country){
                            //         // print("You selected: $country");
                            //         selectclass=country!;
                            //         setState(() {
                            //   classListController.classSectionapi(country);
                            //         });
                            //       },
                            //     ):DropdownButton(

                            //       isExpanded: true,
                            //       isDense: true,
                            //       iconSize: 35,
                            //      hint: Text(selectclass),
                            //       items: countries.map((country){
                            //         return DropdownMenuItem(
                            //           value: country,
                            //           child:Padding(
                            //             padding:  const EdgeInsets.all(8.0),
                            //             child: Text(country),
                            //           ),
                            //         );
                            //       }).toList(),
                            //       onChanged: null
                            //           // (country){
                            //         // print("You selected: $country");
                            //         // selectdata=country!;

                            //       // },
                            //     ),
                            //   ),
                            // ),
                          
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
                              Obx(
                                () =>  Padding(
                                padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
                                child:   DropDownWidget(droph: 0.060.sh, selectText: selectsection, item: value2?[]:classListController.classSection, isloading: classListController.isloding2.value, empaty: "", onChange: (value) {
                                     // print("You selected: $country");
                                      selectsection=value!;
                                      setState(() {
                                
                                      });
                                                          }, xpand: true,),
                                ),
                              ),
                             
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 18.0,right: 18.0 ).r,
                            //   child: Container(
                            //     height: 0.060.sh,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.rectangle,
                            //       border: Border.all(
                            //         color: Colors.grey,
                            //         width: 1.0,
                            //       ),
                            //     ),
                            //     child:value2==false?Obx(() =>  DropdownButton(

                            //       isExpanded: true,
                            //       isDense: true,
                            //       iconSize: 35,
                            //       hint:  classListController.isloding2.value ?SizedBox(width: 110,height:20,child: Text(selectsection)):const SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
                            //       items: classListController.classSection.map((country){
                            //         return DropdownMenuItem(
                            //           value: country,
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Text(country),
                            //           ),
                            //         );
                            //       }).toList(),
                            //       onChanged: (country){
                            //         // print("You selected: $country");
                            //         selectsection=country!;
                            //         setState(() {

                            //         });
                            //       },
                            //     )):DropdownButton(

                            //       isExpanded: true,
                            //       isDense: true,
                            //       iconSize: 35,
                             
                            //       hint: Text(selectsection),
                            //       items: countries1.map((country){
                            //         return DropdownMenuItem(
                            //           value: country,
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Text(country),
                            //           ),
                            //         );
                            //       }).toList(),
                            //       onChanged: null
                            //       //     (country){
                            //       //   // print("You selected: $country");
                            //       //   selectdata1=country!;
                            //       //   setState(() {
                            //       //
                            //       //   });
                            //       // },
                            //     ),
                            //   ),
                            // ),
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
                                    readOnly: true,
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
                                  controller: description,
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
                              padding: const EdgeInsets.only(left: 20.0,).r,
                              child: InkWell(
                                onTap: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                        type: FileType.any,
                                        
                                      );

                                  if (result != null) {
                                    PlatformFile file = result.files.first;
                                    filePath=file.path!;
                                    setState(() {
                                    fileName=file.name;
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
                                    child: fileName!=""? Text(fileName):const Text("Click Here To Pic File"),
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
                                    onPressed: () {
uploadContentController.saveisloading.value=true;
                                  if(value2==true){
                                     selectclass="";
                                    selectsection="";
                                    visibility='Yes';
                                  }else{
                                    selectclass="Select Class";
                                    selectsection="Select Section";
                                   visibility='No'; 
                                  }
                                var save= uploadContentController.saveUploadContentpi(selectsection, visibility, contentTitler.text, selecttype, description.text, filePath);
                               print("%^%^%^%^%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
                                print(save.then((value) {
                                     if(value=="true"){
                                 setState(() {
                                   contentTitler.text="";
                                   selecttype="Select Content Type";
                                    visibility="";
                                    selectclass="Select Class";
                                    selectsection="Select Section";
                                   description.text="";
                                    fileName="";
                                       });          
                             Navigator.pop(context);
                                  }
                                }));
                               

                                  
                                    },

                                    child: Obx(
                                      () => uploadContentController.saveisloading.value? const SizedBox( width: 20,height: 20, child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2))
                                      :Text("Save".toUpperCase(),
                                           style: GoogleFonts.dmSans(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                    
                                      ),
                                      )
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