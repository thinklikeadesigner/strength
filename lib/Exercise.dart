// class Exercise {
//   final String name;
//   final List<String> targets;

//   const Exercise(this.name, this.targets);
// }

// final List<Exercise> exercises = [
//   const Exercise('barbell bench press', ['chest', 'shoulders', 'triceps']),
//   const Exercise('Barbell overhead press', ['shoulders', 'triceps']),
//   const Exercise('single leg deadlift', ['hamstrings', 'glutes', 'core']),
//   const Exercise('seated calf raise', ['calves']),
//   const Exercise('Squats', ['quads', 'hamstrings', 'glutes', 'core']),
//   const Exercise('Hip thrusts', ['glutes', 'hamstrings']),
//   const Exercise('Barbell curls', ['biceps']),
//   const Exercise('Close-grip bench press', ['triceps', 'chest', 'shoulders']),
//   const Exercise('Wrist curls', ['forearms']),
//   const Exercise('Barbell shrugs', ['traps', 'shoulders']),
//   const Exercise('deadlift', ['back', 'hamstrings', 'glutes', 'core']),
//   const Exercise('Planks', ['core']),
//   const Exercise('Deadlifts', ['back', 'hamstrings', 'glutes', 'core']),
//   const Exercise(
//       'barbell decline bench press', ['chest', 'shoulders', 'triceps']),
//   const Exercise('Dumbbell Seated overhead Press', ['shoulders', 'triceps']),
//   const Exercise('calf raise', ['calves']),
//   const Exercise('Front squats', ['quads', 'core']),
//   const Exercise('Glute bridges', ['glutes', 'hamstrings', 'core']),
//   const Exercise('Dumbbell curls', ['biceps']),
//   const Exercise('Overhead tricep extensions', ['triceps']),
//   const Exercise('Reverse wrist curls', ['forearms']),
//   const Exercise('Dumbbell shrugs', ['traps', 'shoulders']),
//   const Exercise('Barbell rows', ['back', 'biceps', 'core']),
//   const Exercise('Side planks', ['core']),
//   const Exercise('Good mornings', ['hamstrings', 'back']),
//   const Exercise(
//       'barbell incline bench press', ['chest', 'shoulders', 'triceps']),
//   const Exercise('dumbbell overhead press', ['shoulders', 'triceps']),
//   const Exercise('sumo squats', ['quads', 'hamstrings', 'glutes', 'core']),
//   const Exercise('Leg press', ['quads', 'hamstrings', 'glutes']),
//   const Exercise(
//       'Bulgarian split squats', ['quads', 'hamstrings', 'glutes', 'core']),
//   const Exercise('Preacher curls', ['biceps']),
//   const Exercise('Skull crushers', ['triceps']),
//   const Exercise('Farmer\'s walks', ['forearms', 'core', 'shoulders']),
//   const Exercise('Upright rows', ['shoulders', 'traps']),
//   const Exercise('T-bar rows', ['back', 'biceps']),
//   const Exercise('toe-to-bar', ['core']),
//   const Exercise('Hyperextensions', ['back', 'glutes', 'hamstrings']),
//   const Exercise(
//       'Dumbell Incline Bench Press.', ['chest', 'shoulders', 'triceps']),
//   const Exercise('dumbbell Lateral Raise', ['shoulders']),
//   const Exercise('kettlebell swing', ['hamstrings', 'glutes', 'core']),
//   const Exercise('hack squats', ['quads', 'hamstrings', 'glutes']),
//   const Exercise('Cable kickbacks', ['glutes']),
//   const Exercise('Tricep kickbacks', ['triceps']),
//   const Exercise('Plate pinches', ['forearms']),
//   const Exercise('Face pulls', ['shoulders', 'back'])
// ];

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
