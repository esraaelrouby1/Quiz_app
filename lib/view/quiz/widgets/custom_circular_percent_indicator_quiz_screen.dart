import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';

class CustomCircularPercentIndicatorQuizScreen extends StatelessWidget {
  const CustomCircularPercentIndicatorQuizScreen({
    super.key,
    required this.outPutStreamTimer,
    required this.outPutStreamAnimationProgress,
  });

  final Stream<double> outPutStreamAnimationProgress;
  final Stream<int> outPutStreamTimer;

  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 43,
      backgroundColor: Colors.white,
      child: StreamBuilder2(
        streams: StreamTuple2(outPutStreamAnimationProgress, outPutStreamTimer),
        builder: (context, snapshots) => CircularPercentIndicator(
          circularStrokeCap: CircularStrokeCap.round,
          radius: 43,
          restartAnimation: true,
          animationDuration: 30000,
          percent:
              snapshots.snapshot1.data == null ? 0 : snapshots.snapshot1.data!,
          progressColor: ColorManger.kPrimaryColor,
          center: Text(
            snapshots.snapshot2.data == null
                ? "0"
                : snapshots.snapshot2.data.toString(),
            style: GoogleFonts.baloo2(
              fontSize: FontSize.f32,
              color: Color(0xff004643),
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: ColorManger.kPrimaryColor.withOpacity(.38),
        ),
      ),
    );
  }
}
