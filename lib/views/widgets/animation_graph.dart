import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/model/graph_config.dart';

class AnimationGraph extends StatelessWidget {
  final CurvedAnimation animation;
  final AnimationController controller;

  const AnimationGraph(
      {super.key, required this.animation, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return CustomPaint(
      size: const Size(400, 400),
      painter: CurvePainter(
        controller: controller,
        animation: animation,
        config: GraphConfiguration(
          graphDivisions: 10,
          graphAxisColor: theme.onSurface.withValues(alpha: 0.5),
          graphCurveColor: theme.primary,
          graphMarkerColor: theme.primary,
          graphAxisWidth: 1,
          graphCurveWidth: 2.5,
          graphMarkerSize: 10,
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  CurvePainter({
    required this.controller,
    required this.animation,
    required this.config,
  });

  final CurvedAnimation animation;
  final AnimationController controller;
  final GraphConfiguration config;

  // Set the number of divisions for the curve drawing
  int get divisions => config.curveDivisions;

  @override
  void paint(Canvas canvas, Size size) {
    final points = generateCurveValues(animation, divisions);
    _drawCurve(canvas, points, size);
    _drawCurrentValueMarker(canvas, size, points);
    _drawAxis(canvas, size);
  }

  void _drawCurrentValueMarker(Canvas canvas, Size size, List<double> points) {
    final xPos = controller.value * size.width;
    final yPos = (1 - points[(controller.value * (divisions - 1)).floor()]) *
        size.height;

    Paint markerPaint = Paint()
      ..color = config.graphMarkerColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;
    canvas.drawCircle(Offset(xPos, yPos), config.graphMarkerSize, markerPaint);
  }

  void _drawCurve(Canvas canvas, List<double> points, Size size) {
    Paint curvePaint = Paint()
      ..color = config.graphCurveColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = config.graphCurveWidth
      ..style = PaintingStyle.stroke;

    // Create a path to draw the curve
    Path path = Path();

    // Start the path at the first point
    path.moveTo(0, (1 - points.first) * size.height);

    // Draw line segments based on the generated curve points
    for (int i = 1; i < points.length; i++) {
      path.lineTo(i / divisions * size.width,
          (1 - points[i]) * size.height); // Inverted Y position
    }

    // Draw the curve on the canvas
    canvas.drawPath(path, curvePaint);
  }

  void _drawAxis(Canvas canvas, Size size) {
    Paint axisPaint = Paint()
      ..color = config.graphAxisColor
      ..strokeWidth = config.graphAxisWidth
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

    // Draw the labels for the axes (simple text rendering)
    _paintText(canvas, 'Value(${animation.value.toStringAsFixed(1)})',
        Offset(size.width / 2, size.height + 18));
    _paintText(
        canvas, 'Time ${controller.value.toStringAsFixed(1)}', Offset(-50, 0));
  }

  // Paint text on the canvas (for axis labels)
  void _paintText(Canvas canvas, String text, Offset offset) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(color: Colors.black)),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, offset);
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
