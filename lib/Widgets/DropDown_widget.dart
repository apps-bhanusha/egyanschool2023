// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DropDownWidget extends StatefulWidget {
  late double droph= 0.060.sh;
  final  String selectText;
  final List<String> item;
  final bool isloading;
  final bool xpand;
  final String empaty;
  final void Function(dynamic value) onChange;
   DropDownWidget({super.key,required this.droph, required this.selectText, required this.item, required this.isloading,required this.xpand, required this.empaty, required this.onChange});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

// ignore: camel_case_types
class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  height: widget.droph,
                  // width: double.infinity,
                  
           child: 
                       DropdownButton(
                                  isExpanded: widget.xpand,
                                  isDense: true,
                       underline: const SizedBox(),
               iconSize: 35,
                //  alignment: Alignment.center,
             hint:  widget.isloading?SizedBox(width: 110,height:20,child: Padding(
               padding: const EdgeInsets.only(left: 5),
               child: Text(widget.selectText),
             )):const SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
                 items: widget.empaty.isEmpty? widget.item.map((country){
                 return DropdownMenuItem( 
              value: country, 
              child: Text(country),
                 );
                 }).toList():[], 
                  onChanged: widget.onChange,
                //  onChanged: widget?.onChange
               )
         );
  }

  // void onChange(value) {
  // }
}