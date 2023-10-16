import 'package:flutter/material.dart';

import '../const/app_constants.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int lesson_number;

  const ShowAverage({required this.lesson_number, required this.average, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(lesson_number==1)
          Text(
          '$lesson_number subject',  
          style: Constants.lesson_number_style,
          
        )
        else if(lesson_number > 1)
           Text(
          '$lesson_number subjects', 
          style: Constants.lesson_number_style,
          
        )
        else
           Text(
          'Select subject', 
          style: Constants.lesson_number_style,
          
        ),
          
        
        
        
        Text(
          average >=0 ? '${average.toStringAsFixed(2)}': '0.0',
          style: Constants.average_style,
          ),
        Text(
          'Average',
          style: Constants.lesson_number_style,
          ),

      ],
    );
  }
}