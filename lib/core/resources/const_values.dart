import 'package:quiz_app/core/resources/assets_values_manger.dart';
import 'package:quiz_app/models/on_boarding/on_boaring_model.dart';

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
}
