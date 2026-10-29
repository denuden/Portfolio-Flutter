import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class ContentWrap extends StatelessWidget {
  const ContentWrap({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppLayout.maxContentWidth),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppLayout.gutter),
            child: child,
          ),
        ),
      ),
    );
  }
}
