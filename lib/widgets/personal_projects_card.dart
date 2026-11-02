import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/work_pill.dart';

class PersonalProjectsCard extends StatelessWidget {
  final List<String> imageAssets;
  final int numberOfMoreImages;
  final String title;
  final List<String> skills;
  final String description;
  const PersonalProjectsCard({
    super.key,
    required this.imageAssets,
    required this.numberOfMoreImages,
    required this.title,
    required this.skills,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.card),
        color: AppColors.surface,
        border: Border.all(width: 1, color: AppColors.border),
      ),
      child: Column(
        children: [
          //* Images
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.border, width: 1),
              ),

              gradient: AppGradients.mediaPlaceholder,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                for (final (index, asset) in imageAssets.indexed)
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 140),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.surface,
                        ),

                        child: Stack(
                          children: [
                            Image.asset(
                              asset,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),

                            if (numberOfMoreImages > 0 && index == 2)
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.mediaOverlay,
                                  ),
                                ),
                              ),
                            if (numberOfMoreImages > 0 && index == 2)
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '+$numberOfMoreImages more',
                                    style: AppText.mediaMore,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          //* Details
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Wrap(
                  runSpacing: 6,
                  spacing: 6,
                  children: [
                    for (final skill in skills) WorkPill(title: skill),
                  ],
                ),

                Text(description, style: Theme.of(context).textTheme.bodySmall),
                Row(
                  spacing: 16,
                  children: [
                    TextButton(
                      onPressed: () {
                        //TODO
                      },
                      child: Text('View gallery'),
                    ),
                    TextButton(
                      onPressed: () {
                        //TODO
                      },
                      child: Text('Code'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
