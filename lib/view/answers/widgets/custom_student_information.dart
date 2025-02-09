import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';

class CustomStudentInformation extends StatelessWidget {
  const CustomStudentInformation({
    super.key,
    required this.name,
    required this.grade,
  });
  final String name;
  final String grade;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      margin: EdgeInsets.only(left: 16, right: 16, top: 39),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.kWhiteColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -10,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Name : $name",
            style: GoogleFonts.baloo2(
              fontWeight: FontWeight.bold,
              fontSize: FontSize.f21,
              color: ColorManger.kPrimaryColor,
            ),
          ),
          const SizedBox(
            height: HeightValues.h15,
          ),
          Text(
            "Grade : $grade",
            style: GoogleFonts.baloo2(
              fontWeight: FontWeight.w400,
              fontSize: FontSize.f21,
              color: ColorManger.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
