import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/views/widgets/graph/graph_config.dart';
import 'package:flutter_curve_visualizer/screen_mode.dart';
import 'graph_painter.dart';

class GraphWidget extends StatelessWidget {
  final bool showCurveOutline;
  final CurvedAnimation animation;
  final AnimationController controller;

  const GraphWidget({
    super.key,
    this.showCurveOutline = false,
    required this.animation,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final mode = ScreenModeWidget.of(context);

    final widthToTake = switch (mode) {
      ScreenMode.mobile => 0.8,
      ScreenMode.tablet => 0.75,
      ScreenMode.web => 0.35,
    };

    final screenSize = MediaQuery.sizeOf(context);

    final size = Size(350, screenSize.height / 3);

    return SizedBox(
      width: screenSize.width * widthToTake,
      height: screenSize.height / 2,
      child: Center(
        child: CustomPaint(
          size: size,
          painter: GraphPainter(
            controller: controller,
            animation: animation,
            config: GraphConfiguration(
              xAxisLineCount: 10,
              yAxisLineCount: 5,
              axisWidth: 0.125,
              curveLineWidth: 2.5,
              pointerSize: 5,
              axisColor: theme.onSurface,
              showCurveOutline: showCurveOutline,
              curveOutlineColor: theme.onSurfaceVariant.withValues(alpha: 0.25),
              curveLineColor: theme.primaryFixed,
              graphMarkerColor: theme.primaryFixed,
            ),
          ),
        ),
      ),
    );
  }
}
