

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownContainer extends StatefulWidget {
  const DropDownContainer({super.key});

  @override
  State<DropDownContainer> createState() => _DropDownContainerState();
}

class _DropDownContainerState extends State<DropDownContainer> {
  @override
  Widget build(BuildContext context) {
    return  Center(
          child: Container(
      
       width: 0.9.sw,
       height: 0.2.sh,
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
                width: 0.9.sw,
                color:Colors.blue
              ),
              const SizedBox( height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                ],
              ),
              const SizedBox( height: 35,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Search Criterial ",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
              Container(
                color: Colors.blue,
                width: 100,
                height: 30,
                alignment: Alignment.center,
              child: Text("Search",style: TextStyle(color: Colors.white),),
              )
            ],
           )

            ],
          ),
          ),
        );
  }
}