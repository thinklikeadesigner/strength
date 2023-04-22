import 'package:flutter/material.dart';

class DumbbellCalculator extends StatefulWidget {
  final String resultText;

  DumbbellCalculator({required this.resultText});

  @override
  State<DumbbellCalculator> createState() => _DumbbellCalculatorState();
}

class _DumbbellCalculatorState extends State<DumbbellCalculator> {
  List<int> DUMBBELL_WEIGHTS = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];
  int selectedWeight = 5;
  int cableWeight = 10; // Initial value for cableWeight

  void calculatePlates() {
    setState(() {
      cableWeight =
          selectedWeight * 2; // Update the cableWeight based on selectedWeight
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<int>(
            value: selectedWeight,
            hint: Text('Select Dumbbell Weight'),
            onChanged: (int? value) {
              setState(() {
                selectedWeight = value ?? 5;
                calculatePlates(); // Call the calculatePlates method on value change
              });
              print('Selected dumbbell weight: $value');
            },
            items: DUMBBELL_WEIGHTS.map((int weight) {
              return DropdownMenuItem<int>(
                value: weight,
                child: Text('$weight lbs'),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text(
              'Cable Weight: $cableWeight lbs'), // Display the calculated cableWeight
        ],
      ),
    );
  }
}
