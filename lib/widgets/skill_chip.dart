import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class SkillChip extends StatelessWidget {
  final String skill;
  final bool isNormal;

  const SkillChip({super.key, required this.skill, required this.isNormal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: isNormal ? AppColors.surface : AppColors.ink,
        border: Border.all(
          width: 1,
          color: isNormal ? AppColors.border : AppColors.ink,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        skill,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 13.5,
          fontWeight: FontWeight.w500,
          color: isNormal ? AppColors.ink : Colors.white,
        ),
      ),
    );
  }
}
