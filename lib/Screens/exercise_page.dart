import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExercisePage extends StatelessWidget {
  final String exerciseType;

  const ExercisePage({super.key, required this.exerciseType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: ListView.builder(
            itemCount: exerciseType.toLowerCase() == "shoulder"
                ? 7
                : exerciseType.toLowerCase() == "back"
                    ? 6
                    : 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The exercise performs 10 reps in 3 sets",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.h),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/${exerciseType.toLowerCase()}/${index + 1}.gif"),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
