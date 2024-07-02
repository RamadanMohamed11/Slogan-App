import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Models/exercise_home_model.dart';

class ExerciseDateList extends StatefulWidget {
  const ExerciseDateList({super.key});

  @override
  State<ExerciseDateList> createState() => _ExerciseDateListState();
}

class _ExerciseDateListState extends State<ExerciseDateList> {
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
        exercise = exerciseModels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          alignment: Alignment.center,
          height: 2.h,
          color: Colors.red,
          child: Text(
            "Delete the exercise",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontFamily: "SpaceMono",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        key: ValueKey<ExerciseHomeModel>(exercise[index]),
        onDismissed: (direction) {
          setState(() {
            exercise.removeAt(index);
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              title: Text(
                exercise[index].exerciseName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                exercise[index].dateTime,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: Size(35.w, 6.h),
                ),
                onPressed: () {
                  if (exerciseModels[index].states == 'pending') {
                    exerciseModels[index].states = 'completed';
                  } else {
                    exerciseModels[index].states = 'pending';
                  }
                  setState(() {});
                },
                child: Text(
                  exercise[index].states,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: exerciseModels[index].states == "pending"
                          ? Colors.deepPurple
                          : Colors.blue),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            )
          ],
        ),
      ),
      itemCount: exercise.length,
    );
  }
}
