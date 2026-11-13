import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/work_pill.dart';

void showGalleryDialog(
  BuildContext context, {
  required String title,
  required String description,
  required List<String> skills,
  required List<String> imageAssets,
  String? codeUrl,
  bool isWebAsset = false,
}) {
  showDialog(
    context: context,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: GalleryDialog(
        title: title,
        description: description,
        skills: skills,
        imageAssets: imageAssets,
        codeUrl: codeUrl,
        isWebAsset: isWebAsset,
      ),
    ),
  );
}

class GalleryDialog extends StatefulWidget {
  final String title;
  final String description;
  final List<String> skills;
  final List<String> imageAssets;
  final String? codeUrl;
  final bool isWebAsset;
  const GalleryDialog({
    super.key,
    required this.title,
    required this.description,
    required this.skills,
    required this.imageAssets,
    this.codeUrl,
    required this.isWebAsset,
  });

  @override
  State<GalleryDialog> createState() => _GalleryDialogState();
}

class _GalleryDialogState extends State<GalleryDialog> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  int _selectedThumbnailIndex = 0;

  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppLayout.isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      constraints: BoxConstraints(
        maxWidth: (isMobile ? double.infinity : 880),
        maxHeight: screenHeight * 0.88,
      ),

      insetPadding: EdgeInsets.all(24),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),

        child: isMobile || widget.isWebAsset
            ? Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _stage(
                          context,
                          isMobile,
                          widget.isWebAsset,
                          screenHeight,
                        ),
                        _details(
                          context,
                          isMobile,
                          widget.isWebAsset,
                          screenHeight,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //* ========================= LEFT SIDE
                      _stage(
                        context,
                        isMobile,
                        widget.isWebAsset,
                        screenHeight,
                      ),
                      //* ========================= RIGHT SIDE
                      Expanded(
                        child: SingleChildScrollView(
                          child: _details(
                            context,
                            isMobile,
                            widget.isWebAsset,
                            screenHeight,
                          ),
                        ),
                      ),
                    ],
                  ),

                  !isMobile
                      ? Positioned(
                          top: 8,
                          right: 8,
                          child: Padding(
                            padding: EdgeInsetsGeometry.all(8),

                            child: IconButton.filled(
                              iconSize: 15,
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.surface,
                                fixedSize: const Size(30, 30),
                                minimumSize: const Size(30, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.zero,
                              ),
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.close),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
      ),
    );
  }

  Widget _stage(
    BuildContext context,
    bool isMobile,
    bool isWebAsset,
    double screenHeight,
  ) {
    return Stack(
      children: [
        SizedBox(
          width: isMobile || isWebAsset ? double.infinity : 400,
          height: isMobile || isWebAsset
              ? screenHeight * 0.62
              : screenHeight * 0.88,
          child: Container(
            padding: EdgeInsets.only(top: 28, bottom: 48),
            decoration: BoxDecoration(gradient: AppGradients.mediaPlaceholder),

            child: Stack(
              children: [
                PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                      _selectedThumbnailIndex = index;
                    });
                  },
                  controller: _pageController,
                  itemCount: widget.imageAssets.length,
                  itemBuilder: (context, index) {
                    final asset = widget.imageAssets[index];

                    return Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(18),
                              child: Image.asset(
                                asset,
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
                          ),
                        ),
                      ],
                    );
                  },
                ),

                if (widget.imageAssets.length > 1) ...[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        iconSize: 15,
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.surface,
                          fixedSize: const Size(30, 30),
                          minimumSize: const Size(30, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          if (_currentPage > 0) {
                            _animateToPage(_currentPage - 1);
                          }
                        },
                        icon: const Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        iconSize: 15,
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.surface,
                          fixedSize: const Size(30, 30),
                          minimumSize: const Size(30, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          if (_currentPage < widget.imageAssets.length - 1) {
                            _animateToPage(_currentPage + 1);
                          }
                        },
                        icon: const Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),

        isMobile || isWebAsset
            ? Positioned(
                top: 8,
                right: 8,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(8),

                  child: IconButton.filled(
                    iconSize: 15,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.surface,
                      fixedSize: const Size(30, 30),
                      minimumSize: const Size(30, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                    ),
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              )
            : const SizedBox(),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.darkPill,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                '${_currentPage + 1} / ${widget.imageAssets.length}',
                style: AppText.mono.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _details(
    BuildContext context,
    bool isMobile,
    bool isWebAsset,
    double screenHeight,
  ) {
    return Padding(
      padding: isMobile || isWebAsset
          ? EdgeInsetsGeometry.only(top: 22, left: 22, right: 22, bottom: 16)
          : EdgeInsetsGeometry.only(top: 56, bottom: 20, right: 28, left: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final skill in widget.skills) WorkPill(title: skill),
            ],
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              //TODO
            },
            child: Text('Code'),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final (index, asset) in widget.imageAssets.indexed)
                SizedBox(
                  width: isWebAsset ? 120 : 54,
                  height: isWebAsset ? 60 : 120,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    foregroundDecoration: BoxDecoration(
                      // CHANGED: border moved here
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:
                            _selectedThumbnailIndex ==
                                index // CHANGED
                            ? AppColors.amber
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedThumbnailIndex = index;
                          _animateToPage(index);
                        });
                      },
                      child: Image.asset(
                        asset,
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
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
