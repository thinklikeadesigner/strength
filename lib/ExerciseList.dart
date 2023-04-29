import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:strength/Widgets/ExerciseSearch.dart';

class Exercise {
  final String name;
  final String muscleGroup;
  final String equipment;

  Exercise(
      {required this.name, required this.muscleGroup, required this.equipment});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      muscleGroup: json['muscleGroup'],
      equipment: json['equipment'],
    );
  }
}

class ExerciseList extends StatefulWidget {
  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  List<Exercise> exercises = [];
  List<bool> isChecked = [];

  @override
  void initState() {
    super.initState();

    loadExercises();
  }

  Future<void> loadExercises() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/exercises.json");
    final jsonResult = json.decode(data);
    print(data);
    List<Exercise> loadedExercises = [];
    List<bool> initialChecked = [];

    for (var exercise in jsonResult) {
      loadedExercises.add(Exercise(
          name: exercise['name'],
          muscleGroup: exercise['muscleGroup'],
          equipment: exercise['equipment']));
      initialChecked.add(false);
    }
    setState(() {
      exercises = loadedExercises;
      isChecked = initialChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select exercises:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 16),
          Expanded(
            child: exercises.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        title: Text(exercises[index].name),
                        value: isChecked[index],
                        onChanged: (value) {
                          setState(() {
                            isChecked[index] = value!;
                          });
                        },
                      );
                    },
                  ),
          ),
          SizedBox(height: 16),
          Text(
            'Selected exercises:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(
              exercises.length,
              (index) {
                if (isChecked[index]) {
                  return Chip(
                    label: Text(exercises[index].name),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
