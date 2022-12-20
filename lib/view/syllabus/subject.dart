import 'package:ecom_desgin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubjectLession extends StatefulWidget {
  const SubjectLession({super.key});

  @override
  State<SubjectLession> createState() => _SubjectLessionState();
}

class _SubjectLessionState extends State<SubjectLession> with TickerProviderStateMixin {
  final bool _visible = true;
 late AnimationController _controller;
  late Animation<double> _animation;
  double value = 1.0;
  
 @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subject"),
      ),
      body: SafeArea(
          child: Container(
        color: const Color.fromARGB(255, 238, 232, 232),
        child: Column(
          children: [
            for (int i = 0; i <= 3; i++)
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: () => Get.toNamed(RoutesName.syllabus),
                   child: Container(
                     height: 0.12.sh,
                     decoration: BoxDecoration(
                         boxShadow: const [
                           BoxShadow(
                             blurRadius: 5.0,
                             color: Color.fromARGB(255, 78, 78, 78),
                           ),
                           BoxShadow(
                             blurRadius: 5.0,
                             color: Color.fromARGB(255, 235, 235, 235),
                           )
                         ],
                         borderRadius: BorderRadius.circular(20),
                         gradient: const LinearGradient(colors: [
                           Color.fromARGB(255, 89, 177, 184),
                           Color.fromARGB(255, 90, 150, 255)
                         ])),
                     child: Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 8,),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Image.asset(
                                 "assets/images/book.png",
                                 width: 30,
                                 height: 30,
                               ),
                               Container(
                                 decoration: BoxDecoration(
                                     boxShadow: const [
                                    
                                     ],
                                     borderRadius: BorderRadius.circular(10),
                                     gradient: const LinearGradient(colors: [
                                       Color.fromARGB(255, 156, 163, 226),
                                       Color.fromARGB(255, 132, 194, 229)
                                     ]
                                     )
                                     ),
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 10,right: 10),
                                   child: Row(
                                    
                                     children: [
                                       const Text(
                                         "Hindi",
                                         style: TextStyle(
                                             color: Colors.white, fontSize: 23),
                                       ),
                                       SizedBox(
                                         width: 0.3.sw,
                                       ),
                                       const Text(
                                         "Code No. 20",
                                         style: TextStyle(
                                             color: Colors.white, fontSize: 18),
                                       )
                                     ],
                                   ),
                                 ),
                               )
                             ],
                           ),
                         ),
                         Padding(
                           padding:
                               const EdgeInsets.only(right: 30, left: 30, top: 20),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               const Text(
                                 "Theory",
                                 style: TextStyle(
                                     color: Colors.white, fontSize: 18),
                               ),
                             
                               Row(
                                 
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(right: 10),
                                     child: Image.asset("assets/images/teacher.png",width: 20,height: 20,),
                                   ),
                                   const Text(
                                     "shriram sharma",
                                     style: TextStyle(
                                         color: Colors.white, fontSize: 18),
                                   ),
                                 ],
                               )
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             
          ],
        ),
      )),
    );
  }
}
