import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/skill_chip.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //* first row
        Expanded(flex: 11, child: _heroDetails(context)),
        //* second row
      ],
    );
  }

  Widget _heroDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chip(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          labelStyle: AppText.heroEyebrow,
          backgroundColor: AppColors.tealSoft,
          label: Text('AVAILABLE FOR ANDROID & FLUTTER ROLES'),
        ),

        const SizedBox(height: 20),

        Text.rich(
          TextSpan(
            style: Theme.of(
              context,
            ).textTheme.displayMedium, // base style for everything
            children: const [
              TextSpan(text: 'Mobile app developer.\n'),
              TextSpan(text: 'Native Android by trade,\n'),
              TextSpan(
                text: 'Flutter by choice.',
                style: TextStyle(
                  color: AppColors.amberDeep,
                ), // only the color changes
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 460),
          child: Text(
            '3 years shipping production Android apps in Kotlin, XML and Jetpack Compose — offline-first onboarding, POS receipt printing and ML Kit scanning for large-scale health and financial assistance apps. Off the clock, I build in Compose and Flutter.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

        const SizedBox(height: 30),
        Row(
          spacing: 14,
          children: [
            FilledButton(onPressed: () {}, child: Text('View my work')),

            OutlinedButton(onPressed: () {}, child: Text('Get in touch')),
          ],
        ),

        const SizedBox(height: 34),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            SkillChip(text: 'KOTLIN'),
            SkillChip(text: 'JETPACK COMPOSE'),
            SkillChip(text: 'XML'),
            SkillChip(text: 'FLUTTER'),
            SkillChip(text: 'DART'),
            SkillChip(text: 'GIT'),
          ],
        ),

        const SizedBox(width: 16),

        Container(
          padding: const EdgeInsets.fromLTRB(10, 7, 14, 7),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // NEW: chip only as wide as its content
            spacing: 8, // NEW: replaces the SizedBox
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: Color(0xFF1F6FEB), // NEW: add this to AppColors
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                'This site is made with Flutter',
                style: AppText.tag.copyWith(color: AppColors.ink), // NEW
              ),
              Container(
                width: 1,
                height: 14,
                color: AppColors.border,
              ), // NEW: simpler divider
              TextButton(
                // NEW: the link
                onPressed: () {
                  //   launchUrl(
                  //   Uri.parse('https://github.com/denuden/YOUR_PORTFOLIO_REPO'),
                  // )
                },
                child: Text(
                  'View source ↗',
                  style: AppText.tag.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
