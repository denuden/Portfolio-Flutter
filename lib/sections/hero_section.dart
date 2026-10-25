import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/hero_tech_pill.dart';
import 'package:portfolio/widgets/skill_chip.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    final details = _heroDetails(context, isMobile);
    final image = _widgetImage(context, isMobile);

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 48,
        children: [image, details],
      );
    }

    return Row(
      spacing: 48,
      children: [
        Expanded(flex: 11, child: details),
        Expanded(flex: 9, child: image),
      ],
    );
  }

  Widget _heroDetails(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.tealSoft,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Flexible(
            child: Text(
              'AVAILABLE FOR ANDROID & FLUTTER ROLES',
              style: AppText.heroEyebrow,
            ),
          ),
        ),

        const SizedBox(height: 20),

        Text.rich(
          TextSpan(
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: isMobile ? 34 : 44,
            ), // base style for everything
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
        Wrap(
          spacing: 14,
          runSpacing: 12,
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

        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.fromLTRB(10, 7, 14, 7),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: AppColors.flutterBlue,
                  shape: BoxShape.circle,
                ),
              ),
              Flexible(
                child: Text(
                  'This site is made with Flutter',
                  style: AppText.tag.copyWith(color: AppColors.ink), // NEW
                ),
              ),
              Container(width: 1, height: 14, color: AppColors.border),

              TextButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse('https://github.com/denuden/Portfolio-Flutter'),
                  );
                },
                style: ButtonStyle(
                  textStyle: WidgetStateProperty.resolveWith((states) {
                    final baseStyle = TextStyle(fontSize: 16.0);
                    if (states.contains(WidgetState.hovered)) {
                      return baseStyle.copyWith(
                        decoration: TextDecoration.underline,
                      );
                    }
                    return baseStyle;
                  }),
                ),
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

  Widget _widgetImage(BuildContext context, bool isMobile) {
    return SizedBox(
      height: 460,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: AlignmentGeometry.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    boxShadow: AppShadows.phone,
                  ),
                  child: SvgPicture.asset(
                    width: 230,
                    height: 460,
                    'assets/images/Phone.svg',
                  ),
                ),
              ),

              Positioned(
                top: h * 0.08,
                left: -w * (isMobile ? 0.0 : 0.06),
                child: TechPill(
                  label: "Kotlin",
                  dotColor: AppColors.kotlinPurple,
                ),
              ),

              Positioned(
                top: h * 0.38,
                right: -w * (isMobile ? 0.02 : 0.10),
                child: const TechPill(
                  label: 'Flutter',
                  dotColor: AppColors.flutterBlue,
                ),
              ),
              Positioned(
                bottom: h * 0.14,
                left: -w * (isMobile ? 0.0 : 0.12),
                child: const TechPill(
                  label: 'Compose',
                  dotColor: AppColors.composeGreen,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
