import 'dart:math';
import 'package:flutter/material.dart';

class ThemeSwitchPainter extends CustomPainter {
  final IconThemeData iconThemeData;
  final Animation<double> animation;

  ThemeSwitchPainter({
    required this.iconThemeData,
    required this.animation,
  }) : super(repaint: animation);

  Color get iconColor => iconThemeData.color ?? Colors.white;

  Paint get canvasPaint => Paint()
    ..color = iconColor
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final boxSize = size.width * .70;
    final radius = size.width * 0.30;
    final center = Offset(size.width / 2, size.height / 2);

    // Circular mask for center
    final circlePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));

    // save canvas
    canvas.save();

    // move canvas to center
    canvas.translate(center.dx, center.dy);

    // rotate canvas with animation value
    canvas.rotate(1 - animation.value * pi);

    // draw a box with an additional path to clip center circle
    canvas.drawPath(
      Path()
        ..addRect(Rect.fromLTWH(-boxSize / 2, -boxSize / 2, boxSize, boxSize))
        ..addPath(circlePath.shift(-center), Offset.zero)
        ..fillType = PathFillType.evenOdd,
      canvasPaint,
    );

    // rotate canvas to rotate the next box 45 degrees
    canvas.rotate(pi / 4);

    // draw a box with an additional path to clip center circle
    canvas.drawPath(
      Path()
        ..addRect(Rect.fromLTWH(-boxSize / 2, -boxSize / 2, boxSize, boxSize))
        ..addPath(circlePath.shift(-center), Offset.zero)
        ..fillType = PathFillType.evenOdd,
      canvasPaint,
    );

    // restore canvas
    canvas.restore();

    // now draw a circle at the center
    // and translate it with animation to form a moon shape from center to top-right
    final moonRadius = radius - 2;

    final translateX = size.width / 2 + (animation.value * size.width * .10);
    final translateY = size.height / 2 - (animation.value * size.height * .10);

    canvas.drawCircle(Offset(translateX, translateY), moonRadius, canvasPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
