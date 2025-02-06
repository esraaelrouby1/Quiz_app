import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/const_values.dart';
import 'package:quiz_app/core/resources/route_manger.dart';

class OnBoardingController {
  int currentIndexPage = 0;
  late StreamController<int> streamControllerDotIndicator;
  late StreamController<int> streamControllerStartText;
  late Sink<int> inputDataDotIndicator;
  late Stream<int> outPutDataDotIndicator;
  late PageController onBoardgingPageController;
  late Sink<int> inputDataStartText;
  late Stream<int> outPutDataStartText;
  bool isTappedDotIndicator = false;
  OnBoardingController() {
    streamControllerDotIndicator = StreamController();
    inputDataDotIndicator = streamControllerDotIndicator.sink;
    outPutDataDotIndicator = streamControllerDotIndicator.stream;
    streamControllerStartText = StreamController();
    inputDataStartText = streamControllerStartText.sink;
    outPutDataStartText = streamControllerStartText.stream;
    inputDataDotIndicator.add(currentIndexPage);
    inputDataStartText.add(currentIndexPage);
    onBoardgingPageController = PageController(initialPage: currentIndexPage);
  }

  void onTapDotIndicator(int index) {
    currentIndexPage = index;
    inputDataDotIndicator.add(currentIndexPage);
    onBoardgingPageController.animateToPage(currentIndexPage,
        duration: Duration(milliseconds: 350), curve: Curves.easeInOut);
    inputDataStartText.add(currentIndexPage);
  }

  void onTapNext(BuildContext context) {
    currentIndexPage == ConstValues.onBoardingListConst.length - 1
        ? goToLoginPage(context: context)
        : currentIndexPage++;

    onBoardgingPageController.animateToPage(currentIndexPage,
        duration: Duration(milliseconds: 350), curve: Curves.easeInOut);
    inputDataDotIndicator.add(currentIndexPage);
    inputDataStartText.add(currentIndexPage);
  }

  void goToLoginPage({required BuildContext context}) {
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.kLoginScreen, (route) => false);
  }

  void onDispose() {
    inputDataDotIndicator.close();
    streamControllerDotIndicator.close();
    inputDataStartText.close();
    streamControllerStartText.close();
    onBoardgingPageController.dispose();
  }
}
