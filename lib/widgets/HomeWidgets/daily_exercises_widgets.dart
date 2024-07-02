import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:slogan_app/Models/exercise_home_model.dart';

import '../dialog_border.dart';
import '../exersies_list.dart';

class DailyExercisesWidgets extends StatelessWidget {
  const DailyExercisesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                alignment: Alignment.centerLeft,
                height: 25.h,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(2.h),
                ),
                child: Text(
                  "Add new exercise today",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontFamily: "SpaceMono",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: -1.h,
                child: InkWell(
                  onTap: () {
                    exerciseController.clear();
                    dateController.clear();
                    showAlertDialog(
                        context: context,
                        onTap: () {
                          exerciseModels.add(
                            ExerciseHomeModel(
                                exerciseName: exerciseController.text,
                                dateTime: dateController.text,
                                states: "pending"),
                          );

                          Navigator.pop(context);
                        });
                  },
                  child: CircleAvatar(
                    radius: 5.h,
                    backgroundImage: const AssetImage("assets/add.gif"),
                  ),
                ),
              )
            ],
          ),
        ),
        const ExerciseList(),
      ],
    );
  }
}
