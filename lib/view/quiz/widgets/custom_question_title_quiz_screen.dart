import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/const_values.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';

class CustomQuestionTitleQuizScreen extends StatelessWidget {
  const CustomQuestionTitleQuizScreen({
    super.key,
    required this.outPutStreamQuestionTitle,
  });
  final Stream<int> outPutStreamQuestionTitle;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: outPutStreamQuestionTitle,
      builder: (context, snapshot) => Container(
        padding: EdgeInsets.all(24),
        alignment: Alignment.center,
        width: double.infinity,
        height: HeightValues.h229,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                blurStyle: BlurStyle.outer,
                blurRadius: 100,
                spreadRadius: -50,
                offset: Offset(0, 20)),
          ],
          color: ColorManger.kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          ConstValues.quizQuestions[snapshot.data == null ? 0 : snapshot.data!]
              .questions,
          style: GoogleFonts.baloo2(
            fontSize: FontSize.f18,
            color: ColorManger.kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
