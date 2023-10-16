import 'package:first_project/const/app_constants.dart';
import 'package:first_project/widgets/calculate_average_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate dynamic average',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: CalculateAveragePage(),
    );
  }
}