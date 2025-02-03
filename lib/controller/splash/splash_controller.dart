import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/route_manger.dart';

class SplashController {
  static void goToOnBoardingScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.kOnBoardingScreen);
  }
}
