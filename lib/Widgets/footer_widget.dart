import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});
  @override
  Widget build(BuildContext context) {
         return Container(
                        color: const Color.fromARGB(255, 196, 236, 255),
                        child:Row(
                                        children: [
                                          Padding(
                                        padding:  EdgeInsets.only(left: 0.09.sw),
                                        child: Image.asset("assets/images/appstore.png",width: 50,height: 50,),),
                                           Padding(
                                             padding:  EdgeInsets.only(left: 0.05.sw,top: 10),
                                             child: const Text("Powered By :-"),
                                           ),
                                          Image.asset(
                                            "assets/images/b.png",
                                            width: 0.4.sw,
                                            height: 0.070.sh,
                                          ),
                                        ],
                                      ),
                      );
  }
}