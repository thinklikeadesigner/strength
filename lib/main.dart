import 'package:flutter/material.dart';
import 'package:strength/dumbellcalculator.dart';
import 'package:strength/percentof1rm.dart';
import 'package:strength/platecalculator.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App', // Set app title
      theme: ThemeData(
        // Define app theme
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              // Use Expanded widget to take up remaining space
              child: DumbbellCalculator(resultText: 'Result Text 1'),
            ),
            Expanded(
              // Use Expanded widget to take up remaining space
              child: PlateCalculatorApp(),
            ),
            ElevatedButton(
              onPressed: () {
                // Use Navigator to navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OneRepMaxCalculator(), // Replace with the page you want to navigate to
                  ),
                );
              },
              child: Text('Go to Second Page'),
            )
          ],
        ),
      ),
    );
  }
}
