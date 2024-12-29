import 'package:flutter/material.dart';
import 'graph_config.dart';

class GraphPainter extends CustomPainter {
  GraphPainter({
    required this.controller,
    required this.animation,
    required this.config,
  }) : super(repaint: animation);

  final CurvedAnimation animation;
  final AnimationController controller;
  final GraphConfiguration config;

  int get divisions => config.curveDivisions;

  @override
  bool shouldRepaint(GraphPainter oldDelegate) =>
      controller.value != oldDelegate.controller.value;

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

    // Draw X-axis lines
    for (int i = 0; i <= config.xAxisLineCount; i++) {
      final x = i / config.xAxisLineCount * size.width;
      final y = size.height;
      canvas.drawLine(Offset(x, 0), Offset(x, y), axisPaint);
    }

    for (int i = 0; i <= config.yAxisLineCount; i++) {
      final x = size.width;
      final y = i / config.yAxisLineCount * size.height;
      canvas.drawLine(Offset(0, y), Offset(x, y), axisPaint);
    }
  }
}

List<double> generateCurveValues(CurvedAnimation anim, int divisions) {
  return List.generate(
    divisions,
    (index) {
      double progress = index / (divisions - 1);
      return anim.curve.transform(progress);
    },
  );
}
