import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/strings_values.dart';

class CustomButtonSplashScreen extends StatelessWidget {
  const CustomButtonSplashScreen({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 350,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: ColorManger.kWhiteColor,
        ),
        child: Text(
          StringsValues.kGetStarted,
          style: TextStyle(
            fontSize: FontSize.f21,
            color: ColorManger.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
