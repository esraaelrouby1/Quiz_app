import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/core/resources/width_values.dart';

class CustomItemRadioQuizScreen extends StatelessWidget {
  const CustomItemRadioQuizScreen({
    super.key,
    required this.option,
    required this.onTap,
    this.isSelected = false,
  });
  final String option;
  final GestureTapCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected == true
              ? ColorManger.kPrimaryColor.withOpacity(.2)
              : ColorManger.kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: GoogleFonts.baloo2(
                fontSize: FontSize.f20,
                color: ColorManger.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            isSelected == true
                ? Icon(
                    CupertinoIcons.checkmark_alt_circle_fill,
                    color: ColorManger.kPrimaryColor,
                  )
                : Container(
                    width: WidthValues.w20,
                    height: HeightValues.h20,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(
                          color: ColorManger.kPrimaryColor,
                          width: 1,
                        ),
                      ),
                      color: ColorManger.kWhiteColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
