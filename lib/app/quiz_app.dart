import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/view/splash/screens/splash_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: FontName.kFontMontserrat),
      home: SplashScreen(),
    );
  }
}
