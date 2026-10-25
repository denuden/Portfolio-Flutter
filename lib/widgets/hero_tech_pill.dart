import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class TechPill extends StatelessWidget {
  const TechPill({super.key, required this.label, required this.dotColor});

  final String label;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(100),
        boxShadow: AppShadows.floatChip,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          Text(label, style: AppText.floatChip),
        ],
      ),
    );
  }
}
