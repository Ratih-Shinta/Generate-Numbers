import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var inputNumber = 0.obs;
  var randomNumbers = <int>[].obs;
  var boxColors = <Color>[].obs;

  void generateNumbers(int number) {
    randomNumbers.clear();
    boxColors.clear();

    for (int i = 1; i <= number; i++) {
      randomNumbers.add(i);
      boxColors.add(Colors.greenAccent);
    }
  }

  void shuffleNumberAtIndex(int index) {
    if (index >= 0 && index < randomNumbers.length) {
      var randomPool = List.generate(inputNumber.value, (index) => index + 1);
      randomPool.shuffle();

      randomNumbers[index] = randomPool.first;
    }
  }

  void toggleBoxColor(int index) {
    if (index >= 0 && index < boxColors.length) {
      if (boxColors[index] == Colors.greenAccent) {
        boxColors[index] = Colors.red;
      } else if (boxColors[index] == Colors.red) {
        boxColors[index] = Colors.blue;
      } else {
        boxColors[index] = Colors.greenAccent;
      }
    }
  }
}
