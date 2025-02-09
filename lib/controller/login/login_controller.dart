import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/route_manger.dart';

class LoginController {
  // String name = "";
  bool buttonIsActive = false;

  late GlobalKey<FormState> formKeyName;
  late StreamController<bool> streamControllerButtonStatus;
  late Sink<bool> inputDataButtonStatus;
  late Stream<bool> isActiveOutputStream;
  late TextEditingController controllerNameTextField;
  LoginController() {
    formKeyName = GlobalKey();
    streamControllerButtonStatus = StreamController();
    inputDataButtonStatus = streamControllerButtonStatus.sink;
    isActiveOutputStream = streamControllerButtonStatus.stream;
    controllerNameTextField = TextEditingController();
    inputDataButtonStatus.add(buttonIsActive);
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "not empty";
    } else if (value.length < 3) {
      return "should more than 2";
    } else {
      return null;
    }
  }

  void onChangedTextFormField() {
    if (formKeyName.currentState!.validate()) {
      buttonIsActive = true;
    } else {
      buttonIsActive = false;
    }
    inputDataButtonStatus.add(buttonIsActive);
  }

  void navigateToQuizScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        arguments: controllerNameTextField.text,
        context,
        RoutesName.kQuizScreen,
        (route) => false);
  }

  onDispose() {
    inputDataButtonStatus.close();
    streamControllerButtonStatus.close();
  }
}
