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

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackgroundSquares(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawBackgroundSquares(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = iconColor
      ..style = PaintingStyle.fill;

    final boxSize = size.width * .75;
    final radius = size.width * 0.30;
    final center = Offset(size.width / 2, size.height / 2);

    // Create circular mask
    final circlePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(animation.value * pi);

    canvas.drawPath(
      Path()
        ..addRect(Rect.fromLTWH(-boxSize / 2, -boxSize / 2, boxSize, boxSize))
        ..addPath(circlePath.shift(Offset(-size.width / 2, -size.height / 2)),
            Offset.zero)
        ..fillType = PathFillType.evenOdd,
      paint,
    );

    canvas.rotate(pi / 4);
    canvas.drawPath(
      Path()
        ..addRect(Rect.fromLTWH(-boxSize / 2, -boxSize / 2, boxSize, boxSize))
        ..addPath(circlePath.shift(Offset(-size.width / 2, -size.height / 2)),
            Offset.zero)
        ..fillType = PathFillType.evenOdd,
      paint,
    );

    canvas.restore();

    final rad = radius - 2;

    canvas.drawCircle(
        Offset(size.width / 2 + (animation.value * size.width * .10),
            size.height / 2 - (animation.value * size.height * .10)),
        rad,
        paint);
  }
}
