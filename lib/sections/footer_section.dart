import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    return Column(
      children: [
        const SizedBox(height: 32),
        Container(
          padding: EdgeInsets.symmetric(vertical: 32),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.border),
          ),
          child: ContentWrap(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _details(context),
                          const SizedBox(height: 22),
                          _links(context),
                        ],
                      )
                    : Row(
                        children: [
                          _details(context),
                          const Spacer(),
                          _links(context),
                        ],
                      ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ContentWrap(
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  //* Left
                  Text(
                    '© 2026 Von Denuelle Tandoc',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.5,
                      color: AppColors.slate,
                    ),
                  ),
                  Spacer(),
                  //* Right
                  Text.rich(
                    TextSpan(
                      text: '🔷 Built with Flutter — ',
                      style: AppText.mono.copyWith(
                        fontSize: 11.5,
                        color: AppColors.slate,
                      ),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => launchUrl(
                                Uri.parse(
                                  'https://github.com/denuden/Portfolio-Flutter',
                                ),
                              ),
                              child: Text(
                                'view source',
                                style: AppText.mono.copyWith(
                                  fontSize: 11.5,
                                  color: AppColors.teal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _details(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's talk.",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: 'Open to Android and Flutter roles — ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: AppColors.inkSoft,
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => launchUrl(
                      Uri(scheme: 'mailto', path: 'vondenuelle@gmail.com'),
                    ),
                    child: Text(
                      'vondenuelle@gmail.com',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.teal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _links(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Resume',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: AppColors.ink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        TextButton(
          onPressed: () {
            launchUrl(Uri.parse("https://github.com/denuden"));
          },
          child: Text(
            'GitHub',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: AppColors.ink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        TextButton(
          onPressed: () {
            launchUrl(Uri.parse("https://www.linkedin.com/in/denuden/"));
          },
          child: Text(
            'LinkedLn',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: AppColors.ink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
