import 'package:flutter/material.dart';
import 'package:portfolio/asset/info.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/content_wrap.dart';
import 'package:portfolio/widgets/dialog/gallery_dialog.dart';
import 'package:portfolio/widgets/personal_projects_card.dart';
import 'package:url_launcher/url_launcher.dart';

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

            _projectCards(context),

            //* template strip
            const SizedBox(height: 22),
            Container(
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 26),
              decoration: BoxDecoration(
                gradient: AppGradients.webStrip,
                border: Border.all(width: 1, color: AppColors.border),
                borderRadius: BorderRadius.circular(AppRadius.card),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 22,
                children: [
                  //?BODY
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.layers,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DenuBoilerplateCompose — my starter template',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.ink,
                                  ),
                            ),
                            Text(
                              'Package Structure, Hilt, Room Database, Retrofit, Pagination, Type-safe Navigation, WorkManager, DataStore, Dialogs, and other utilities/helpers, wired up and ready to build on',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: AppColors.inkSoft,
                                    fontSize: 12.5,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      //? Button for web
                      if (!isMobile)
                        OutlinedButton(
                          onPressed: () {
                            launchUrl(
                              Uri.parse(
                                "https://github.com/denuden/DenuBoilerplateCompose",
                              ),
                            );
                          },
                          child: Text("View template →"),
                        ),
                    ],
                  ),

                  //? Button for mobile
                  if (isMobile)
                    OutlinedButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse(
                            "https://github.com/denuden/DenuBoilerplateCompose",
                          ),
                        );
                      },
                      child: Text("View template →"),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _projectCards(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);

    final cards = [
      for (final project in personalProjects)
        PersonalProjectsCard(
          title: project.title,
          numberOfMoreImages: project.images.length - 3,
          description: project.summary,
          skills: project.cardSkills,
          imageAssets: project.images.take(3).toList(),
          onClickViewGallery: () => showGalleryDialog(
            context,
            title: project.title,
            description: project.details,
            skills: project.gallerySkills,
            imageAssets: project.images,
            codeUrl: project.codeUrl,
          ),
          onClickViewCode: () => launchUrl(Uri.parse(project.codeUrl)),
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
}
