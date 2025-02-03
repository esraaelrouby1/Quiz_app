import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/resources/assets_values_manger.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/models/on_boarding/on_boaring_model.dart';

class CustomItemsPageViewOnBoardingScreen extends StatelessWidget {
  const CustomItemsPageViewOnBoardingScreen({
    super.key,
    required this.onBoaringModel,
  });
  final OnBoaringModel onBoaringModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                onBoaringModel.onBoardingImage,
                height: 398,
              ),
              SizedBox(
                height: HeightValues.h108,
              ),
              Text(
                onBoaringModel.onBoardingTitle,
                style: GoogleFonts.montserrat(
                    fontSize: FontSize.f32,
                    color: ColorManger.kPurpleColor,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: HeightValues.h24,
              ),
              Text(
                textAlign: TextAlign.center,
                onBoaringModel.onBoardingDesc,
                style: GoogleFonts.montserrat(
                    fontSize: FontSize.f21,
                    color: ColorManger.kPurpleColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
