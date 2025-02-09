import 'package:quiz_app/core/resources/const_values.dart';
import 'package:quiz_app/core/resources/strings_values.dart';

class AnswerController {
  late Map studentAnswers;
  List<bool> answers = [];
  void getStudentAnswers(Map studentAnswers) {
    this.studentAnswers = studentAnswers;
    compareAnswers();
  }

  void compareAnswers() {
    answers.clear();
    for (int i = 0; i < ConstValues.quizQuestions.length; i++) {
      bool ans = studentAnswers[StringsValues.kListCorrectAnswer][i] ==
          ConstValues.quizQuestions[i].correctAnswer;
      answers.add(ans);
    }
  }

  int getCountCorrectAnswer() {
    int count = 0;
    for (bool i in answers) {
      if (i == true) {
        count++;
      }
    }
    return count;
  }
}
