import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../exercise_data_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/Motivate 1.jpg',
    'assets/Motivate 2.jpg',
    'assets/Motivate 3.jpg',
    'assets/Motivate 4.jpg',
    'assets/Motivate 6.jpg',
    'assets/Motivate 7.jpg',
    'assets/Motivate 8.jpg',
    'assets/Motivate 9.jpg',
    'assets/Motivate 10.jpg',
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3.h),
              child: Image.asset(
                _images[_currentIndex],
                height: 35.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const ExerciseDataWidgets(),
          ],
        ),
      ),
    );
  }
}
