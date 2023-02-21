// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class dropDownWidget extends StatefulWidget {
//   late double droph;
//   final  String selectSection;
//   final List<String> item;
//   final bool isloading;
//   final String empaty;
//   final void Function()? onChange;
//    dropDownWidget({super.key, required this.selectSection, required this.item, required this.isloading, required this.empaty, required this.onChange});

//   @override
//   State<dropDownWidget> createState() => _dropDownWidgetState();
// }

// class _dropDownWidgetState extends State<dropDownWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     border: Border.all(
//                       color: Colors.grey,
//                       width: 1.0,
//                     ),
//                   ),
//                   height: widget.droph,
//            child: 
//              DropdownButton(
//             underline: const SizedBox(),
//                iconSize: 35,
//                  alignment: Alignment.center,
//              hint:  widget.isloading?SizedBox(width: 110,height:20,child: Text(widget.selectSection)):const SizedBox(width: 110,height: 20, child: Center(child: SizedBox( width: 20,height:20,child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,)))),
//                  items: widget.empaty.isEmpty? widget.item.map((country){
//                  return DropdownMenuItem( 
//               child: Text(country),
//               value: country,
//                  );
//                  }).toList():[], onChanged: (Object? value) {  },
//                 //  onChanged: widget?.onChange
//                )
//          );
//   }
// }