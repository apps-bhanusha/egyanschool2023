import 'package:ecom_desgin/model/parent_student_model.dart';
import 'package:ecom_desgin/view/teacher/Attendance.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
class StudentInformation extends StatefulWidget {
  const StudentInformation({super.key});

  @override
  State<StudentInformation> createState() => _StudentInformationState();
}

class _StudentInformationState extends State<StudentInformation> {
   TextEditingController textController = TextEditingController();
String searchValue = '';
final ScrollController _horizontal = ScrollController(),
    _vertical = ScrollController();
 String dropdownvalue = '1st';   
  
  // List of items in our dropdown menu
  var items = [    
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
List<String> countries = ["1st", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
List<String> countries1 = ["A", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
final List<String> _suggestions = ['Afeganistan', 'Albania', 'Algeria', 'Australia', 'Brazil', 'German', 'Madagascar', 'Mozambique', 'Portugal', 'Zambia'];

Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:    EasySearchBar(

        iconTheme: const IconThemeData(
          color: Colors.red,
          size: 30

        ),
        // searchCursorColor: Colors.white,
        searchHintText: "Search Student",
        searchTextStyle: const TextStyle(color:Colors.white),
      searchBackgroundColor:Color.fromARGB(255, 87, 124, 192),
        searchHintStyle: TextStyle(color: Colors.white),
             backgroundColor: Colors.blue,
          title: const Text('Student Information',style: TextStyle(color: Colors.white),),
          onSearch: (value) => setState(() => searchValue = value),
          actions: [
       
          ],
          asyncSuggestions: (value) async => await _fetchSuggestions(value),
          
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
                    Get.to(AttandanceAdd());
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
          Center(
            child: Container(
        
         width: 0.98.sw,
         height: 0.65.sh,
         decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
             BoxShadow(
                   blurRadius: 10,
                    color: Colors.grey
                  )
                   ]
         ),
            child: Column(
              children: [
                Container(
                  height: 10,
                  width: 0.98.sw,
                  color:Colors.blue
                ),
             SingleChildScrollView(
              controller: _horizontal,
              scrollDirection:
               Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "Admission",
                        style: GoogleFonts.dmSans(
                            textStyle:
                                const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                       padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "Student Name",
                        style: GoogleFonts.dmSans(
                            textStyle:
                                const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                       padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "Class",
                        style: GoogleFonts.dmSans(
                            textStyle:
                                const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ),
                    ),
                     Padding(
                        padding: const EdgeInsets.only(right: 10),
                       child: Text(
                        "Father Name",
                        style: GoogleFonts.dmSans(
                            textStyle:
                                const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    ),
                     ),
                     Padding(
                      padding: const EdgeInsets.only(right: 10),
                       child: Text(
                        "Address",
                        style: GoogleFonts.dmSans(
                            textStyle:
                                const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    ),
                     ),
                  ],
                ),
              ),
      
              InteractiveViewer(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 0.01.sw, top: 0.01.sh), 
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ////
                          Scrollbar(
                            // thumbVisibility: true,
                            // trackVisibility: true,
                            child: SingleChildScrollView(
                              controller: _vertical,
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                controller: _horizontal,
                                scrollDirection:
                                    Axis.horizontal,
                                child: SizedBox(
                                    height: 0.6.sh,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                      children: [
                                        for (int i = 0;i <=_suggestions.length-1;i++)
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                          SizedBox(width: 90, child: Text("S00001")),
                                          SizedBox(width: 120, child: Text(_suggestions[i].toString())),
                                          SizedBox(width: 50, child: Text("1st")),
                                       
                                          SizedBox(width: 100, child: Text("nk shukla")),
                                             SizedBox(width: 100, child: Text("Akanlsha shukla")),
                                          SizedBox(width: 100, child: Text("indere mp ")),
                                           
                                            
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
            ),
          )
          ],
        ),
      )
    );
  }
}