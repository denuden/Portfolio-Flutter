import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:portfolio/asset/info.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/widgets/work_pill.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:video_player/video_player.dart';

/// Gallery items are plain asset paths; a video is told apart by its extension.
bool isVideoAsset(String asset) => asset.toLowerCase().endsWith('.mp4');

/// Width / height of the phone screenshots (1080 x 2424). Every phone page,
/// video included, sits in a frame of this shape so nothing jumps between
/// pages or while the video loads.
const double _phoneAspect = 1080 / 2424;

/// Stage padding above and below the frame (room for the close button and
/// the page counter).
const double _stagePaddingTop = 28;
const double _stagePaddingBottom = 48;

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
    builder: (context) {
      final dialog = GalleryDialog(
        title: title,
        description: description,
        skills: skills,
        imageAssets: imageAssets,
        codeUrl: codeUrl,
        isWebAsset: isWebAsset,
      );
      // The blur is costly on phone browsers, so it is desktop only.
      if (AppLayout.isMobile(context)) return dialog;
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: dialog,
      );
    },
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

  void _previousPage() {
    if (_currentPage > 0) _animateToPage(_currentPage - 1);
  }

  void _nextPage() {
    if (_currentPage < widget.imageAssets.length - 1) {
      _animateToPage(_currentPage + 1);
    }
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

    // Left / right arrow keys move through the gallery on desktop browsers.
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowLeft): _previousPage,
        const SingleActivator(LogicalKeyboardKey.arrowRight): _nextPage,
      },
      child: Focus(
        autofocus: true,
        child: Dialog(
          constraints: BoxConstraints(
            maxWidth: (isMobile ? double.infinity : 880),
            maxHeight: screenHeight * 0.88,
          ),

          insetPadding: const EdgeInsets.all(AppSpacing.lg),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.modal),
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

                      if (!isMobile)
                        Positioned(
                          top: 4,
                          right: 4,
                          child: _OverlayIconButton(
                            icon: Icons.close,
                            tooltip: 'Close',
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                    ],
                  ),
          ),
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
    // Stacked layout: about 62% of the screen, but never so short that a
    // landscape phone squashes the screenshot, nor taller than needed.
    final stageHeight = isMobile || isWebAsset
        ? (screenHeight * 0.62).clamp(320.0, 640.0)
        : screenHeight * 0.88;

    // Decode screenshots at the size they are shown, not at full resolution.
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final frameWidth =
        (stageHeight - _stagePaddingTop - _stagePaddingBottom) * _phoneAspect;
    final stageCacheWidth = isWebAsset
        ? null
        : (frameWidth * dpr).ceil().clamp(1, 1080);

    return Stack(
      children: [
        SizedBox(
          width: isMobile || isWebAsset ? double.infinity : 400,
          height: stageHeight,
          child: Container(
            padding: const EdgeInsets.only(
              top: _stagePaddingTop,
              bottom: _stagePaddingBottom,
            ),
            decoration: BoxDecoration(gradient: AppGradients.mediaPlaceholder),

            child: Stack(
              children: [
                // Lets a mouse drag the pages on desktop browsers, not only
                // touch.
                ScrollConfiguration(
                  behavior: ScrollConfiguration.of(
                    context,
                  ).copyWith(dragDevices: PointerDeviceKind.values.toSet()),
                  child: PageView.builder(
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

                      final Widget media = isVideoAsset(asset)
                          ? GalleryVideo(
                              asset: asset,
                              posterAsset: videoPosters[asset],
                              posterCacheWidth: stageCacheWidth,
                              isActive: index == _currentPage,
                            )
                          : Image.asset(
                              asset,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              cacheWidth: stageCacheWidth,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      color: AppColors.slate,
                                      size: 20,
                                    ),
                                  ),
                            );

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: isWebAsset
                                ? media
                                : AspectRatio(
                                    aspectRatio: _phoneAspect,
                                    child: media,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                if (widget.imageAssets.length > 1) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: _OverlayIconButton(
                        icon: Icons.keyboard_arrow_left,
                        tooltip: 'Previous',
                        onPressed: _currentPage > 0 ? _previousPage : null,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: _OverlayIconButton(
                        icon: Icons.keyboard_arrow_right,
                        tooltip: 'Next',
                        onPressed: _currentPage < widget.imageAssets.length - 1
                            ? _nextPage
                            : null,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),

        if (isMobile || isWebAsset)
          Positioned(
            top: 4,
            right: 4,
            child: _OverlayIconButton(
              icon: Icons.close,
              tooltip: 'Close',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
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
                style: AppText.mono.copyWith(color: AppColors.white),
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
    final thumbWidth = isWebAsset ? 120.0 : 54.0;
    final thumbHeight = isWebAsset ? 60.0 : 120.0;
    final thumbCacheWidth =
        (thumbWidth * MediaQuery.devicePixelRatioOf(context)).ceil();

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
                  width: thumbWidth,
                  height: thumbHeight,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: AppGradients.mediaPlaceholder,
                    ),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _selectedThumbnailIndex == index
                            ? AppColors.amber
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedThumbnailIndex = index;
                            _animateToPage(index);
                          });
                        },
                        child: isVideoAsset(asset)
                            ? _VideoThumbnail(
                                posterAsset: videoPosters[asset],
                                cacheWidth: thumbCacheWidth,
                              )
                            : Image.asset(
                                asset,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                cacheWidth: thumbCacheWidth,
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
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// The round white buttons over the stage (close, previous, next). 40px to
/// look at, with a 48px tap area for fingers on phone browsers.
class _OverlayIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  const _OverlayIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      iconSize: 20,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.ink,
        disabledBackgroundColor: AppColors.surface.withValues(alpha: 0.5),
        disabledForegroundColor: AppColors.slate,
        fixedSize: const Size(40, 40),
        minimumSize: const Size(40, 40),
        tapTargetSize: MaterialTapTargetSize.padded,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}

/// A round dark badge with a play icon, used on the video thumbnail and over
/// the paused video.
class _PlayBadge extends StatelessWidget {
  final double size;
  const _PlayBadge({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.darkPill,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.play_arrow_rounded,
        color: AppColors.white,
        size: size * 0.6,
      ),
    );
  }
}

/// Still image for a video, or the stage gradient when it has none.
class _Poster extends StatelessWidget {
  final String? asset;
  final int? cacheWidth;
  const _Poster({required this.asset, this.cacheWidth});

  @override
  Widget build(BuildContext context) {
    const placeholder = DecoratedBox(
      decoration: BoxDecoration(gradient: AppGradients.mediaPlaceholder),
    );
    if (asset == null) return placeholder;
    return Image.asset(
      asset!,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      cacheWidth: cacheWidth,
      errorBuilder: (context, error, stackTrace) => placeholder,
    );
  }
}

class _VideoThumbnail extends StatelessWidget {
  final String? posterAsset;
  final int cacheWidth;
  const _VideoThumbnail({required this.posterAsset, required this.cacheWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _Poster(asset: posterAsset, cacheWidth: cacheWidth),
        const Center(child: _PlayBadge(size: 26)),
      ],
    );
  }
}

/// One video page in the gallery.
///
/// - It does not download anything until its page is first shown.
/// - It plays muted and looping while its page is showing, and pauses when
///   swiped away. Tap to pause / play; drag the bar at the bottom to seek.
/// - It stays alive while the dialog is open, so swiping back does not reload
///   it or restart it from the beginning.
/// - While loading it shows the poster with a spinner, at the same size as the
///   video, so nothing jumps. If loading fails it shows a message and Retry.
class GalleryVideo extends StatefulWidget {
  final String asset;
  final String? posterAsset;
  final int? posterCacheWidth;
  final bool isActive;
  const GalleryVideo({
    super.key,
    required this.asset,
    required this.isActive,
    this.posterAsset,
    this.posterCacheWidth,
  });

  @override
  State<GalleryVideo> createState() => _GalleryVideoState();
}

class _GalleryVideoState extends State<GalleryVideo>
    with AutomaticKeepAliveClientMixin {
  VideoPlayerController? _controller;
  bool _failed = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (widget.isActive) _initialize();
  }

  void _initialize() {
    final controller = VideoPlayerController.asset(widget.asset);
    _controller = controller;
    _failed = false;
    controller.setLooping(true);
    // Browsers only autoplay muted videos.
    controller.setVolume(0);
    controller
        .initialize()
        .then((_) {
          if (!mounted || _controller != controller) return;
          setState(() {});
          if (widget.isActive) controller.play();
        })
        .catchError((Object _) {
          if (mounted && _controller == controller) {
            setState(() => _failed = true);
          }
        });
  }

  void _retry() {
    _controller?.dispose();
    setState(_initialize);
  }

  void _togglePlay() {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    controller.value.isPlaying ? controller.pause() : controller.play();
  }

  @override
  void didUpdateWidget(GalleryVideo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive == oldWidget.isActive) return;

    final controller = _controller;
    if (controller == null) {
      // First time the page is shown: start downloading now.
      if (widget.isActive) setState(_initialize);
      return;
    }
    if (!controller.value.isInitialized) return;
    widget.isActive ? controller.play() : controller.pause();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final poster = _Poster(
      asset: widget.posterAsset,
      cacheWidth: widget.posterCacheWidth,
    );

    if (_failed) {
      return Stack(
        fit: StackFit.expand,
        children: [
          poster,
          const ColoredBox(color: AppColors.mediaOverlay),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.videocam_off,
                  color: AppColors.white,
                  size: 28,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  "Video couldn't load",
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: AppSpacing.xs),
                TextButton(
                  onPressed: _retry,
                  style: TextButton.styleFrom(foregroundColor: AppColors.amber),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ],
      );
    }

    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return Stack(
        fit: StackFit.expand,
        children: [
          poster,
          if (controller == null)
            // Not started yet (page not shown): a play badge, like the
            // thumbnail.
            const Center(child: _PlayBadge(size: 56))
          else
            Center(
              child: Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.darkPill,
                  shape: BoxShape.circle,
                ),
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.white,
                ),
              ),
            ),
        ],
      );
    }

    final videoSize = controller.value.size;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Fill the phone frame; the video and the screenshots are almost the
        // same shape, so this crops at most a few pixels.
        FittedBox(
          fit: BoxFit.cover,
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: videoSize.width,
            height: videoSize.height,
            child: VideoPlayer(controller),
          ),
        ),

        // On web the video is an HTML <video> element that sits above the
        // Flutter page and swallows every tap, so Flutter widgets over it
        // never get them. PointerInterceptor hands the taps back to Flutter:
        // tapping, the pause button, the seek bar and swiping pages all work
        // over the video.
        PointerInterceptor(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _togglePlay,
              child: ValueListenableBuilder<VideoPlayerValue>(
                valueListenable: controller,
                builder: (context, value, _) => Stack(
                  fit: StackFit.expand,
                  children: [
                    IgnorePointer(
                      child: AnimatedOpacity(
                        opacity: value.isPlaying ? 0 : 1,
                        duration: const Duration(milliseconds: 150),
                        child: const Center(child: _PlayBadge(size: 56)),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _VideoControls(
                        controller: controller,
                        isPlaying: value.isPlaying,
                        onTogglePlay: _togglePlay,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Bar along the bottom of the video: a pause / play button and a seek bar
/// on a soft dark fade so they read over any frame.
class _VideoControls extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isPlaying;
  final VoidCallback onTogglePlay;
  const _VideoControls({
    required this.controller,
    required this.isPlaying,
    required this.onTogglePlay,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x0014181F), AppColors.darkPill],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 16, 12, 4),
        child: Row(
          children: [
            IconButton(
              tooltip: isPlaying ? 'Pause' : 'Play',
              onPressed: onTogglePlay,
              iconSize: 24,
              color: AppColors.white,
              icon: Icon(
                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              ),
            ),
            Expanded(
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                // Taller touch area around the thin bar, for fingers.
                padding: const EdgeInsets.symmetric(vertical: 14),
                colors: VideoProgressColors(
                  playedColor: AppColors.amber,
                  bufferedColor: AppColors.white.withValues(alpha: 0.45),
                  backgroundColor: AppColors.white.withValues(alpha: 0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
