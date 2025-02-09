import 'package:quiz_app/core/resources/assets_values_manger.dart';
import 'package:quiz_app/models/on_boarding/on_boaring_model.dart';
import 'package:quiz_app/models/quiz_model/question_model.dart';

class ConstValues {
  static List<OnBoaringModel> onBoardingListConst = [
    OnBoaringModel(
      AssetsValuesManger.kOnBoardgingImage1,
      'Synonyms for QUIZ',
      'Synonyms for QUIZ',
    ),
    OnBoaringModel(
      AssetsValuesManger.kOnBoardgingImage2,
      'Antonyms of QUIZ',
      'Sunt in culpa qui officia \n deserunt mollit anim id \n est laborum.',
    ),
    OnBoaringModel(
      AssetsValuesManger.kOnBoardgingImage3,
      'Cool Quiz',
      'Culpa qui officia deserunt \n mollit anim id est laborum.',
    ),
  ];

  static List<QuestionModel> quizQuestions = [
    QuestionModel(
      questions: "What language is used to develop Flutter apps?",
      listAnswer: ["Java", "Dart", "Swift", "Kotlin"],
      correctAnswer: "Dart",
    ),
    QuestionModel(
      questions: "Which widget is used to create a scrollable list in Flutter?",
      listAnswer: ["Column", "Row", "Stack", "ListView"],
      correctAnswer: "ListView",
    ),
    QuestionModel(
      questions: "What is the command to create a new Flutter project?",
      listAnswer: [
        "flutter new project",
        "dart create my_app",
        "flutter create my_app",
        "flutter init"
      ],
      correctAnswer: "flutter create my_app",
    ),
    QuestionModel(
      questions: "Which company created Flutter?",
      listAnswer: ["Google", "Apple", "Microsoft", "Facebook"],
      correctAnswer: "Google",
    ),
    QuestionModel(
      questions: "Which widget is used to create a button in Flutter?",
      listAnswer: ["Container", "ElevatedButton", "Text", "ListTile"],
      correctAnswer: "ElevatedButton",
    ),
    QuestionModel(
      questions: "What is the extension of a Dart file?",
      listAnswer: [".dart", ".flutter", ".java", ".py"],
      correctAnswer: ".dart",
    ),
    QuestionModel(
      questions: "What function is used to start a Flutter app?",
      listAnswer: ["main()", "startFlutter()", "runApp()", "initializeApp()"],
      correctAnswer: "runApp()",
    ),
    QuestionModel(
      questions: "Which package is used for handling HTTP requests in Flutter?",
      listAnswer: ["http", "dio", "flutter_http", "requests"],
      correctAnswer: "http",
    ),
    QuestionModel(
      questions: "Which widget is used to display an image in Flutter?",
      listAnswer: ["Image", "Picture", "Icon", "Photo"],
      correctAnswer: "Image",
    ),
    QuestionModel(
      questions: "What is Flutter primarily used for?",
      listAnswer: [
        "Game development",
        "Machine learning",
        "Backend development",
        "Mobile & Web development"
      ],
      correctAnswer: "Mobile & Web development",
    ),
  ];
}
