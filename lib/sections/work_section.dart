import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/asset/info.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/ai_text_block.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:portfolio/widgets/work_card.dart';
import 'package:portfolio/widgets/work_list.dart';
import 'package:portfolio/widgets/work_pill.dart';

class WorkSection extends StatefulWidget {
  const WorkSection({super.key});

  @override
  State<WorkSection> createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppLayout.sectionPaddingY),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      child: ContentWrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "JPS Group of Companies (Ziaplex, PMTI, DIGIPEP OPC) · 2023 — PRESENT",
              style: AppText.sectionEyebrow,
            ),
            const SizedBox(height: 10),

            Text(
              "Professional Work",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                'Native Android apps in healthcare, financial assistance and agriculture, used by patients, pharmacies, merchants and field officers on phones and Sunmi POS devices. I lead several of them and own their releases.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: 14),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                WorkPill(title: 'healthcare'),
                WorkPill(title: 'payments & financial aid'),
                WorkPill(title: 'offline-first'),
                WorkPill(title: 'pos & kiosk hardware'),
              ],
            ),

            //* NDA NOTE
            const SizedBox(height: 42),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              decoration: BoxDecoration(
                color: AppColors.noticeBg,
                border: Border.all(color: AppColors.noticeBorder, width: 1),
                borderRadius: BorderRadius.circular(AppRadius.banner),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 30,
                    width: 30,

                    decoration: BoxDecoration(
                      color: AppColors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/lock.svg',
                      height: 16,
                      width: 16,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.6,
                          color: AppColors.noticeText,
                        ),
                        children: [
                          TextSpan(
                            text: 'Note on confidentiality — ',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.noticeTextStrong,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          TextSpan(
                            text:
                                "my professional work is under NDA. Client and project names are generalized and I can't share screenshots, but every app below is real, and the live ones are in production today.",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //* WORK CARD
            const SizedBox(height: 38),
            _workHighlights(context),

            //* WORK AI
            const SizedBox(height: 26),
            _workAI(context),
            //* WORK LIST
            const SizedBox(height: 26),
            _workList(context),
          ],
        ),
      ),
    );
  }

  Widget _workHighlights(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    final cards = [
      for (final (index, item) in workHighlightItems.indexed)
        WorkCard(
          number: (index + 1).toString().padLeft(2, '0'),
          status: item.status,
          title: item.title,
          description: item.description,
          tech: item.tech,
          bulletInfo: item.bullets,
        ),
    ];

    if (isMobile) {
      return Column(spacing: 22, children: cards);
    }

    return IntrinsicHeight(
      child: Row(
        spacing: 22,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [for (final card in cards) Expanded(child: card)],
      ),
    );
  }

  Widget _workList(BuildContext context) {
    final visible = _expanded ? workItems : workItems.take(3).toList();

    return Column(
      children: [
        AnimatedSize(
          alignment: Alignment.topCenter,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(width: 1, color: AppColors.border),
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Column(
              // column that holds the list
              children: [
                for (final (index, item) in visible.indexed)
                  WorkList(
                    title: item.title,
                    contribution: item.role,
                    description: item.description,
                    skill: item.skills,
                    isLast: index == visible.length - 1,
                  ),
              ],
            ),
          ),
        ),

        //* button
        const SizedBox(height: 16),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Text(_expanded ? "Hide" : "Show more work"),
        ),
      ],
    );
  }

  Widget _workAI(BuildContext contetx) {
    final columns = AppLayout.isMobile(context) ? 2 : 4;

    return SizedBox(
      width: double.infinity,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.ink,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //? Text Header
                  Text(
                    'How I work with AI · since 2026'.toUpperCase(),
                    style: AppText.sectionEyebrow.copyWith(
                      color: AppColors.amber,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 640),
                    child: Text(
                      'Shipping with Claude Code, with a person in the loop',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 640),
                    child: Text(
                      'In 2026 our team added a spec-first Claude Code workflow to how we build. Agents do more of the typing, people make the decisions, and every step has a check before the next one starts.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        height: 1.6,
                        color: AppColors.aiTextSoft,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  //? Text Blocks
                  Column(
                    spacing: 12,
                    children: [
                      for (var i = 0; i < aiSteps.length; i += columns)
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 12,
                            children: [
                              for (final step in aiSteps.skip(i).take(columns))
                                Expanded(
                                  child: AiTextBlock(
                                    number: step.number,
                                    title: step.title,
                                    description: step.text,
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  //? Arrow with text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('→', style: TextStyle(color: AppColors.amber)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "Set up CLAUDE.md project guides and Claude skills for the KYC app and pharmacy POS repos, so Claude Code follows each app's architecture and conventions",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.aiText,
                                height: 1.55,
                                fontSize: 13.4,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('→', style: TextStyle(color: AppColors.amber)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "Feature, UI and release work with Claude Code in Android Studio, with every change compiled and checked by me before it's done",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.aiText,
                                height: 1.55,
                                fontSize: 13.4,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('→', style: TextStyle(color: AppColors.amber)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "Drafted the KYC app's field user guide, migration guide and release notes with Claude and Cowork",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.aiText,
                                height: 1.55,
                                fontSize: 13.4,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('→', style: TextStyle(color: AppColors.amber)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "Built my own Claude skill that turns commits, Jira, Teams and release activity into daily and weekly work reports",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.aiText,
                                height: 1.55,
                                fontSize: 13.4,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('→', style: TextStyle(color: AppColors.amber)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "Used Claude to audit repository history and document exactly what I built on each project",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.aiText,
                                height: 1.55,
                                fontSize: 13.4,
                              ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ? Bottom Text
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      //* Chips
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final chip in [
                            'CLAUDE CODE',
                            'COWORK',
                            'CUSTOM SKILLS',
                            'CLAUDE.MD',
                            'SPEC-FIRST',
                          ])
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.aiChipBorder,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                chip,
                                style: AppText.mono.copyWith(
                                  fontSize: 10.5,
                                  color: AppColors.aiText,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //? Glow
            Positioned(
              top: -80,
              right: -80,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [AppColors.aiGlow, AppColors.aiGlowEnd],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
