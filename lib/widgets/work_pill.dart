import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class WorkPill extends StatelessWidget {
  final String title;
  const WorkPill({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        border: Border.all(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Text(title.toUpperCase(), style: AppText.chip),
    );
  }
}
