import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text_form.dart';

class CalCalculator extends StatefulWidget {
  const CalCalculator({super.key});

  @override
  State<CalCalculator> createState() => _CalCalculatorState();
}

class _CalCalculatorState extends State<CalCalculator> {
  GlobalKey<FormState> form = GlobalKey();

  TextEditingController ageController = TextEditingController();

  TextEditingController weightController = TextEditingController();

  TextEditingController heightController = TextEditingController();

  int cal = 0;

  String gender = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextForm(
                labelText: 'Age',
                controller: ageController,
                labelTextColor: Colors.white,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Age ';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomTextForm(
                labelText: 'Weight in Kilo grams',
                controller: weightController,
                labelTextColor: Colors.white,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Weight in KG ';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomTextForm(
                labelText: 'Height In Cm ',
                controller: heightController,
                labelTextColor: Colors.white,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Height In Cm ';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    title: 'Male',
                    onPressed: () {
                      gender = 'Male';
                      setState(() {});
                    },
                    backgroundColor:
                        gender == 'Male' ? Colors.green : Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.sp,
                  ),
                  CustomButton(
                    title: 'Female',
                    onPressed: () {
                      gender = 'Female';
                      setState(() {});
                    },
                    backgroundColor:
                        gender == 'Female' ? Colors.green : Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              CustomButton(
                title: 'Calculate the calories you need in day',
                fontSize: 12.sp,
                onPressed: () {
                  if (form.currentState!.validate()) {
                    if (gender == 'Male') {
                      cal = (10 * double.parse(weightController.text) +
                              6.25 * double.parse(heightController.text) -
                              5 * double.parse(ageController.text) +
                              5)
                          .toInt();
                    } else if (gender == 'Female') {
                      cal = (10 * double.parse(weightController.text) +
                              6.25 * double.parse(heightController.text) -
                              5 * double.parse(ageController.text) -
                              161)
                          .toInt();
                    }
                    setState(() {});
                  }
                },
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "The Calories you need is ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "SpaceMono",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    cal.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "SpaceMono",
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
