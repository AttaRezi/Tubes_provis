import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculate extends ChangeNotifier{

  double bmi = 0;
  int weight = 0;
  int height = 0;
  late String date;
  late String resultCategory;
  late String comment;
  late Color colors;

  void count(int weight, int height){ // to count bmi value

    bmi = (weight / pow(height / 100, 2));
    notifyListeners();
  }

  void addDate(String dateInput){ // setter for date
    date = dateInput;
    notifyListeners();
  }

  void getResultCategory(){ // to get result category
    if (bmi >= 30){
      resultCategory = 'OBESE';
    } else if (bmi >= 25) {
      resultCategory = 'OVERWEIGHT';
    } else if (bmi >= 18.5) {
      resultCategory ='NORMAL';
    } else {
      resultCategory = 'UNDERWEIGHT';
    }
    notifyListeners();
  }

  void getColor(){ // to get color for different color font in result page

    if (bmi >= 30){
      colors = Colors.red;
    } else if (bmi >= 25) {
      colors = Colors.orange;
    } else if (bmi >= 18.5) {
      colors = Colors.green;
    } else {
      colors = Colors.yellow;
    }
    notifyListeners();
  }

}