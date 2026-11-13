import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:portfolio/widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppLayout.sectionPaddingY),
      child: ContentWrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TOOLKIT', style: AppText.sectionEyebrow),
            const SizedBox(height: 12),

            Text('Skills', style: Theme.of(context).textTheme.headlineMedium),

            const SizedBox(height: 32),

            Text(
              'NATIVE ANDROID',
              style: AppText.skillLabel.copyWith(
                fontSize: 11.5,
                color: AppColors.slate,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                for (final skill in [
                  (name: 'Kotlin', isNormal: false),
                  (name: 'Jetpack Compose', isNormal: false),
                  (name: 'XML', isNormal: false),
                  (name: 'MVVM Architecture', isNormal: true),
                  (name: 'Hilt', isNormal: true),
                  (name: 'Flow', isNormal: true),
                  (name: 'Retrofit', isNormal: true),
                  (name: 'Room', isNormal: true),
                  (name: 'DataStore', isNormal: true),
                  (name: 'Android Studio', isNormal: true),
                ])
                  SkillChip(skill: skill.name, isNormal: skill.isNormal),
              ],
            ),
            const SizedBox(height: 22),

            // * ========================
            Text(
              'FLUTTER',
              style: AppText.skillLabel.copyWith(
                fontSize: 11.5,
                color: AppColors.slate,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                for (final skill in [
                  (name: 'Flutter', isNormal: false),
                  (name: 'Dart', isNormal: false),
                  (name: 'Cubit / Bloc', isNormal: true),
                  (name: 'Feature-first layered architecture', isNormal: true),
                  (name: 'Repository Pattern', isNormal: true),
                  (name: 'WebView', isNormal: true),
                  (name: 'Native Splash', isNormal: true),
                  (name: 'Skeleton Loading', isNormal: true),
                ])
                  SkillChip(skill: skill.name, isNormal: skill.isNormal),
              ],
            ),
            const SizedBox(height: 22),

            //* =======================
            Text(
              'BACKEND & SERVICES',
              style: AppText.skillLabel.copyWith(
                fontSize: 11.5,
                color: AppColors.slate,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                for (final skill in [
                  (name: 'REST APIs', isNormal: false),
                  (name: 'Firebase Auth', isNormal: false),
                  (name: 'Cloud Firestore', isNormal: false),
                  (name: 'MySQL', isNormal: true),
                ])
                  SkillChip(skill: skill.name, isNormal: skill.isNormal),
              ],
            ),
            const SizedBox(height: 22),

            //* =======================
            Text(
              'DEVICE FEATURES',
              style: AppText.skillLabel.copyWith(
                fontSize: 11.5,
                color: AppColors.slate,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                for (final skill in [
                  (name: 'CameraX', isNormal: true),
                  (name: 'Google ML Kit', isNormal: true),
                  (name: 'QR Scanning', isNormal: true),
                  (name: 'Document Scanner', isNormal: true),
                  (name: 'Facial Detection', isNormal: true),
                  (name: 'POS thermal receipt printing', isNormal: true),
                  (name: 'Google Maps', isNormal: true),
                  (name: 'Localization', isNormal: true),
                ])
                  SkillChip(skill: skill.name, isNormal: skill.isNormal),
              ],
            ),
            const SizedBox(height: 22),

            //* =======================
            Text(
              'AI-ASSISTED DEVELOPMENT · SINCE 2026',
              style: AppText.skillLabel.copyWith(
                fontSize: 11.5,
                color: AppColors.slate,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                for (final skill in [
                  (name: 'Claude Code', isNormal: false),
                  (name: 'Claude Cowork', isNormal: false),
                  (name: 'Spec-first workflows', isNormal: true),
                  (name: 'Multi-agent code review', isNormal: true),
                  (name: 'Custom Claude Skills', isNormal: true),
                  (name: 'CLAUDE.md project guides', isNormal: true),
                  (name: 'Reviewing AI-generated code', isNormal: true),
                ])
                  SkillChip(skill: skill.name, isNormal: skill.isNormal),
              ],
            ),
            const SizedBox(height: 22),

            //* =======================
            Text(
              'VERSION CONTROL & COLLABORATION TOOLS',
              style: AppText.skillLabel.copyWith(
                fontSize: 11.5,
                color: AppColors.slate,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                for (final skill in [
                  (name: 'Git', isNormal: true),
                  (name: 'GitHub', isNormal: true),
                  (name: 'Bitbucket', isNormal: true),
                  (name: 'Jira Board', isNormal: true),
                  (name: 'Confluence', isNormal: true),
                  (name: 'Microsoft Teams', isNormal: true),
                ])
                  SkillChip(skill: skill.name, isNormal: skill.isNormal),
              ],
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
