
import 'package:flutter/material.dart';
import 'constans.dart';


class BottomFuncButton extends StatelessWidget {

  BottomFuncButton({required this.onTap, required this.text});
  final Function()? onTap;
  final text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        color: kbottomColor,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}