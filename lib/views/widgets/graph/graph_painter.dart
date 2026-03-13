import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/views/widgets/graph/graph_settings.dart';
import 'graph_config.dart';

class GraphPainter extends CustomPainter {
  const GraphPainter({
    required this.controller,
    required this.animation,
    required this.config,
    required this.settings,
  }) : super(repaint: animation);

  final CurvedAnimation animation;
  final AnimationController controller;
  final GraphConfiguration config;
  final GraphSettings settings;

  int get divisions => config.curveDivisions;

  @override
  bool shouldRepaint(GraphPainter oldDelegate) =>
      controller.value != oldDelegate.controller.value;

  @override
  void paint(Canvas canvas, Size size) {
    final points = generateCurveValues(animation, divisions);

    _drawAxisTitle(canvas, size);
    _drawAxisLines(canvas, size);
    _drawCurveBg(canvas, points, size);
    _drawCurve(canvas, points, size);
    _drawAxisValueMarkers(canvas, size);
    _drawCurrentValueMarker(canvas, size, points);
  }

  void _drawAxisTitle(Canvas canvas, Size size) {
    // --- Shared text style ---
    final textStyle = TextStyle(
      color: config.curveLineBoldColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

    // --- X-Axis Title ---
    final xTitlePainter = TextPainter(
      text: TextSpan(text: "x", style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    final xTitleOffset = Offset(
      size.width + xTitlePainter.width,
      size.height - (xTitlePainter.height / 2),
    );

    xTitlePainter.paint(canvas, xTitleOffset);

    final yTitlePainter = TextPainter(
      text: TextSpan(text: "y", style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    canvas.save();
    canvas.translate((-yTitlePainter.width / 2), (-xTitlePainter.height * 1.5));
    yTitlePainter.paint(canvas, Offset.zero);
    canvas.restore();
  }

  // Draws Vertical Line for the Current Value
  void _drawAxisValueMarkers(Canvas canvas, Size size) {
    final progress = controller.value; // 0.0 → 1.0

    final paint = Paint()
      ..color = config.curveOutlineColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Vertical Line (X position)
    final dx = progress * size.width;

    final verticalStart = Offset(dx, 0);
    final verticalEnd = Offset(dx, size.height);

    canvas.drawLine(verticalStart, verticalEnd, paint);
  }

  // Draws Current Value Circular Marker
  void _drawCurrentValueMarker(Canvas canvas, Size size, List<double> points) {
    final xPos = controller.value * size.width;
    final yPos =
        (1 - points[(controller.value * (divisions - 1)).floor()]) *
        size.height;

    Paint markerPaint = Paint()
      ..color = config.graphMarkerColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawCircle(Offset(xPos, yPos), config.pointerSize, markerPaint);
  }

  // Draws & animate the curve of the animation
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
    for (int i = 0; i < points.length; i++) {
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

  // Draws the preview curve
  void _drawCurveBg(Canvas canvas, List<double> points, Size size) {
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

  // Draws Background Axis Lines
  void _drawAxisLines(Canvas canvas, Size size) {
    Paint axisPaint = Paint()
      ..color = config.axisColor
      ..strokeWidth = config.axisWidth
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint boldAxisPaint = Paint()
      ..color = config.axisColor
      ..strokeWidth = config.curveLineBoldWidth
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw X-axis lines
    for (int i = 0; i < config.xAxisLineCount; i++) {
      final x = (i / config.xAxisLineCount * size.width).roundToDouble();
      final y = size.height;

      if (i == 0) {
        canvas.drawLine(Offset(x, 0), Offset(x, y), boldAxisPaint);
      } else {
        if (!settings.enableAxisLines) continue;
        canvas.drawLine(Offset(x, 0), Offset(x, y), axisPaint);
      }
    }

    for (int i = 1; i <= config.yAxisLineCount; i++) {
      final x = size.width;
      final y = (i / config.yAxisLineCount * size.height).roundToDouble();

      if (i == config.yAxisLineCount) {
        canvas.drawLine(Offset(0, y), Offset(x, y), boldAxisPaint);
      } else {
        if (!settings.enableAxisLines) continue;
        canvas.drawLine(Offset(0, y), Offset(x, y), axisPaint);
      }
    }
  }
}

// creates a list of curve values to draw on graph
List<double> generateCurveValues(CurvedAnimation anim, int divisions) {
  return List.generate(divisions, (index) {
    double progress = index / (divisions - 1);
    return anim.curve.transform(progress);
  });
}
