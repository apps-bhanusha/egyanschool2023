import 'package:ecom_desgin/view/teacher_main/teacher_upload_content/upload_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AttandanceAdd extends StatefulWidget {
  const AttandanceAdd({super.key});

  @override
  State<AttandanceAdd> createState() => _AttandanceAddState();
}

class _AttandanceAddState extends State<AttandanceAdd> {
 List<String> countries = ["1st", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
List<String> countries1 = ["A", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
 bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blue,
          title: Text("Attendance", style: GoogleFonts.dmSans(
            fontStyle: FontStyle.normal,
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),),
        ),
    //       Padding(
    //   padding: const EdgeInsets.only(top: 0, right: 15, left: 0),

    //   /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
    //   /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
    //   child: AnimSearchBar(
    //     // color: Colors.white,
    //     // searchIconColor: Colors.white,
    //     width: 350,
    //   helpText: "Search Student",
    //     textController: textController,
    //     onSuffixTap: () {
    //       setState(() {
    //         textController.clear();
    //       });
    //     }, onSubmitted: (String search ) {  
    //        print(search);
    //     },
        
    //   ),
    // ),
        
      body:  SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(height: 0.020.sh,),
          Center(
            child: Container(
        
         width: 0.95.sw,
         height: 0.2.sh,
         decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
             BoxShadow(
                   blurRadius: 5,
                    color: Colors.grey
                  )
                   ]
         ),
            child: Column(
              children: [
                Container(
                  height: 0.015.sh,
                  width: 0.95.sw,
                  color:Colors.blue
                ),
                // SizedBox( height: 0.015.sh,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
        DropdownButton(
        iconSize: 35.sp,
          alignment: Alignment.center,
          value: countries[0],
          items: countries.map((country){
          return DropdownMenuItem( 
              child: Text(country),
              value: country,
          );
          }).toList(),
          onChanged: (country){
         print("You selected: $country");
          },
        ),
        DropdownButton(
         iconSize: 35.sp,
           alignment: Alignment.center,
          value: countries1[0],
          items: countries1.map((country){
          return DropdownMenuItem( 
              child: Text(country),
              value: country,
          );
          }).toList(),
          onChanged: (country){
         print("You selected: $country");
          },
        )
                  ],
                ),
                 SizedBox( height: 0.035.sh,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Search Criterial ",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                InkWell(
                    onTap: (){

                    },
                    child: Container(
                      color: Colors.blue,
                      width: 0.20.sw,
                      height: 0.050.sh,
                      alignment: Alignment.center,
                    child: Text("Search",style: TextStyle(color: Colors.white),),
                    ),
                  )
              ],
             )
        
              ],
            ),
            ),
          ),
             const SizedBox(height: 15,),
           Container(
          color: Color.fromARGB(255, 255, 241, 117),
          width: double.infinity,
          height: 0.2.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                                value: this.value,
                                onChanged: ( value) {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                              Text("Holiday",  style: GoogleFonts.dmSans(
                                fontStyle: FontStyle.normal,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),)
                ],
              ),
              SizedBox(height:0.055 .sh,),
        
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Roll No.",style: GoogleFonts.dmSans(
                       fontStyle: FontStyle.normal,
                       fontSize: 18.sp,
                       fontWeight: FontWeight.normal,
                       color: Colors.black,
                     ),),
                     Text("Student Name",style: GoogleFonts.dmSans(
                       fontStyle: FontStyle.normal,
                       fontSize: 18.sp,
                       fontWeight: FontWeight.normal,
                       color: Colors.black,
                     ),),
                     Text("Attandance",style: GoogleFonts.dmSans(
                       fontStyle: FontStyle.normal,
                       fontSize: 18.sp,
                       fontWeight: FontWeight.normal,
                       color: Colors.black,
                     ),),
                  ],
                ),
              ) 
            ],
          ),
           ),
              SizedBox(height: 0.015.sh,),
           
          SizedBox(
            height: 0.36.sh,
            child:  SingleChildScrollView(
              child: Column(
                children: [
                        for(int i=0;i<=7;i++)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 0.97.sw,
                      height: 0.055.sh,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 247, 241, 241),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3
                      )
                    ]
                    ),
                    child:    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Padding(
                                 padding: const EdgeInsets.only(left: 10),
                               child: Text("111.",style: GoogleFonts.dmSans(
                                 fontStyle: FontStyle.normal,
                                 fontSize: 15.sp,
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                               ),),
                             ),
                             Spacer(),
                             Padding(
                               padding: const EdgeInsets.only(left: 25).r,
                               child: Text("Nikhil Shukla",style: GoogleFonts.dmSans(
                                 fontStyle: FontStyle.normal,
                                 fontSize: 15.sp,
                                 fontWeight: FontWeight.normal,
                                 color: Colors.black,
                               ),),
                               
                             ),
                             SizedBox(
                              width: 0.020.sw,
                             ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15).r,
                              child: DropdownButton(
               iconSize: 35.sp,
                alignment: Alignment.center,
                    
                value: countries1[0],
                items: countries1.map((country){
                    return DropdownMenuItem( 
                        child: Text(country),
                        value: country,
                    );
                }).toList(),
                onChanged: (country){
                   print("You selected: $country");
                },
                    ),
                            )
                          ],
                        ) ,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: Row(
              children: [
                Text("Press Save After Checking attandane  "),
                  InkWell(
                      onTap: (){
                        Get.to(UploadContent());
                      },
                      child: Container(
                        color: Colors.blue,
                        width: 0.20.sw,
                        height: 0.040.sh,
                        alignment: Alignment.center,
                      child: Text("Save",style: GoogleFonts.dmSans(
                        fontStyle: FontStyle.normal,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),),
                      ),
                    )
              ],
            ),
          )
          ],
        ),
      )
    );
  }
}