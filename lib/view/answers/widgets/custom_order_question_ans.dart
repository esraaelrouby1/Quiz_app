import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/core/resources/width_values.dart';

class CustomOrderOfQuestionAns extends StatelessWidget {
  const CustomOrderOfQuestionAns({
    super.key,
    required this.order,
    required this.isCorrect,
  });
  final int order;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: HeightValues.h10),
      width: WidthValues.w58,
      height: 35,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -10,
            offset: Offset(0, 10),
          ),
        ],
        color: isCorrect == true ? ColorManger.kGreenBold : Colors.red,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$order",
            style: GoogleFonts.baloo2(
                fontWeight: FontWeight.bold,
                fontSize: FontSize.f21,
                color: ColorManger.kWhiteColor),
          )
        ],
      ),
    );
  }
}
