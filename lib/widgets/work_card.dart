import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/locked_placeholder.dart';
import 'package:portfolio/widgets/work_pill.dart';

class WorkCard extends StatelessWidget {
  final String number;
  final String status;
  final String title;
  final String description;
  final List<String> bulletInfo;
  final List<String> tech;

  const WorkCard({
    super.key,
    required this.number,
    required this.status,
    required this.title,
    required this.tech,
    required this.description,
    required this.bulletInfo,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(width: 1, color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            children: [
              //* badge
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.ink,
                ),
                child: Center(
                  child: Text(
                    number,
                    style: AppText.tag.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),

              Spacer(),

              //* pill status
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 11),

                decoration: BoxDecoration(
                  color: AppColors.surface,
                  border: Border.all(width: 1, color: AppColors.border),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  spacing: 5,
                  children: [
                    SvgPicture.asset(
                      'assets/images/lock.svg',
                      width: 11,
                      height: 11,
                      colorFilter: ColorFilter.mode(
                        AppColors.inkSoft,
                        BlendMode.srcIn,
                      ),
                    ),

                    Text(status, style: AppText.chip),
                  ],
                ),
              ),
            ],
          ),
          //* placeholder
          LockedPlaceholder(),

          //*Title
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Wrap(
            runSpacing: 6,
            spacing: 6,
            children: [for (var label in tech) WorkPill(title: label)],
          ),

          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.ink),
          ),

          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var text in bulletInfo)
                Text(
                  '—$text',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.inkSoft),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
