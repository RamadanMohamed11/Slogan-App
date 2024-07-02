import 'package:flutter/material.dart';

import '../Models/exercise_home_model.dart';
import '../components/custom_text_form.dart';

GlobalKey<FormState> form = GlobalKey();

void showAlertDialog({
  required BuildContext context,
  required Function() onTap,
}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: Colors.black,
          elevation: 0,
          contentPadding: EdgeInsets.all(
            MediaQuery.sizeOf(context).height / 20,
          ),
          title: const Text(
            "Enter the new exercise",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "SpaceMono",
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          content: Form(
            key: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextForm(
                  labelText: "Exercise",
                  controller: exerciseController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Exercise ';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 20,
                ),
                CustomTextForm(
                  labelText: "Date",
                  controller: dateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Date ';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: MediaQuery.sizeOf(context).width / 5,
                height: MediaQuery.sizeOf(context).height / 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).width / 2),
                  color: Colors.green,
                ),
                child: Text(
                  'Add',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ),
            ),
          ],
        );
      });
}
