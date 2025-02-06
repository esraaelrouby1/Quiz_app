import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/core/resources/width_values.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.isActiveOutputStream,
  });
  final VoidCallback onPressed;
  final Stream<bool> isActiveOutputStream;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: isActiveOutputStream,
      builder: (context, snapshot) => MaterialButton(
        onPressed: snapshot.data == null
            ? null
            : snapshot.data == true
                ? onPressed
                : null,
        minWidth: WidthValues.w20,
        height: HeightValues.h10,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: HeightValues.h59,
          decoration: BoxDecoration(
            color: snapshot.data == null
                ? ColorManger.kGreyColor
                : snapshot.data == true
                    ? ColorManger.kPrimaryColor
                    : ColorManger.kGreyColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "Start",
            style: GoogleFonts.baloo2(
              fontSize: FontSize.f24,
              color: ColorManger.kLightWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
