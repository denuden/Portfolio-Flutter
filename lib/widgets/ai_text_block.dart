import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class AiTextBlock extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const AiTextBlock({
    super.key,
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.aiStepBg,
        border: Border.all(width: 1, color: AppColors.aiStepBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(number, style: AppText.mono.copyWith(color: AppColors.amber)),
          const SizedBox(height: 6),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              height: 1.5,

              color: AppColors.aiTextSoft,
            ),
          ),
        ],
      ),
    );
  }
}
