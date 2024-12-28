import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/model/graph_config.dart';

class AnimationGraph extends StatelessWidget {
  final bool showCurveOutline;
  final CurvedAnimation animation;
  final AnimationController controller;

  const AnimationGraph({
    super.key,
    this.showCurveOutline = false,
    required this.animation,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = max(150.0, constraints.maxWidth / 2);

        final boxSize = Size(width / 10, width / 10);

        final size = Size(width, width);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            CustomPaint(
              size: size,
              painter: CurvePainter(
                controller: controller,
                animation: animation,
                config: GraphConfiguration(
                  showCurveOutline: showCurveOutline,
                  axisColor: theme.onSurfaceVariant,
                  curveOutlineColor:
                      theme.onSurfaceVariant.withValues(alpha: 0.25),
                  curveLineColor: theme.primaryFixed,
                  graphMarkerColor: theme.primaryFixed,
                  axisWidth: 0.125,
                  curveLineWidth: 2.5,
                  pointerSize: 5,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                final offsetTween = Tween<Offset>(
                  begin: Offset.zero,
                  end: Offset(0, -size.height + boxSize.height),
                ).animate(animation);

                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // line
                    ColoredBox(
                      color: theme.onSurfaceVariant.withValues(alpha: 0.25),
                      child: SizedBox(
                        width: boxSize.width / 10,
                        height: size.height,
                      ),
                    ),

                    // box
                    Transform.translate(
                      offset: offsetTween.value,
                      child: ColoredBox(
                        color: theme.primaryFixed,
                        child: SizedBox.fromSize(size: boxSize),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class CurvePainter extends CustomPainter {
  CurvePainter({
    required this.controller,
    required this.animation,
    required this.config,
  }) : super(repaint: animation);

  final CurvedAnimation animation;
  final AnimationController controller;
  final GraphConfiguration config;

  // Set the number of divisions for the curve drawing
  int get divisions => config.curveDivisions;

  @override
  void paint(Canvas canvas, Size size) {
    final points = generateCurveValues(animation, divisions);
    _drawAxis(canvas, size);
    _drawCurveBg(canvas, points, size);
    _drawCurve(canvas, points, size);
    _drawCurrentValueMarker(canvas, size, points);
  }

  void _drawCurrentValueMarker(Canvas canvas, Size size, List<double> points) {
    final xPos = controller.value * size.width;
    final yPos = (1 - points[(controller.value * (divisions - 1)).floor()]) *
        size.height;

    Paint markerPaint = Paint()
      ..color = config.graphMarkerColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawCircle(Offset(xPos, yPos), config.pointerSize, markerPaint);
  }

  void _drawCurve(Canvas canvas, List<double> points, Size size) {
    Paint curvePaint = Paint()
      ..color = config.curveLineColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = config.curveLineWidth
      ..style = PaintingStyle.stroke;

    Path path = Path();

    // Start the path at the first point
    path.moveTo(0, (1 - points.first) * size.height);

    // Draw line segments based on the generated curve points
    for (int i = 1; i < points.length; i++) {
      // current point of the curve
      final currentX = controller.value * size.width;
      final currentY = (1 - points[i]) * size.height;

      // point to draw
      final pointX = (i / divisions * size.width);
      final pointY = (1 - points[i]) * size.height;

      // skip points that are ahead the current point
      // draw only the points that are behind the current point
      if (pointX >= currentX && pointY >= currentY) {
        continue;
      }

      path.lineTo(pointX, pointY);
    }

    // Draw the curve on the canvas
    canvas.drawPath(path, curvePaint);
  }

  void _drawCurveBg(Canvas canvas, List<double> points, Size size) {
    if (!config.showCurveOutline) return;

    Paint curvePaint = Paint()
      ..color = config.curveOutlineColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = config.curveLineWidth
      ..style = PaintingStyle.stroke;

    Path path = Path();

    // Start the path at the first point
    path.moveTo(0, (1 - points.first) * size.height);

    // Draw line segments based on the generated curve points
    for (int i = 1; i < points.length; i++) {
      // point to draw
      final pointX = (i / divisions * size.width);
      final pointY = (1 - points[i]) * size.height;

      path.lineTo(pointX, pointY);
    }

    // Draw the curve on the canvas
    canvas.drawPath(path, curvePaint);
  }

  void _drawAxis(Canvas canvas, Size size) {
    Paint axisPaint = Paint()
      ..color = config.axisColor
      ..strokeWidth = config.axisWidth
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final div = config.graphDivisions;

    for (int i = 0; i <= config.graphDivisions; i++) {
      final x1 = i / div * size.width;
      final y1 = size.height;
      canvas.drawLine(Offset(x1, 0), Offset(x1, y1), axisPaint);

      final y2 = i / div * size.height;
      final x2 = size.width;
      canvas.drawLine(Offset(0, y2), Offset(x2, y2), axisPaint);
    }
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) =>
      controller.value != oldDelegate.controller.value;
}

// Generate curve values based on the animation's curve behavior
List<double> generateCurveValues(CurvedAnimation anim, int divisions) {
  return List.generate(
    divisions,
    (index) {
      // Normalize the index to be between 0 and 1 (for use with the curve)
      double progress = index / (divisions - 1);

      // Use the curve's transformation to generate the value for the current point
      // The curve will cause different behaviors like bounce, ease, etc.
      return anim.curve.transform(progress);
    },
  );
}
