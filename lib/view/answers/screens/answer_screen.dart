import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/controller/answers/answer_controller.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/const_values.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/core/resources/strings_values.dart';
import 'package:quiz_app/core/resources/width_values.dart';
import 'package:quiz_app/view/answers/widgets/custom_answer_status.dart';
import 'package:quiz_app/view/answers/widgets/custom_order_question_ans.dart';
import 'package:quiz_app/view/answers/widgets/custom_student_information.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  late AnswerController _answerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _answerController = AnswerController();
  }

  @override
  Widget build(BuildContext context) {
    Map studentAnswers = ModalRoute.of(context)!.settings.arguments as Map;
    _answerController.getStudentAnswers(studentAnswers);
    return Scaffold(
      backgroundColor: ColorManger.kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomStudentInformation(
              name: " ${_answerController.studentAnswers[StringsValues.kName]}",
              grade:
                  "${_answerController.getCountCorrectAnswer()}    /  ${_answerController.answers.length}",
            ),
            SizedBox(
              height: HeightValues.h20,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomOrderOfQuestionAns(
                        order: "1",
                      ),
                      CustomAnswerStatus(
                        question: ConstValues.quizQuestions[index].questions,
                        answer: _answerController.studentAnswers[
                                    StringsValues.kListCorrectAnswer][index] ==
                                -1
                            ? "You didn't choose"
                            : ConstValues.quizQuestions[index].listAnswer[
                                _answerController.studentAnswers[
                                    StringsValues.kListCorrectAnswer][index]],
                        isCorrect: _answerController.answers[index],
                        correctAnswer: ConstValues
                            .quizQuestions[index]
                            .listAnswer[
                                ConstValues.quizQuestions[index].correctAnswer]
                            .toString(),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: HeightValues.h20,
                ),
                itemCount: _answerController
                    .studentAnswers[StringsValues.kListCorrectAnswer].length,
              ),
            ),
            SizedBox(
              height: HeightValues.h20,
            ),
          ],
        ),
      ),
    );
  }
}
