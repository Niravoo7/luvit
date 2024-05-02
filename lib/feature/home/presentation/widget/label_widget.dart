import 'package:flutter/material.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({required this.labels, super.key});
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: List.generate(
        labels.length,
        (index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: ThemeColors.clrGray10,
            border: Border.all(color: ThemeColors.clrCombinePureWhite),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(labels[index]),
        ),
      ),
    );
  }
}
