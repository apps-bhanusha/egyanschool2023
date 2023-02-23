
import 'package:ecom_desgin/constant/date_format.dart';
import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/controller/teacher_controller/upload_content_Controller.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_upload_content/techer_upload_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadContent extends StatefulWidget {
  const UploadContent({super.key});

  @override
  State<UploadContent> createState() => _UploadContentState();
}

class _UploadContentState extends State<UploadContent> {
  List<String> countries = ["1st", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
  List<String> countries1 = ["A", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
  bool value = false;
   final UploadContentController uploadContentController = Get.put(UploadContentController());


  @override
  void initState() {

    super.initState();
    uploadContentController.isloading.value=false;
uploadContentController.uploadContentpi();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        backgroundColor: Theme.of(context).primaryColor,
          title: Text("Upload Content",style: MyGoogeFont.mydmSans),
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
                            Get.to(UploadContent1());
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
                children:const [
                  Text("Content Title",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text("Type",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text("Date",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text("Available for",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                 
                ],
              ),
            ) ,
            const SizedBox( height: 10,),
            SizedBox(
              height: 0.67.sh,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Obx(
                  () => uploadContentController.isloading.value? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: uploadContentController.allContentModal.value?.response.length??0,
                      itemBuilder: (context, index) {
                      return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              
                      children: [
                        SizedBox(height: 35, width: 90, child: Obx(() =>  Text("${uploadContentController.allContentModal.value?.response[index].title.capitalize}.",style: TextStyle(fontSize: 14),))),
                        SizedBox(height: 35, width: 115,child:  Obx(() =>  Text("${uploadContentController.allContentModal.value?.response[index].type.capitalize}",style: TextStyle(fontSize: 14),))),
                        SizedBox(height: 35,width: 90,child:  Obx(() =>  Text(MyDateFormat.dateformatmethod("${uploadContentController.allContentModal.value?.response[index].date}"),style: TextStyle(fontSize: 14),))),
                        SizedBox(height: 35,width: 40,child:  Obx(() =>  Row(
                          children: [
                            Text(uploadContentController.allContentModal.value?.response[index].responseClass??"All",style: const TextStyle(fontSize: 14),),
                            const Text("/",style: TextStyle(fontSize: 14),),
                            Text(uploadContentController.allContentModal.value?.response[index].section??"",style: const TextStyle(fontSize: 14),),
                          ],
                        ))),
                     
                      ],
                    );
                    },):const Center(child:Padding(
                      padding: EdgeInsets.only(top: 260),
                      child: CircularProgressIndicator(color: Colors.blue,),
                    ),),
                  ),
                )
              ),
            ) ,
          ],
        )
    );
  }
}