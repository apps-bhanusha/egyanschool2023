import 'package:ecom_desgin/view/teacher/upload_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      appBar:   AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Attandance",style: TextStyle(color: Colors.white),),),
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
                height: 10,
                width: 0.95.sw,
                color:Colors.blue
              ),
              const SizedBox( height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
      DropdownButton(
      iconSize: 35,
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
       iconSize: 35,
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
              const SizedBox( height: 35,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Search Criterial ",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
              InkWell(
                  onTap: (){
                    Get.to(UploadContent());
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 30,
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
                            Text("Holiday",style: TextStyle(fontSize: 18),)
              ],
            ),
           const SizedBox(height:65 ,),
      
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("Roll No.",style: TextStyle(fontSize: 18),),
                   Text("Student Name",style: TextStyle(fontSize: 18),),
                   Text("Attandance",style: TextStyle(fontSize: 18),),
                ],
              ),
            ) 
          ],
        ),
         ),
           const SizedBox(height: 15,),
         
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
                             child: Text("111.",style: TextStyle(fontSize: 15),),
                           ),
                           Spacer(),
                           Padding(
                             padding: const EdgeInsets.only(left: 25),
                             child: Text("Nikhil Shukla",style: TextStyle(fontSize: 15),),
                             
                           ),
                           SizedBox(
                            width: 15,
                           ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: DropdownButton(
             iconSize: 35,
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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Press Save After Checking attandane  "),
                InkWell(
                    onTap: (){
                      Get.to(UploadContent());
                    },
                    child: Container(
                      color: Colors.blue,
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                    child: Text("Save",style: TextStyle(color: Colors.white),),
                    ),
                  )
            ],
          ),
        )
        ],
      )
    );
  }
}