import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:portfolio/widgets/work_pill.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

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
            Text("ZIAPLEX · 2023 — PRESENT", style: AppText.sectionEyebrow),
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
          ],
        ),
      ),
    );
  }
}
