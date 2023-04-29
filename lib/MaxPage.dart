import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:strength/ExerciseList.dart';
import 'package:strength/SearchPage.dart';
import 'package:strength/Widgets/OneRepMaxCalculator.dart';

class MaxPage extends StatefulWidget {
  @override
  _MaxPageState createState() => _MaxPageState();
}

class _MaxPageState extends State<MaxPage> {
  double weight = 0.0;
  double percentage = 0.0;
  double endingWeight = 0.0; // Added variable to store the ending weight

  void _calculatePercentage(double customPercentage) {
    setState(() {
      // Calculate the percentage of 1 rep max based on user input or custom percentage
      percentage = customPercentage / 100.0;
      endingWeight = weight * percentage; // Calculate the ending weight
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercises'),
        ),
        body: ExerciseList());
  }
}
