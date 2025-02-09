class QuestionModel {
  late String _questions;
  late List<dynamic> _listAnswer;
  late int _correctAnswer;

  QuestionModel(
      {required String questions,
      required List<dynamic> listAnswer,
      required int correctAnswer}) {
    _questions = questions;

    _listAnswer = listAnswer;
    _correctAnswer = correctAnswer;
  }

  int get correctAnswer => _correctAnswer;

  set correctAnswer(int value) {
    _correctAnswer = value;
  }

  List<dynamic> get listAnswer => _listAnswer;

  set listAnswer(List<dynamic> value) {
    _listAnswer = value;
  }

  String get questions => _questions;

  set questions(String value) {
    _questions = value;
  }
}
