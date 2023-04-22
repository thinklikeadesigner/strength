import 'package:flutter/material.dart';

class OneRepMaxCalculator extends StatefulWidget {
  @override
  _OneRepMaxCalculatorState createState() => _OneRepMaxCalculatorState();
}

class _OneRepMaxCalculatorState extends State<OneRepMaxCalculator> {
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
        title: Text('One Rep Max Calculator'),
      ),
      body: Padding(
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
                // Parse the custom percentage value and pass it to the _calculatePercentage() method
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
                // Show dialog to allow user to input custom percentage
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Enter Custom Percentage'),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          // Parse the custom percentage value and pass it to the _calculatePercentage() method
                          double customPercentage =
                              double.tryParse(value) ?? 0.0;
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
              'Ending Weight: ${endingWeight.toStringAsFixed(2)} lbs', // Display the ending weight
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
