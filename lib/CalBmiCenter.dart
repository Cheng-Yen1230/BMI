import 'homeScreenPage.dart';
import 'dart:math';

class CalculateBmiCenter {
  CalculateBmiCenter({required this.height, required this.weight});

  final double height;
  final double weight;

  String getBmiResult() {
    //  回傳 BMI 計算結果
    double bmiResult = weight / pow(height / 100, 2); // 除非是用公尺不然要除 100
    return bmiResult.toStringAsFixed(1);
  }

  String getBmiState() {
    // 返回狀態

    double bmiResult = double.parse(getBmiResult()); // bug

    if (bmiResult < 18.5) {
      return 'UnderWeight';
    } else if (bmiResult <= 24) {
      return 'Normal';
    } else if (bmiResult <= 27) {
      return 'OverWeight';
    } else if (bmiResult <= 30) {
      return 'Obese';
    } else {
      return 'Extremly Obese';
    }
  }

  String getBmiContent() {
    // 返回提示訊息

    double bmiResult = double.parse(getBmiResult());

    if (bmiResult < 18.5) {
      return '太瘦了！ 要多吃一點';
    } else if (bmiResult <= 24) {
      return '太棒了！ 做得好';
    } else if (bmiResult <= 27) {
      return '還不錯！但要注意一下囉～';
    } else if (bmiResult <= 30) {
      return '已經有點肥胖了';
    } else {
      return 'NO 過胖了';
    }
  }
}
