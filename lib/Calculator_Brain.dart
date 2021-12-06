import 'package:flutter/cupertino.dart';
import 'dart:math';

class CalculatorBrain {

CalculatorBrain({@required this.height,@required this.weight});

final int height;
final int weight;

double _bmi;

String caculateBMI() {
  _bmi = weight / pow(height/100 , 2);
  return _bmi.toStringAsFixed(1);
}
String resultsbmi () {
    if(_bmi >= 25)
    {
      return "OVERWEIGHT";
    }
    else if(_bmi<18.5) {
      return 'UNDER-WEIGHT';
    }
    else {
      return 'Normal';
    }
}

String getInterpretation() {
    if(_bmi >= 25)
    {
      return "try to reduce some weight";
    }
    else if(_bmi<18.5) {
      return 'you are pretty lean , try Adding some pounds';
    }
    else {
      return 'youre normal , try maintaining it';
    }
}
}
