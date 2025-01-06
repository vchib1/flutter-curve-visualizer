import 'package:flutter/material.dart';

class CubicGraph extends StatefulWidget {
  const CubicGraph({super.key});

  @override
  State<CubicGraph> createState() => _CubicGraphState();
}

class _CubicGraphState extends State<CubicGraph> {
  Offset x2Position = const Offset(100, 100);
  Offset y2Position = const Offset(200, 200);
  bool isDraggingX2 = false;
  bool isDraggingY2 = false;

  void _updatePosition(Offset position) {
    setState(() {
      if (isDraggingX2) {
        x2Position = position;
      } else if (isDraggingY2) {
        y2Position = position;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    // Size of the actual graph area
    final graphSize = Size(350, 300);

    // Size of the draggable area
    final containerSize = Size(screenSize.width, screenSize.height);

    // Offset to center the graph in the container
    final graphOffset = Offset(
      (containerSize.width - graphSize.width) / 2,
      (containerSize.height - graphSize.height) / 2,
    );

    return MouseRegion(
      cursor: isDraggingX2 || isDraggingY2
          ? SystemMouseCursors.grabbing
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onPanStart: (details) {
          final pos = details.localPosition;
          if ((pos - (x2Position + graphOffset)).distance < 20) {
            setState(() => isDraggingX2 = true);
          } else if ((pos - (y2Position + graphOffset)).distance < 20) {
            setState(() => isDraggingY2 = true);
          }
        },
        onPanUpdate: (details) =>
            _updatePosition(details.localPosition - graphOffset),
        onPanEnd: (_) => setState(() {
          isDraggingX2 = false;
          isDraggingY2 = false;
        }),
        onPanCancel: () => setState(() {
          isDraggingX2 = false;
          isDraggingY2 = false;
        }),
        child: Container(
          width: containerSize.width,
          height: containerSize.height,
          color: Colors.white,
          child: CustomPaint(
            size: containerSize,
            painter: CubicGraphPainter(
              x2Position: x2Position,
              y2Position: y2Position,
              isX2Active: isDraggingX2,
              isY2Active: isDraggingY2,
              graphSize: graphSize,
              graphOffset: graphOffset,
            ),
          ),
        ),
      ),
    );
  }
}

class CubicGraphPainter extends CustomPainter {
  final Offset x2Position;
  final Offset y2Position;
  final bool isX2Active;
  final bool isY2Active;
  final Size graphSize;
  final Offset graphOffset;

  CubicGraphPainter({
    required this.x2Position,
    required this.y2Position,
    required this.isX2Active,
    required this.isY2Active,
    required this.graphSize,
    required this.graphOffset,
  });

  @override
  bool shouldRepaint(covariant CubicGraphPainter oldDelegate) {
    return x2Position != oldDelegate.x2Position ||
        y2Position != oldDelegate.y2Position ||
        isX2Active != oldDelegate.isX2Active ||
        isY2Active != oldDelegate.isY2Active;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(graphOffset.dx, graphOffset.dy);
    _drawAxisLines(canvas, graphSize);
    _drawBezierCurve(canvas, graphSize);
    _drawControlPoints(canvas, graphSize);
  }

  void _drawAxisLines(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    final linePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.75
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Graph background
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = Colors.grey.withValues(alpha: 0.1),
    );

    // x axis
    canvas.drawLine(Offset(0, height), Offset(width, height), linePaint);

    // y axis
    canvas.drawLine(Offset.zero, Offset(0, height), linePaint);
  }

  void _drawBezierCurve(Canvas canvas, Size size) {
    final curvePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(
      x2Position.dx,
      x2Position.dy,
      y2Position.dx,
      y2Position.dy,
      size.width,
      0,
    );

    canvas.drawPath(path, curvePaint);

    final controlLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, size.height), x2Position, controlLinePaint);
    canvas.drawLine(y2Position, Offset(size.width, 0), controlLinePaint);
  }

  void _drawControlPoints(Canvas canvas, Size size) {
    final pointerPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    // Fixed points
    canvas.drawCircle(
      Offset(0, size.height),
      10,
      pointerPaint..color = Colors.red,
    );

    canvas.drawCircle(
      Offset(size.width, 0),
      10,
      pointerPaint..color = Colors.red,
    );

    // Draggable points
    canvas.drawCircle(
      x2Position,
      10,
      pointerPaint..color = isX2Active ? Colors.blue : Colors.green,
    );

    canvas.drawCircle(
      y2Position,
      10,
      pointerPaint..color = isY2Active ? Colors.blue : Colors.green,
    );
  }
}
