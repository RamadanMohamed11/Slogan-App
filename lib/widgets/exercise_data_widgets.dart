import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Models/exercise_home_model.dart';
import 'exercise_date_list.dart';

class ExerciseDataWidgets extends StatefulWidget {
  const ExerciseDataWidgets({super.key});

  @override
  State<ExerciseDataWidgets> createState() => _ExerciseDataWidgetsState();
}

class _ExerciseDataWidgetsState extends State<ExerciseDataWidgets> {
  @override
  void initState() {
    super.initState();
    timerExercise();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Timer? timer;

  void timerExercise() {
    timer = Timer.periodic(const Duration(seconds: 0), (Timer timer) {
      setState(() {
        index = exerciseModels.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(2.h),
      ),
      child: index != 0
          ? const ExerciseDateList()
          : Center(
              child: Text(
                "No  training time Now !",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontFamily: "SpaceMono",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
