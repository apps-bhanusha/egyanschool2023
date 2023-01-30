import 'package:ecom_desgin/view/teacher/upload_Content_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UploadContent extends StatefulWidget {
  const UploadContent({super.key});

  @override
  State<UploadContent> createState() => _UploadContentState();
}

class _UploadContentState extends State<UploadContent> {
List<String> countries = ["1st", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
List<String> countries1 = ["A", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
 bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Upload Content",style: TextStyle(color: Colors.white),),),
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
        
      body:  Column(
        children: [
          const SizedBox(height: 15,),
        Center(
          child: Container(
      
       width: 0.95.sw,
       height: 0.14.sh,
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
                height: 10,
                width: 0.95.sw,
                color:Colors.blue
              ),
              // const SizedBox( height: 10,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      // DropdownButton(
      // iconSize: 35,
      //   alignment: Alignment.center,
      //   value: countries[0],
      //   items: countries.map((country){
      //   return DropdownMenuItem( 
      //       child: Text(country),
      //       value: country,
      //   );
      //   }).toList(),
      //   onChanged: (country){
      //  print("You selected: $country");
      //   },
      // ),
      // DropdownButton(
      //  iconSize: 35,
      //    alignment: Alignment.center,
      //   value: countries1[0],
      //   items: countries1.map((country){
      //   return DropdownMenuItem( 
      //       child: Text(country),
      //       value: country,
      //   );
      //   }).toList(),
      //   onChanged: (country){
      //  print("You selected: $country");
      //   },
      // )
      //           ],
      //         ),
              const SizedBox( height: 35,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Content List ",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
               InkWell(
                  onTap: (){
                    Get.to(UploadContentDailog());
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 30,
                    alignment: Alignment.center,
                  child: Text("Upload",style: TextStyle(color: Colors.white),),
                  ),
                )
            ],
           )
      
            ],
          ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text("Content Title",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
             Text("Tyle",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
             Text("Date",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
             Text("Available for",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
             Text("Action",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            ],
          ),
        ) ,
             const SizedBox( height: 10,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
           SizedBox( width: 90, child: Text("Text Other",style: TextStyle(fontSize: 14),)),
           SizedBox( width: 60,child: Text("syllabus",style: TextStyle(fontSize: 14),)),
           SizedBox(width: 90,child: Text("30-01-2023",style: TextStyle(fontSize: 14),)),
           SizedBox(width: 40,child: Text("1st",style: TextStyle(fontSize: 14),)),
           Row(
               children: [
                 Icon(Icons.download),
                 SizedBox(
                  width: 15,
                 ),
                 Icon(Icons.close)
               ],
           ),
          ],
        ),
            ) ,
        ],
      )
    );
  }
}