import 'package:ecom_desgin/constant/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class ClassTimeTable extends StatefulWidget {
  const ClassTimeTable({super.key});

  @override
  State<ClassTimeTable> createState() => _ClassTimeTableState();
}

class _ClassTimeTableState extends State<ClassTimeTable> {

List day=["Mon","Tus","Wed","Thu","Fri","Sat","Sun"];
List<String> countries = ["1st", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
List<String> countries1 = ["A", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
int index=0;
String selectdata="Select";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:   AppBar(
        backgroundColor: Colors.blue,
        title: Text("Class Time Table",style: MyGoogeFont.mydmSans,),),
        body: Column(
          children: [
            const SizedBox(height: 10,),
                       Padding(
                                      padding: const EdgeInsets.only(top: 1 ,left: 0,right: 300).r,
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Class',
                                          style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: <TextSpan>[
                                            const TextSpan(
                                                text: '',
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
                                        width: 0.9.sw,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                        child:     DropdownButton(
                                                     isDense: true,
                                                    iconSize: 35,
                                                   isExpanded: true,
                                                      alignment: Alignment.center,
                                                      value: countries[0],
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
                                                    print("You selected: $country");
          },
      ),
                                      ),
                                    ),
                   
            const SizedBox(height: 5,),
               Padding(
                                      padding: const EdgeInsets.only(top: 1 ,left: 0,right: 290).r,
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Section',
                                          style: GoogleFonts.dmSans(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: <TextSpan>[
                                            const TextSpan(
                                                text: '',
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
                                        width: 0.9.sw,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                        child:     DropdownButton(
                                                     isDense: true,
                                                    iconSize: 35,
                                                   isExpanded: true,
                                                      alignment: Alignment.center,
                                                      value: countries[0],
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
                                                    print("You selected: $country");
          },
      ),
                                      ),
                                    ),

            const SizedBox(height: 5,),

            Center(
              child:   Container(
                 width: double.infinity,
                height: 0.08.sh,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      // borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 3,
                              spreadRadius: 10)
                        ]),
                    width: double.infinity,
                    height: 272,
                    child:  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
         for(int i=0;i<=day.length-1;i++)
          Padding(
            padding: const EdgeInsets.all(4),
            child: InkWell(
              onTap: (){
                index=i;
                setState(() {
                  
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
              decoration:  BoxDecoration(
                color: index!=i? Colors.white:Colors.blue,
                boxShadow: const [
                    BoxShadow(
              color: Colors.grey,
              blurRadius: 2, ) ]),
              child: Text(day[i],style:TextStyle(color:  index!=i? Colors.black:Colors.white),),
              ),
            ),
          )

                        ],
                      ),
                    ),
                  )),
            
              
            ),

           
          SizedBox(
            height: 0.61.sh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                   for(int i=0;i<=5;i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      
                       width: double.infinity,
                      height: 0.17.sh,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3
                            )
                          ],
                            color: Colors.white,
                            // borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                        // padding: const EdgeInsets.all(10),
                        child: Row(
                          
                          children: [
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 250,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 209, 234, 255),
                      boxShadow: [
                    BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2, ) ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                    Text("Subject"),
                    Text("HINDI"),
                    Text("(001)"),
                      ],
                    ),
                    ),
                     Expanded(
                       child: Container(
                        alignment: Alignment.center,
                                 decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                             BoxShadow(
                                 color: Colors.grey,
                                 blurRadius: 2, ) ]),
                                 child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                        children:  [
                                 Text("10:00 AM-11:00 AM"),
                                 Text("Room Number : 101"),
                                 Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,         
                                   children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(Icons.person_add_alt,color: Color.fromARGB(255, 68, 233, 255),),
                                  ),
                                     Text("Nikhil Shukla"),
                                   ],
                                 ),
                        ],
                                 ),
                                 ),
                     ),
            
            
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )
          ],
        ),
    );
  }
}