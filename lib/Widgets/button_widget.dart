import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? buttonColor;
  final double bh;
  final double bw;
  final double borderredius;
  final Widget child;

  const ButtonWidget({super.key, this.onTap, this.buttonColor, required this.bh, required this.borderredius, required this.bw, required this.child,});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap ,
      child: Container(
        alignment: Alignment.center,
      width: bw,
      height: bh,
     decoration: BoxDecoration(
      color: buttonColor,
      borderRadius: BorderRadius.circular(borderredius),
      ),
        child: child
      ));
  }
}