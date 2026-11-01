import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class WorkList extends StatelessWidget {
  final bool isLast;
  final String title;
  final String description;
  final String contribution;
  final List<String> skill;

  const WorkList({
    super.key,
    required this.title,
    required this.description,
    required this.contribution,
    required this.skill,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 20),

          child: Row(
            //FIRST ROW FOR ALIGNMENT
            crossAxisAlignment: CrossAxisAlignment.center, // label centered
            spacing: 24,
            children: [
              Expanded(
                child: Row(
                  //SECOND ROW FOR STRUCTURE
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    //* DOT
                    Text('•', style: TextStyle(color: AppColors.slate)),
                    //*BODY
                    Expanded(
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //*TITLE and CONTRIBUTION
                          Text.rich(
                            TextSpan(
                              text: title,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: AppColors.ink,
                                    fontSize: 14,
                                  ),
                              children: [
                                if (contribution.isNotEmpty)
                                  TextSpan(
                                    text: ' $contribution',
                                    style: TextStyle(
                                      color: AppColors.slate,
                                      fontSize: 12.5,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          //* DECSRIPTION
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 640),
                            child: Text(
                              description,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: AppColors.inkSoft,
                                    height: 1.55,
                                    fontSize: 13,
                                  ),
                            ),
                          ),

                          //? FOR MOBILE SKILL
                          if (isMobile)
                            Text(
                              skill.join(" · ").toUpperCase(),
                              style: AppText.techMeta.copyWith(
                                color: AppColors.amberDeep,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //? FOR DESSKTOP SKILL
              if (!isMobile)
                Align(
                  alignment: AlignmentGeometry.center,
                  child: Text(
                    skill.join(" · ").toUpperCase(),
                    style: AppText.techMeta.copyWith(
                      color: AppColors.amberDeep,
                    ),
                  ),
                ),
            ],
          ),
        ),

        if (!isLast) const Divider(height: 1),
      ],
    );
  }
}
