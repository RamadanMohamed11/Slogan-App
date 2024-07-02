import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DrawerWidgets extends StatelessWidget {
  const DrawerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 13.h,
              backgroundColor: Colors.green,
              child: CircleAvatar(
                radius: 12.h,
                backgroundImage: const AssetImage(
                  "assets/easyLearn.jpg",
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            const Text(
              "This app developed by EasyLearn Academy",
              style: TextStyle(
                fontSize: 23,
                fontFamily: "SpaceMono",
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
