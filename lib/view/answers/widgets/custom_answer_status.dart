import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/width_values.dart';

class CustomAnswerStatus extends StatelessWidget {
  const CustomAnswerStatus(
      {super.key,
      required this.isCorrect,
      required this.question,
      required this.answer,
      required this.correctAnswer});
  final bool isCorrect;
  final String question;
  final String answer;
  final String correctAnswer;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 10, spreadRadius: -10, offset: Offset(0, 10)),
          ],
          color: isCorrect == true ? ColorManger.kGreenBold : Colors.red,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                textAlign: TextAlign.center,
                question,
                style: GoogleFonts.baloo2(
                    fontSize: FontSize.f18,
                    fontWeight: FontWeight.w700,
                    color: ColorManger.kWhiteColor),
              ),
            ),
            const Divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: -10,
                        offset: Offset(0, 10)),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: ColorManger.kLightWhite),
              child: Row(
                children: [
                  Icon(
                    isCorrect == true
                        ? CupertinoIcons.checkmark_alt_circle_fill
                        : Icons.clear,
                    color: ColorManger.kPrimaryColor,
                  ),
                  SizedBox(
                    width: WidthValues.w4,
                  ),
                  Expanded(
                    child: Text(
                      answer,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.baloo2(
                          fontSize: FontSize.f18,
                          color: ColorManger.kPrimaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            if (isCorrect == false)
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                alignment: Alignment.center,
                // width: double.infinity,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: -10,
                          offset: Offset(0, 10)),
                    ],
                    color: ColorManger.kWhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.checkmark_alt_circle_fill,
                      color: ColorManger.kPrimaryColor,
                    ),
                    const SizedBox(
                      width: WidthValues.w4,
                    ),
                    Expanded(
                        child: Text(
                      "$correctAnswer",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.baloo2(
                          fontSize: FontSize.f18,
                          color: ColorManger.kPrimaryColor,
                          fontWeight: FontWeight.w700),
                    ))
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
