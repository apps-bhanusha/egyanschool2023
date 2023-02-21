// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
 final void Function(String value) onChange;

  const CustomTextField(
 {super.key,    required this.hint,
    required this.controller,
    required this.inputType,
    required this.onChange, 
    required this.obscureText,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
children: [
     RichText(
                                 text:TextSpan(
                                   text: hint,
                                   style: GoogleFonts.dmSans(
                                     fontStyle: FontStyle.normal,
                                     fontSize: 12.sp,
                                     fontWeight: FontWeight.normal,
                                     color: Colors.black,
                                   ),

                                   children: const <TextSpan>[
                                     TextSpan(
                                         text: '*',
                                         style: TextStyle(
                                             fontWeight: FontWeight.bold,
                                             color: Colors.red)),
                                   ],
                                 ),
                               ),
                          Container(
                            height: 0.060.sh,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0).r,
                              child: TextFormField(
                             controller: controller,
                          
                              onChanged: onChange,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onFieldSubmitted: (value) {
                                  //Validator
                                },
                               validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter The Text!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
],
    );
  }
}