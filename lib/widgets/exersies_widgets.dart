import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:slogan_app/Models/exercise_model.dart';

class ExerciseWidgets extends StatelessWidget {
  final ExerciseModel exerciseModel;

  const ExerciseWidgets({
    super.key,
    required this.exerciseModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: exerciseModel.onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.h,
              vertical: 2.h,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                exerciseModel.imageName,
                fit: BoxFit.fill,
                height: 19.h,
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
          ),
          Container(
            height: 10.h,
            padding: EdgeInsets.symmetric(
              horizontal: 3.h,
              vertical: 2.h,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 2.h,
              vertical: 2.h,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.h),
              color: Colors.black.withOpacity(.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  exerciseModel.exercisesTitle,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontFamily: "SpaceMono",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  exerciseModel.exercisesNumber,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontFamily: "SpaceMono",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
