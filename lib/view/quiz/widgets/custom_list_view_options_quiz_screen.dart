import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:quiz_app/core/resources/const_values.dart';
import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/view/quiz/widgets/custom_item_radio_quiz_screen.dart';

class CustomListViewOptionsQuizScreen extends StatelessWidget {
  const CustomListViewOptionsQuizScreen(
      {super.key,
      required this.outputDataGroubValueRadio,
      required this.onTap,
      required this.outPutStreamQuestion});

  final Stream<int> outputDataGroubValueRadio;
  final Stream<int> outPutStreamQuestion;
  final void Function(int indexValue) onTap;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder2<int, int>(
      streams: StreamTuple2(outPutStreamQuestion, outputDataGroubValueRadio),
      builder: (context, snapshots) => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => CustomItemRadioQuizScreen(
            onTap: () {
              onTap(index);
            },
            isSelected: snapshots.snapshot2.data == null
                ? false
                : snapshots.snapshot2.data == index
                    ? true
                    : false,
            option: ConstValues
                .quizQuestions[snapshots.snapshot1.data == null
                    ? 0
                    : snapshots.snapshot1.data!]
                .listAnswer[index]),
        separatorBuilder: (context, index) => SizedBox(
          height: HeightValues.h25,
        ),
        itemCount: ConstValues
            .quizQuestions[snapshots.snapshot1.data == null
                ? 0
                : snapshots.snapshot1.data!]
            .listAnswer
            .length,
      ),
    );
  }
}
