import 'package:flutter/material.dart';
import 'package:quiz_app/controller/quiz/quiz_screen_controller.dart';

import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/const_values.dart';

import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/core/widgets/custom_material_button.dart';

import 'package:quiz_app/view/quiz/widgets/custom_app_bar_quiz_screen.dart';
import 'package:quiz_app/view/quiz/widgets/custom_circular_percent_indicator_quiz_screen.dart';
import 'package:quiz_app/view/quiz/widgets/custom_item_radio_quiz_screen.dart';
import 'package:quiz_app/view/quiz/widgets/custom_list_view_options_quiz_screen.dart';
import 'package:quiz_app/view/quiz/widgets/custom_question_title_quiz_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late QuizScreenController _quizScreenController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quizScreenController = QuizScreenController(this, context);
    _quizScreenController.forwardAnimation();
    _quizScreenController.restartAnimation();
  }

  @override
  void dispose() {
    _quizScreenController.onDispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.kLightWhite,
      appBar: CustomAppBarQuizScreen(
        onTap: () {
          Navigator.of(context).canPop();
        },
        textNumQustionStream: _quizScreenController.outputDataQuestionCounter,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: HeightValues.h88,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomQuestionTitleQuizScreen(
                      outPutStreamQuestionTitle:
                          _quizScreenController.outputDataQuestion,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: -29,
                      child: CustomCircularPercentIndicatorQuizScreen(
                        outPutStreamTimer:
                            _quizScreenController.outputDataTimer,
                        outPutStreamAnimationProgress:
                            _quizScreenController.outputDataAnimationProgress,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: HeightValues.h70,
                ),
                CustomListViewOptionsQuizScreen(
                  onTap: (int indexValue) {
                    _quizScreenController.onTapAtItemRadio(indexValue);
                  },
                  outputDataGroubValueRadio:
                      _quizScreenController.outputDataGroupValueIndex,
                  outPutStreamQuestion:
                      _quizScreenController.outputDataQuestion,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 61),
        child: CustomMaterialButton(
            text: "Next",
            onPressed: () {
              _quizScreenController.nextQuestion();
            },
            isActiveOutputStream: _quizScreenController.isActiveOutputStream),
      ),
    );
  }
}
