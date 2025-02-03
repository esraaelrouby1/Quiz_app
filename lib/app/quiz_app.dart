import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/route_manger.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutesManger.routes,
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(fontFamily:GoogleFonts.lobste ,),
      initialRoute: RoutesName.kSplashScreen,
    );
  }
}
