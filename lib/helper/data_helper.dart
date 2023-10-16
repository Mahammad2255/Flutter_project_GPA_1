import 'package:flutter/material.dart';

import '../model/lesson.dart';

class DataHelper {

  static calculateAvg(){
    double sumGrade = 0;
    double sumCredit = 0;

    allEnteredLessons.forEach((element) { 

      sumGrade = sumGrade + (element.creditValue * element.letterValue);
      sumCredit += element.creditValue;
    });
    return sumGrade / sumCredit;
  }
  static List<Lesson> allEnteredLessons = []; 
  static addLesson(Lesson lesson){
    allEnteredLessons.add(lesson);
  }
  static List<String> _AllLessonsLetters() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _LetterToNumber(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonsLetters() {
    return _AllLessonsLetters()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _LetterToNumber(e),
            ))
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

 static List<DropdownMenuItem<double>> allLessonCredits() {
  return _allCredits().map<DropdownMenuItem<double>>(
    (e) => DropdownMenuItem<double>(
      child: Text(
        e.toString(),
      ),
      value: e.toDouble(),
    ),
  ).toList();
}

}
