import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class LockedPlaceholder extends StatelessWidget {
  const LockedPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: CustomPaint(painter: _StripesPainter()),
      ),
    );
  }
}

class _StripesPainter extends CustomPainter {
  static const _stripeWidth = 8.0;

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Fill the whole box with the light color
    canvas.drawRect(Offset.zero & size, Paint()..color = AppColors.lockedA);

    // 2. Draw the darker diagonal stripes on top
    final stripePaint = Paint()
      ..color = AppColors.lockedB
      ..strokeWidth = _stripeWidth;

    // Stripes are 45° lines, so the horizontal distance between them
    // is the stripe spacing (light + dark = 16) times √2
    final step = _stripeWidth * 2 * sqrt2;

    for (double x = -size.height; x < size.width; x += step) {
      canvas.drawLine(
        Offset(x, size.height), // bottom-left
        Offset(x + size.height, 0), // top-right
        stripePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
