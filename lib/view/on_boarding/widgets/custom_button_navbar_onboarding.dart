import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/core/resources/width_values.dart';

class CustomButtonNavBarOnBoarding extends StatelessWidget {
  const CustomButtonNavBarOnBoarding({
    super.key,
    required this.dotCount,
    required this.onTapDotIndicator,
    required this.outputDataDotIndicator,
    this.onTapNext,
    required this.outputDataTextStart,
    this.onTapSkip,
  });
  final int dotCount;
  final GestureTapCallback? onTapNext;
  final GestureTapCallback? onTapSkip;
  final void Function(int index) onTapDotIndicator;
  final Stream<int> outputDataDotIndicator;
  final Stream<int> outputDataTextStart;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 52, right: 32, left: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onTapSkip,
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: FontSize.f15,
                fontWeight: FontWeight.w600,
                color: ColorManger.kPurpleColor,
              ),
            ),
          ),
          StreamBuilder(
            stream: outputDataDotIndicator,
            builder: (context, snapshot) => DotsIndicator(
              onTap: (Position) {
                onTapDotIndicator(Position);
              },
              decorator: const DotsDecorator(
                size: Size(WidthValues.w12, HeightValues.h12),
                activeSize: Size(WidthValues.w12, HeightValues.h12),
                color: ColorManger.kGreyColor,
                activeColor: ColorManger.kPurpleColor,
              ),
              dotsCount: dotCount,
              position: snapshot.data == null ? 0 : snapshot.data!,
            ),
          ),
          InkWell(
            onTap: onTapNext,
            child: StreamBuilder<int>(
              stream: outputDataTextStart,
              builder: (context, snapshot) => Text(
                snapshot.data == null
                    ? "Next"
                    : snapshot.data == dotCount - 1
                        ? "Start"
                        : "Next",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: FontSize.f15,
                  color: ColorManger.kPurpleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
