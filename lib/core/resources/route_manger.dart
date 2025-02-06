import 'package:flutter/material.dart';
import 'package:quiz_app/view/login/screens/login_screen.dart';
import 'package:quiz_app/view/on_boarding/screens/on_boarding_screen.dart';
import 'package:quiz_app/view/quiz/screens/quiz_screen.dart';
import 'package:quiz_app/view/splash/screens/splash_screen.dart';

class RoutesManger {
  static Map<String, WidgetBuilder> routes = {
    RoutesName.kSplashScreen: (context) => SplashScreen(),
    RoutesName.kOnBoardingScreen: (context) => OnBoardingScreen(),
    RoutesName.kLoginScreen: (context) => LoginScreen(),
    RoutesName.kQuizScreen: (context) => QuizScreen(),
  };
}

class RoutesName {
  static const String kSplashScreen = "/SplashScreen";
  static const String kOnBoardingScreen = "/OnBoardingScreen";
  static const String kLoginScreen = "/LoginScreen";
  static const String kQuizScreen = "/QuizScreen";
}
