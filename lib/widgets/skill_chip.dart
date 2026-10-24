import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class SkillChip extends StatelessWidget {
  final String text;
  const SkillChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(7),
        border: BoxBorder.all(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(text, style: AppText.tag),
      ),
    );
  }
}
