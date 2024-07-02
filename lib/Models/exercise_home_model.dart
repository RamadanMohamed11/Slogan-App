import 'package:flutter/material.dart';

class ExerciseHomeModel {
  final String exerciseName;
  final String dateTime;
  late String states;

  ExerciseHomeModel({
    required this.exerciseName,
    required this.dateTime,
    required this.states,
  });
}

TextEditingController exerciseController = TextEditingController();
TextEditingController dateController = TextEditingController();
List<ExerciseHomeModel> exerciseModels = [
  ExerciseHomeModel(
      exerciseName: "Chest game", dateTime: "22/7 5:00", states: "pending"),
  ExerciseHomeModel(
      exerciseName: "back game", dateTime: "22/7 6:00", states: "completed")
];

int index = 0;
List<ExerciseHomeModel> exercise = [];
