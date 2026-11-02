import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:portfolio/widgets/personal_projects_card.dart';

class PersonalSection extends StatelessWidget {
  const PersonalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppLayout.sectionPaddingY),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      child: ContentWrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PERSONAL PROJECTS", style: AppText.sectionEyebrow),
            const SizedBox(height: 10),

            Text(
              "Built on my own time",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                'Public and open source. Where I try the patterns I want to bring to work, in Compose and in Flutter.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            //*Cards
            const SizedBox(height: 42),

            if (!isMobile)
              Row(
                spacing: 22,
                children: [
                  Expanded(
                    child: PersonalProjectsCard(
                      title: "DenuSpend",
                      description:
                          "Track income and expenses, set a budget, and see where your money goes with charts for the last 7, 15 or 30 days. Synced in real time with Firebase.",
                      skills: ['COMPOSE', 'HILT', 'FIREBASE AUTH', 'FIRESTORE'],
                      numberOfMoreImages: 3,
                      imageAssets: [
                        'placeholder/placeholder_screen_1.png',
                        'placeholder/placeholder_screen_2.png',
                        'placeholder/placeholder_screen_3.png',
                      ],
                    ),
                  ),
                  Expanded(
                    child: PersonalProjectsCard(
                      title: "DenuSpend",
                      description:
                          "Track income and expenses, set a budget, and see where your money goes with charts for the last 7, 15 or 30 days. Synced in real time with Firebase.",
                      skills: ['COMPOSE', 'HILT', 'FIREBASE AUTH', 'FIRESTORE'],
                      numberOfMoreImages: 3,
                      imageAssets: [
                        'placeholder/placeholder_screen_1.png',
                        'placeholder/placeholder_screen_2.png',
                        'placeholder/placeholder_screen_3.png',
                      ],
                    ),
                  ),
                  Expanded(
                    child: PersonalProjectsCard(
                      title: "DenuSpend",
                      description:
                          "Track income and expenses, set a budget, and see where your money goes with charts for the last 7, 15 or 30 days. Synced in real time with Firebase.",
                      skills: ['COMPOSE', 'HILT', 'FIREBASE AUTH', 'FIRESTORE'],
                      numberOfMoreImages: 0,
                      imageAssets: [
                        'placeholder/placeholder_screen_1.png',
                        'placeholder/placeholder_screen_2.png',
                        'placeholder/placeholder_screen_3.png',
                      ],
                    ),
                  ),
                ],
              ),

            if (isMobile)
              Column(
                spacing: 22,
                children: [
                  PersonalProjectsCard(
                    title: "DenuSpend",
                    description:
                        "Track income and expenses, set a budget, and see where your money goes with charts for the last 7, 15 or 30 days. Synced in real time with Firebase.",
                    skills: ['COMPOSE', 'HILT', 'FIREBASE AUTH', 'FIRESTORE'],
                    numberOfMoreImages: 3,
                    imageAssets: [
                      'placeholder/placeholder_screen_1.png',
                      'placeholder/placeholder_screen_2.png',
                      'placeholder/placeholder_screen_3.png',
                    ],
                  ),
                  PersonalProjectsCard(
                    title: "DenuSpend",
                    description:
                        "Track income and expenses, set a budget, and see where your money goes with charts for the last 7, 15 or 30 days. Synced in real time with Firebase.",
                    skills: ['COMPOSE', 'HILT', 'FIREBASE AUTH', 'FIRESTORE'],
                    numberOfMoreImages: 3,
                    imageAssets: [
                      'placeholder/placeholder_screen_1.png',
                      'placeholder/placeholder_screen_2.png',
                      'placeholder/placeholder_screen_3.png',
                    ],
                  ),
                  PersonalProjectsCard(
                    title: "DenuSpend",
                    description:
                        "Track income and expenses, set a budget, and see where your money goes with charts for the last 7, 15 or 30 days. Synced in real time with Firebase.",
                    skills: ['COMPOSE', 'HILT', 'FIREBASE AUTH', 'FIRESTORE'],
                    numberOfMoreImages: 3,
                    imageAssets: [
                      'placeholder/placeholder_screen_1.png',
                      'placeholder/placeholder_screen_2.png',
                      'placeholder/placeholder_screen_3.png',
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
