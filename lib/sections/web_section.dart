import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:url_launcher/url_launcher.dart';

class WebSection extends StatelessWidget {
  const WebSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppLayout.sectionPaddingY),
      child: ContentWrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('EXTRA', style: AppText.sectionEyebrow),
            const SizedBox(height: 10),

            Text('Web', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                "Not my main focus, but proof I'm not limited to mobile.",
              ),
            ),

            const SizedBox(height: 32),

            Container(
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 26),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: AppGradients.webStrip,
                border: Border.all(width: 1, color: AppColors.border),
              ),

              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _details(context),
                        const SizedBox(height: 22),
                        OutlinedButton(
                          onPressed: () {
                            launchUrl(
                              Uri.parse("https://logiclyricsolutions.com"),
                            );
                          },
                          child: Text("Visit site →"),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: _details(context)),
                        const SizedBox(width: 22),

                        OutlinedButton(
                          onPressed: () {
                            launchUrl(
                              Uri.parse("https://logiclyricsolutions.com"),
                            );
                          },
                          child: Text("Visit site →"),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _details(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.ink,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(Icons.language, size: 20, color: Colors.white),
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Website for our freelance dev team',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
              Text(
                'Live site we use to take on client commissions',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.inkSoft,
                  fontSize: 12.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
