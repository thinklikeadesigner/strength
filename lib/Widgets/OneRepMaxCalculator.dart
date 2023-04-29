import 'package:flutter/material.dart';

class OneRepMaxCalculatorWidget extends StatefulWidget {
  @override
  _OneRepMaxCalculatorWidgetState createState() =>
      _OneRepMaxCalculatorWidgetState();
}

class _OneRepMaxCalculatorWidgetState extends State<OneRepMaxCalculatorWidget> {
  double weight = 0.0;
  double percentage = 0.0;
  double endingWeight = 0.0;

  void _calculatePercentage(double customPercentage) {
    setState(() {
      percentage = customPercentage / 100.0;
      endingWeight = weight * percentage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                weight = double.tryParse(value) ?? 0.0;
              });
            },
            decoration: InputDecoration(
              labelText: 'Enter weight (in lbs)',
              hintText: '0.0',
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              double customPercentage = double.tryParse(value) ?? 0.0;
              _calculatePercentage(customPercentage);
            },
            decoration: InputDecoration(
              labelText: 'Enter custom percentage',
              hintText: '0.0',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Enter Custom Percentage'),
                    content: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        double customPercentage = double.tryParse(value) ?? 0.0;
                        _calculatePercentage(customPercentage);
                      },
                      decoration: InputDecoration(
                        labelText: 'Custom Percentage',
                        hintText: '0.0',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Choose Custom Percentage'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Percentage of 1 Rep Max: ${percentage.toStringAsFixed(2)}%',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            'Ending Weight: ${endingWeight.toStringAsFixed(2)} lbs',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
