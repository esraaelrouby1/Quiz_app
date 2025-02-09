import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/const_values.dart';
import 'package:quiz_app/core/resources/route_manger.dart';

class QuizScreenController {
  int countQuestions = 0;
  List<int> listCorrectanswers = [];
  //precent animation
  late AnimationController animationController;
  double animationProgressPercent = 0.0;
  Tween<double> tween = Tween(begin: 0.0, end: 1.0);

//GroupValueIndex
  late StreamController<int> streamControllerGroupValueIndex;
  late Sink<int> inputDataGroupValueIndex;
  late Stream<int> outputDataGroupValueIndex;
  int groubValueIndex = -1;

//StreamTimer
  late StreamController<int> streamControllerTimer;
  late Sink<int> inputDataTimer;
  late Stream<int> outputDataTimer;
  int currentTimeSec = 0;

//StreamAnimationStatus===>> ...Progress
  late StreamController<double> streamControllerAnimationProgress;
  late Sink<double> inputDataAnimationProgress;
  late Stream<double> outputDataAnimationProgress;

//Stream Question
  late StreamController<int> streamControllerQuestion;
  late Sink<int> inputDataQuestion;
  late Stream<int> outputDataQuestion;
  int currentQuestion = 0;

//stream Question counter
  late StreamController<String> streamControllerQuestionCouter;
  late Sink<String> inputDataQuestionCounter;
  late Stream<String> outputDataQuestionCounter;

//for next button
  late StreamController<bool> streamControllerButtonStatus;
  late Sink<bool> inputDataButtonStatus;
  late Stream<bool> isActiveOutputStream;
  bool isNextActive = false;

  late BuildContext _context;

//------------------------constructor----------------------------//

  QuizScreenController(
      SingleTickerProviderStateMixin vsync, BuildContext context) {
    _context = context;
    countQuestions = ConstValues.quizQuestions.length;

    animationController =
        AnimationController(vsync: vsync, duration: Duration(seconds: 31));

//GroupValueIndex
    streamControllerGroupValueIndex = StreamController();
    inputDataGroupValueIndex = streamControllerGroupValueIndex.sink;
    outputDataGroupValueIndex =
        streamControllerGroupValueIndex.stream.asBroadcastStream();
    inputDataGroupValueIndex.add(groubValueIndex);

//StreamTimer
    streamControllerTimer = StreamController();
    inputDataTimer = streamControllerTimer.sink;
    outputDataTimer = streamControllerTimer.stream.asBroadcastStream();
    inputDataTimer.add(currentTimeSec);

//StreamAnimationStatus==>progress
    streamControllerAnimationProgress = StreamController();
    inputDataAnimationProgress = streamControllerAnimationProgress.sink;
    outputDataAnimationProgress =
        streamControllerAnimationProgress.stream.asBroadcastStream();
    inputDataAnimationProgress.add(animationProgressPercent);

// Question
    streamControllerQuestion = StreamController();
    inputDataQuestion = streamControllerQuestion.sink;
    outputDataQuestion = streamControllerQuestion.stream.asBroadcastStream();
    inputDataQuestion.add(currentQuestion);

//stream Question counter
    streamControllerQuestionCouter = StreamController();
    inputDataQuestionCounter = streamControllerQuestionCouter.sink;
    outputDataQuestionCounter =
        streamControllerQuestionCouter.stream.asBroadcastStream();

//for next button
    streamControllerButtonStatus = StreamController();
    inputDataButtonStatus = streamControllerButtonStatus.sink;
    isActiveOutputStream =
        streamControllerButtonStatus.stream.asBroadcastStream();
    inputDataButtonStatus.add(isNextActive);

    makeCounter();
    inputDataQuestionCounter.add("${currentQuestion + 1}/$countQuestions");
  }
//------------------------Functions----------------------------//

  // fuction make counter
  void makeCounter() {
    forwardAnimation();
    inputDataTimer.add((animationProgressPercent * 31).toInt());
  }

//fun to next question

  void nextQuestion() {
    //check if you add the ans
    if (currentQuestion == listCorrectanswers.length) {
      listCorrectanswers.add(groubValueIndex);
    } else {
      listCorrectanswers[currentQuestion] = groubValueIndex;
    }
    //udate ui again for group value index
    groubValueIndex = -1;
    inputDataGroupValueIndex.add(groubValueIndex);

    if (currentQuestion >= ConstValues.quizQuestions.length - 1) {
      goToAnswerScreen();
    } else {
      currentQuestion++;
      makeCounter();
    }
    inputDataQuestion.add(currentQuestion);
    inputDataQuestionCounter.add("${currentQuestion + 1}/$countQuestions");
  }

//forward animation
  void forwardAnimation() {
    animationController.reset();
    animationController.forward();

    animationController.addListener(() {
      animationProgressPercent = tween.evaluate(animationController);
      inputDataTimer.add((animationProgressPercent * 31).toInt());
      inputDataAnimationProgress.add(animationProgressPercent);
    });
  }

// restart Amination
  void restartAnimation() {
    animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          nextQuestion();
        }
      },
    );
  }

// on tap
  void onTapAtItemRadio(index) {
    groubValueIndex = index;
    if (currentQuestion == listCorrectanswers.length) {
      listCorrectanswers.add(groubValueIndex);
    } else {
      listCorrectanswers[currentQuestion] = groubValueIndex;
    }

    inputDataGroupValueIndex.add(groubValueIndex);

    groubValueIndex != -1 ? isNextActive = true : isNextActive = true;
    inputDataButtonStatus.add(isNextActive);
  }

//  navigate to next page==>ans screen
  void goToAnswerScreen() {
    Navigator.restorablePushReplacementNamed(
        _context, RoutesName.kAnswerScreen);
  }

  onDispose() {
    inputDataGroupValueIndex.close();
    streamControllerGroupValueIndex.close();
    inputDataButtonStatus.close();
    streamControllerButtonStatus.close();
    inputDataTimer.close();
    streamControllerTimer.close();
    inputDataQuestion.close();
    streamControllerQuestion.close();
    inputDataAnimationProgress.close();
    streamControllerAnimationProgress.close();
    inputDataQuestionCounter.close();
    streamControllerQuestionCouter.close();
  }
}
