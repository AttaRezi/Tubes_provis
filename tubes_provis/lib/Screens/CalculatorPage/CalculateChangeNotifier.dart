import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculate extends ChangeNotifier{
  double bmi = 0;
  int weight = 0;
  int height = 0;
  late String resultCategory;
  late String comment;
  late Color colors;

  void count(int weight, int height){

    bmi = (weight / pow(height / 100, 2));
    notifyListeners();
  }

  void getResultCategory(){
    if (bmi >= 25) {
      resultCategory = 'OVERWEIGHT';
    } else if (bmi >= 18.5) {
      resultCategory ='NORMAL';
    } else {
      resultCategory = 'UNDERWEIGHT';
    }
    notifyListeners();
  }

  void getColor(){
    if (bmi >= 25) {
      colors = Colors.red;
    } else if (bmi >= 18.5) {
      colors = Colors.green;
    } else {
      colors = Colors.yellow;
    }
    notifyListeners();
  }

  void getComment() {
    if (bmi >= 25) {
      comment = 'You have higher \nthan normal weight';
    } else if (bmi >= 18.5) {
      comment = 'Awesome! You have \na healthy body. Stay happy.';
    } else {
      comment = 'You have lower \nthan normal weight';
    }
    notifyListeners();
  }
}