import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/strings_values.dart';

class CustomLogoScreen extends StatelessWidget {
  const CustomLogoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      StringsValues.kLogo,
      style: GoogleFonts.lobster(
        height: .8,
        fontSize: FontSize.f200,
        color: ColorManger.kPrimaryColor,
      ),
    );
  }
}
