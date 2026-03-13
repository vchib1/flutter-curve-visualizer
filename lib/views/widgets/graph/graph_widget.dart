import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/views/widgets/graph/graph_config.dart';
import 'package:flutter_curve_visualizer/views/widgets/graph/graph_settings.dart';
import 'package:flutter_curve_visualizer/views/widgets/screen_mode.dart';
import 'graph_painter.dart';

class GraphWidget extends StatelessWidget {
  final CurvedAnimation animation;
  final AnimationController controller;
  final GraphSettings settings;

  const GraphWidget({
    super.key,
    required this.animation,
    required this.settings,
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

    final size = Size(350, screenSize.height / 4);

    return SizedBox(
      width: screenSize.width * widthToTake,
      height: screenSize.height / 3,
      child: Center(
        child: CustomPaint(
          size: size,
          painter: GraphPainter(
            controller: controller,
            animation: animation,
            settings: settings,
            config: GraphConfiguration(
              xAxisLineCount: 10,
              yAxisLineCount: 6,
              axisWidth: 1,
              curveLineWidth: 2,
              curveLineBoldWidth: 2.5,
              pointerSize: 5,
              axisColor: theme.onSurface.withValues(alpha: 0.25),
              curveLineBoldColor: theme.onSurfaceVariant.withValues(),
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
