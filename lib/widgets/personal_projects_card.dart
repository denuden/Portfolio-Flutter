import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/work_pill.dart';

class PersonalProjectsCard extends StatefulWidget {
  final List<String> imageAssets;
  final int numberOfMoreImages;
  final String title;
  final List<String> skills;
  final String description;
  final void Function() onClickViewGallery;
  final void Function() onClickViewCode;
  const PersonalProjectsCard({
    super.key,
    required this.imageAssets,
    required this.numberOfMoreImages,
    required this.title,
    required this.skills,
    required this.description,
    required this.onClickViewGallery,
    required this.onClickViewCode,
  });

  @override
  State<PersonalProjectsCard> createState() => _PersonalProjectsCardState();
}

class _PersonalProjectsCardState extends State<PersonalProjectsCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.card),
        color: AppColors.surface,
        border: Border.all(width: 1, color: AppColors.border),
      ),
      child: Column(
        children: [
          //* Images
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _hovering = true),
            onExit: (_) => setState(() => _hovering = false),
            child: GestureDetector(
              onTap: () => widget.onClickViewGallery(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        for (final (index, asset) in widget.imageAssets.indexed)
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 140),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.surface,
                                ),

                                child: Stack(
                                  children: [
                                    Image.asset(
                                      asset,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Center(
                                                child: Icon(
                                                  Icons.image_not_supported,
                                                  color: AppColors.slate,
                                                  size: 20,
                                                ),
                                              ),
                                    ),

                                    if (widget.numberOfMoreImages > 0 &&
                                        index == 2)
                                      Positioned.fill(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: AppColors.mediaOverlay,
                                          ),
                                        ),
                                      ),
                                    if (widget.numberOfMoreImages > 0 &&
                                        index == 2)
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '+${widget.numberOfMoreImages} more',
                                            style: AppText.mediaMore,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
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
                  ],
                ),
              ),
            ),
          ),

          //* Details
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Wrap(
                  runSpacing: 6,
                  spacing: 6,
                  children: [
                    for (final skill in widget.skills) WorkPill(title: skill),
                  ],
                ),

                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  spacing: 16,
                  children: [
                    TextButton(
                      style:
                          TextButton.styleFrom(
                            foregroundColor: AppColors.teal,
                            overlayColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ).copyWith(
                            textStyle: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              final base = GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              );
                              return states.contains(WidgetState.hovered)
                                  ? base.copyWith(
                                      decoration: TextDecoration.underline,
                                    )
                                  : base;
                            }),
                          ),
                      onPressed: () {
                        widget.onClickViewGallery();
                      },
                      child: Text('View gallery'),
                    ),
                    TextButton(
                      style:
                          TextButton.styleFrom(
                            foregroundColor: AppColors.teal,
                            overlayColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ).copyWith(
                            textStyle: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              final base = GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              );
                              return states.contains(WidgetState.hovered)
                                  ? base.copyWith(
                                      decoration: TextDecoration.underline,
                                    )
                                  : base;
                            }),
                          ),
                      onPressed: () {
                        widget.onClickViewCode();
                      },
                      child: Text('Code'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
