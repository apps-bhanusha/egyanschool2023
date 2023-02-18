import 'package:ecom_desgin/constant/font.dart';
import 'package:ecom_desgin/view/teacher_main/teacher_upload_content/techer_upload_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadContentDailog extends StatefulWidget {
  const UploadContentDailog({super.key});

  @override
  State<UploadContentDailog> createState() => _UploadContentDailogState();
}

class _UploadContentDailogState extends State<UploadContentDailog> {
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
      body: Column(
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
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 30,
                  alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    Get.to(UploadContent1());
                  },
                    child: Text("Upload",style: TextStyle(color: Colors.white),)),
                )
              ],
             )

              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}