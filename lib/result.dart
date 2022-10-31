import 'package:bmi/constans.dart';
import 'package:flutter/material.dart';
import 'bmiBlock.dart';
import 'BottomFunc.dart';
import 'homeScreenPage.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiState, required this.bmiResult, required this.content});

  String bmiState;
  String bmiResult;
  String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMI Calculate'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Your Results',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReBmiBlock(
                    colors: Colors.deepPurple,
                    customContent: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bmiState,
                          style: kNormal,
                        ),
                        Text(
                          bmiResult,
                          style: kBmiStyle,
                        ),
                        Text(
                          content,
                          style: kFontStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomFuncButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'ReCalculate',
          ),
        ],
      ),
    );
  }
}
