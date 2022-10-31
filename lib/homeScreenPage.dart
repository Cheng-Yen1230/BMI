import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sexBlock.dart';
import 'bmiBlock.dart';
import 'constans.dart';
import 'BottomFunc.dart';
import 'CalBmiCenter.dart';
import 'result.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum SexType { Male, FeMale }

SexType selectSex = SexType.Male;
double kheight = 170;
int kage = 21;
double kweight = 52;
double bmi = 0;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void updateSlider(value) {
      setState(() {
        kheight = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReBmiBlock(
                    getOnPressed: () {
                      setState(() {
                        selectSex = SexType.Male;
                      });
                    },
                    colors: (selectSex == SexType.Male)
                        ? kmaleUpdateColor
                        : kdefaultMalePressedColor,
                    customContent: ReMaleAndFeMaleBlock(
                      sex: 'Male',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                    child: ReBmiBlock(
                  getOnPressed: () {
                    setState(() {
                      selectSex = SexType.FeMale;
                    });
                  },
                  colors: (selectSex == SexType.FeMale)
                      ? kfeMaleUpdateColor
                      : kdefaultFeMalePressedColor,
                  customContent: ReMaleAndFeMaleBlock(
                    sex: 'FeMale',
                    icon: FontAwesomeIcons.venus,
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReBmiBlock(
                    colors: selectColor,
                    customContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: kFontStyle),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              kheight.toStringAsFixed(0),
                              style: kheightAndWeightAndAgeStyle,
                            ),
                            Text('cm')
                          ],
                        ),
                        Slider(
                          value: kheight,
                          onChanged: (newValue) {
                            updateSlider(newValue);
                          },
                          onChangeStart: (newValue) {
                            updateSlider(newValue);
                          },
                          onChangeEnd: (newValue) {
                            updateSlider(newValue);
                          },
                          min: 40,
                          max: 300,
                          mouseCursor: MouseCursor.uncontrolled,
                          activeColor: Colors.lightBlueAccent,
                          inactiveColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReBmiBlock(
                    colors: selectColor,
                    customContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kFontStyle),
                        Text(
                          kweight.toStringAsFixed(0),
                          style: kheightAndWeightAndAgeStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              customMethod: () {
                                setState(() {
                                  kweight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              customMethod: () {
                                setState(() {
                                  kweight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReBmiBlock(
                    colors: selectColor,
                    customContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kFontStyle),
                        Text(
                          kage.toString(),
                          style: kheightAndWeightAndAgeStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              customMethod: () {
                                setState(() {
                                  kage--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              customMethod: () {
                                setState(() {
                                  kage++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomFuncButton(
            onTap: () {
              var calculateBmiCenter =
                  CalculateBmiCenter(weight: kweight, height: kheight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiState: calculateBmiCenter.getBmiState(),
                    bmiResult: calculateBmiCenter.getBmiResult(),
                    content: calculateBmiCenter.getBmiContent(),
                  ),
                ),
              );
            },
            text: 'Calculate',
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.customMethod});

  final IconData? icon;
  final void Function()? customMethod;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: customMethod,
      child: Icon(icon),
      fillColor: Colors.lightBlueAccent,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
    );
  }
}
