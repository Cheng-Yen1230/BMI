import 'package:flutter/material.dart';

const double iconSize = 80;

class ReMaleAndFeMaleBlock extends StatelessWidget {
  ReMaleAndFeMaleBlock({this.sex,  this.icon});
  final sex;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          sex,
          style: TextStyle(fontSize: 25, color: Colors.white),
        )
      ],
    );
  }
}