import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/controller/on_boarding/on_boarding_controller.dart';
import 'package:quiz_app/core/resources/assets_values_manger.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/const_values.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/view/on_boarding/widgets/custom_button_navbar_onboarding.dart';
import 'package:quiz_app/view/on_boarding/widgets/custom_items_page_view_on_boarding_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnBoardingController _boardingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _boardingController = OnBoardingController();
  }

  @override
  void dispose() {
    _boardingController.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomButtonNavBarOnBoarding(
          outputDataTextStart: _boardingController.outPutDataStartText,
          onTapSkip: () {
            _boardingController.goToLoginPage(context: context);
          },
          onTapNext: () {
            _boardingController.onTapNext(context);
          },
          dotCount: ConstValues.onBoardingListConst.length,
          onTapDotIndicator: (index) {
            _boardingController.onTapDotIndicator(index);
          },
          outputDataDotIndicator: _boardingController.outPutDataDotIndicator,
        ),
        body: SafeArea(
          child: PageView.builder(
            onPageChanged: (value) {
              if (_boardingController.isTappedDotIndicator == true) {
                if (_boardingController.onBoardgingPageController.page!
                        .round() ==
                    _boardingController.currentIndexPage) {
                  _boardingController.isTappedDotIndicator = false;
                } else {
                  _boardingController.onTapDotIndicator(value);
                }
              }
            },
            controller: _boardingController.onBoardgingPageController,
            itemCount: ConstValues.onBoardingListConst.length,
            itemBuilder: (context, index) =>
                CustomItemsPageViewOnBoardingScreen(
              onBoaringModel: ConstValues.onBoardingListConst[index],
            ),
          ),
        ));
  }
}
