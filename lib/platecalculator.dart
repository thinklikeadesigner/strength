import 'package:flutter/material.dart';
import 'package:strength/dumbellcalculator.dart';

class PlateCalculatorApp extends StatefulWidget {
  @override
  _PlateCalculatorAppState createState() => _PlateCalculatorAppState();
}

class _PlateCalculatorAppState extends State<PlateCalculatorApp> {
  double BARBELL_WEIGHT = 45.0; // Weight of the barbell in pounds
  List<double> PLATE_WEIGHTS = [45.0, 35.0, 25.0, 10.0, 5.0, 2.5];

  double desiredWeight = 0.0;
  List<int> plateCount = [];

  @override
  void initState() {
    super.initState();

    plateCount = List<int>.filled(PLATE_WEIGHTS.length, 0);
  }

  void calculatePlates() {
    setState(() {
      double remainingWeight = (desiredWeight - BARBELL_WEIGHT) / 2;
      plateCount = List<int>.filled(PLATE_WEIGHTS.length, 0);

      for (int i = 0; i < PLATE_WEIGHTS.length; i++) {
        while (remainingWeight >= PLATE_WEIGHTS[i]) {
          plateCount[i]++;
          remainingWeight -= PLATE_WEIGHTS[i];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                desiredWeight = double.tryParse(value) ?? 0.0;
              });
            },
            decoration: InputDecoration(
              labelText: 'Desired Total Weight > 45 lbs',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              calculatePlates();
            },
            child: Text('Calculate Plates'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: PLATE_WEIGHTS.length,
              itemBuilder: (BuildContext context, int index) {
                if (plateCount[index] > 0) {
                  return ListTile(
                    title: Text('${PLATE_WEIGHTS[index]} lbs'),
                    trailing: Text('${plateCount[index]} plates'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
