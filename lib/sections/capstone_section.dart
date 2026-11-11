import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:portfolio/widgets/work_pill.dart';

class CapstoneSection extends StatefulWidget {
  const CapstoneSection({super.key});

  @override
  State<CapstoneSection> createState() => _CapstoneSectionState();
}

class _CapstoneSectionState extends State<CapstoneSection> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return SizedBox(
      width: double.infinity,
      child: ContentWrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            Text('FROM COLLEGE', style: AppText.sectionEyebrow),
            const SizedBox(height: 12),
            Text(
              'Capstone Project',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                'My final-year project at Gordon College, wehere I finished BS Information and Technology in 2023.',
              ),
            ),

            const SizedBox(height: 32),

            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                gradient: AppGradients.mediaPlaceholder,
                border: Border.all(width: 1, color: AppColors.border),
                borderRadius: BorderRadius.circular(16),
              ),

              child: isMobile
                  ? Column(children: [_screenshotFrame(), _details(isMobile)])
                  : Row(
                      children: [
                        Expanded(flex: 5, child: _screenshotFrame()),
                        Expanded(flex: 4, child: _details(isMobile)),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _screenshotFrame() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () {
          //TODO
        },
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.border, width: 1),
            ),

            gradient: AppGradients.mediaPlaceholder,
          ),

          child: Stack(
            clipBehavior: Clip.none,
            children: [
              //* Images in a row
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.surface,
                  border: Border.all(width: 1, color: AppColors.border),
                ),

                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(
                        'placeholder/placeholder_web_1.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                color: AppColors.slate,
                                size: 20,
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
              ),

              //* hovered button
              Positioned(
                right: -6, // 8 from the strip's edge (14 padding - 6)
                bottom: -6,
                child: IgnorePointer(
                  child: AnimatedOpacity(
                    opacity: _hovering ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.darkPill,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        'View gallery ↗',
                        style: AppText.chip.copyWith(
                          fontSize: 11,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //* ==== num screenshos
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.darkPill,
                  ),
                  child: Text(
                    '4 screenshots',
                    style: AppText.mono.copyWith(
                      fontSize: 10.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _details(bool isMobile) {
    return Container(
      padding: isMobile ? EdgeInsetsGeometry.all(22) : EdgeInsets.all(28),
      decoration: BoxDecoration(color: AppColors.surface),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Text(
            'Capstone · Research'.toUpperCase(),
            style: AppText.mono.copyWith(
              fontSize: 11.5,
              letterSpacing: 1.4,
              color: AppColors.teal,
            ),
          ),
          Text('Scheducator', style: Theme.of(context).textTheme.titleMedium),
          Text(
            'A web-based schedule designer built for New Cabalan National High School, presented as capstone research at IRCITE 2023, the International Research Conference on Information Technology Education.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final skill in [
                'WEB APP',
                'ANGULAR',
                'IONIC',
                'LARAVEL API',
                'MYSQL',
                'TAILWIND',
                'CAPSTONE RESEARCH',
                'IRCITE 2023',
              ])
                WorkPill(title: skill),
            ],
          ),

          Divider(color: AppColors.border, height: 1, thickness: 1),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.tealSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.school, color: AppColors.teal, size: 14),
              ),
              Flexible(
                child: Text(
                  'BS Information Technology, cum laude',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13.4,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.tealSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.emoji_events,
                  color: AppColors.amberDeep,
                  size: 14,
                ),
              ),
              Flexible(
                child: Text(
                  'Student Programmer of the Year 2023',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13.4,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.tealSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.mic, color: AppColors.teal, size: 14),
              ),
              Flexible(
                child: Text(
                  'Presented at IRCITE 2023',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13.4,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ],
          ),
          Divider(color: AppColors.border, height: 1, thickness: 1),

          const SizedBox(height: 1),
          TextButton(
            style:
                TextButton.styleFrom(
                  foregroundColor: AppColors.teal,
                  overlayColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ).copyWith(
                  textStyle: WidgetStateProperty.resolveWith((states) {
                    final base = GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    );
                    return states.contains(WidgetState.hovered)
                        ? base.copyWith(decoration: TextDecoration.underline)
                        : base;
                  }),
                ),
            onPressed: () {
              //TODO
            },
            child: Text('View gallery'),
          ),
        ],
      ),
    );
  }
}
