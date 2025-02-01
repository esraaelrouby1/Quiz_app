import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/strings_values.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.kPrimaryColor,
      body: Center(
        child: Text(
          StringsValues.kLogo,
          style: TextStyle(
            color: ColorManger.kWhiteColor,
            // fontWeight: FontWeight.bold,
            fontSize: 350,
          ),
        ),
      ),
    );
  }
}
