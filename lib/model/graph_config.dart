import 'package:flutter/material.dart';

class GraphConfiguration {
  final int graphDivisions;
  final int curveDivisions;
  final Color graphAxisColor;
  final Color graphCurveColor;
  final Color graphMarkerColor;
  final double graphAxisWidth;
  final double graphCurveWidth;
  final double graphMarkerSize;

  const GraphConfiguration({
    this.graphDivisions = 10,
    this.curveDivisions = 1000,
    required this.graphAxisColor,
    required this.graphCurveColor,
    required this.graphMarkerColor,
    required this.graphAxisWidth,
    required this.graphCurveWidth,
    required this.graphMarkerSize,
  });
}
