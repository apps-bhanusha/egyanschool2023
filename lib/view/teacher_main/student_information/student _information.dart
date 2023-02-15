import 'package:ecom_desgin/controller/teacher_controller/student_Controller/class_list_controller.dart';
import 'package:ecom_desgin/controller/teacher_controller/student_Controller/studnet_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class StudentInformation extends StatefulWidget {
  const StudentInformation({super.key});

  @override
  State<StudentInformation> createState() => _StudentInformationState();
}

class _StudentInformationState extends State<StudentInformation> {
   final ClassListController classListController = Get.put(ClassListController());

   TextEditingController textController = TextEditingController();
String searchValue = '';
final ScrollController _horizontal = ScrollController(),
    _vertical = ScrollController();
 String dropdownvalue = '1st';   

 final TextEditingController controller=TextEditingController();

 final StudentSearchController studentSearchController = Get.put(StudentSearchController());
  
  // List of items in our dropdown menu
  var items = [    
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
String selectClass="select Class";
String selectSection="select Section";

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
  void initState() {
    super.initState();
     classListController.classListapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:   AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Student Information",style: TextStyle(color: Colors.white),),),
      // EasySearchBar(

      //   iconTheme: const IconThemeData(
      //     color: Colors.red,
      //     size: 30

      //   ),
      //   // searchCursorColor: Colors.white,
      //   searchHintText: "Search Student",
      //   searchTextStyle: const TextStyle(color:Colors.white),
      // searchBackgroundColor:Color.fromARGB(255, 87, 124, 192),
      //   searchHintStyle: TextStyle(color: Colors.white),
      //        backgroundColor: Colors.blue,
      //     title: const Text('Student Information',style: TextStyle(color: Colors.white),),
      //     onSearch: (value) => setState(() => searchValue = value),
      //     actions: [
       
      //     ],
      //     asyncSuggestions: (value) async => await _fetchSuggestions(value),
          
      //   ),
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
         height: 0.22.sh,
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                 
                const SizedBox( height: 5,),
          ],
             ),
                   Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
        Container(
          width: 200,
        height: 50,
          padding: EdgeInsets.fromLTRB(10,2,10,2),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5),
             border: Border.all(color: Colors.blue)
          ),
          child: TextField(
onChanged:(value) {
  setState(() {
    
  });
},
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText:  "Search Student",
            ),
            controller: controller,
          ),
        ),
                InkWell(
                  onTap: (){
                   if(controller.text.isNotEmpty){
                    studentSearchController.isSearchbutton.value=false;
                    studentSearchController.studentSearchapi(controller.text);
                   }else{
                    Get.snackbar("Please Enter Any Name", "",snackPosition:SnackPosition.BOTTOM );
                   }
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 30,
                    alignment: Alignment.center,
                  child: Obx(() => studentSearchController.isSearchbutton.value ?Text("Search",style: TextStyle(color: Colors.white),):Center(child: SizedBox(width: 20,height: 20, child: CircularProgressIndicator(color: Colors.white,)),)),
                  ),
                ),
              
    
                  ],
                ),
           const SizedBox( height: 25,),
      Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
     Obx(() =>   DropdownButton(
      iconSize: 35,
        alignment: Alignment.center,
    hint:  classListController.isloding.value? SizedBox( width: 110,height:20,child: Text(selectClass)):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
        items: controller.text.isEmpty? classListController.classList.map((country){
        return DropdownMenuItem( 
            child: Text(country),
            value: country,
        );
        }).toList():[],
        onChanged: (dynamic country){
          selectClass=country;
        
         classListController.classSectionapi(country);
         setState(() {
           
         });

        },
      ),),
         Obx(() =>   DropdownButton(
      iconSize: 35,
        alignment: Alignment.center,
    hint:  classListController.isloding2.value ?SizedBox(width: 110,height:20,child: Text(selectSection)):SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
        items: controller.text.isEmpty? classListController.classSection.map((country){
        return DropdownMenuItem( 
            child: Text(country),
            value: country,
        );
        }).toList():[],
        onChanged: (dynamic country){
      selectSection=country;
      setState(() {
       
        studentSearchController.isSearch.value=false;
        studentSearchController.classSectiontInfoapi(country);
      });
        },
      )),
                ],
              ),
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
                  ],
                ),
              ),
      
              SizedBox(
                height: 0.6.sh,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.01.sw, top: 0.01.sh), 
                  child: SingleChildScrollView(
                    child:Column(
                      children: [
                        Obx(
                        () => studentSearchController.isSearch.value?studentSearchController.listisempty.value? const Center(child: Text("No Record Found"),): ListView.builder(
                            
                            shrinkWrap: true,
                            itemCount: studentSearchController.studentInformationListModal.value?.response.length,
                            itemBuilder: (context, index) {
                            return   SizedBox(
                                  height: 0.05.sh,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                  SizedBox(width: 90, child: Text("${studentSearchController.studentInformationListModal.value?.response[index].admissionNo}")),
                                  SizedBox(width: 120, child: Text("${studentSearchController.studentInformationListModal.value?.response[index].studentName}")),
                                  SizedBox(width: 50, child: controller.text.isEmpty? Text("$selectClass/$selectSection"):Text("${studentSearchController.studentInformationListModal.value?.response[index].studentClass}/""${studentSearchController.studentInformationListModal.value?.response[index].studentSection}")),
                                   
                                  SizedBox(width: 100, child: Text("${studentSearchController.studentInformationListModal.value?.response[index].fatherName}"))
                                    
                                  ],
                                ),
                              );
                          },):const Center(child: Padding(
                            padding: EdgeInsets.only(top: 180),
                            child: CircularProgressIndicator(color: Colors.blue,),
                          ),),
                        ),
                      ],
                    )
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