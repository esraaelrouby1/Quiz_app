import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';

class CustomAppBarQuizScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarQuizScreen({
    super.key,
    required this.onTap,
    required this.textNumQustionStream,
  });
  final GestureTapCallback onTap;
  final Stream<String> textNumQustionStream;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 150,
      leading: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new_sharp,
                color: ColorManger.kPrimaryColor,
              ),
              Text(
                "Previous",
                style: GoogleFonts.baloo2(
                  fontSize: FontSize.f18,
                  color: ColorManger.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      title: StreamBuilder(
        stream: textNumQustionStream,
        builder: (context, snapshot) => Text(
          snapshot.data == null ? "" : snapshot.data!,
          style: GoogleFonts.baloo2(
            fontSize: FontSize.f18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: ColorManger.kLightWhite,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
