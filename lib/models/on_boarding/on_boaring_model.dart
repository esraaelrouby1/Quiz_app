class OnBoaringModel {
  String? _onBoardingImage;
  String? _onBoardingTitle;
  String? _onBoardingDescription;
  OnBoaringModel(String onBoardingImage, String onBoardingTitle,
      String onBoardingDescription) {
    _onBoardingImage = onBoardingImage;
    _onBoardingTitle = onBoardingTitle;
    _onBoardingDescription = onBoardingDescription;
  }
  String get onBoardingDesc => _onBoardingDescription!;

  set onBoardingDesc(String value) {
    _onBoardingDescription = value;
  }

  String get onBoardingTitle => _onBoardingTitle!;

  set onBoardingTitle(String value) {
    _onBoardingTitle = value;
  }

  String get onBoardingImage => _onBoardingImage!;

  set onBoardingImage(String value) {
    _onBoardingImage = value;
  }
}
