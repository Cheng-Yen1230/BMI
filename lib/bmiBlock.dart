import 'package:flutter/material.dart';


class ReBmiBlock extends StatelessWidget {
  ReBmiBlock({required this.colors, this.customContent, this.getOnPressed});
  final Color colors;
  final Widget? customContent;
  final getOnPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getOnPressed,
      child: Container(
        child: customContent,
        margin: EdgeInsets.all(15),
        decoration:
        BoxDecoration(color: colors, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

