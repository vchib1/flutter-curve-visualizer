import 'package:flutter/material.dart';

class GraphConfiguration {
  final int graphDivisions;
  final int curveDivisions;
  final Color axisColor;
  final Color curveLineColor;
  final Color curveOutlineColor;
  final Color graphMarkerColor;
  final double axisWidth;
  final double curveLineWidth;
  final double pointerSize;
  final bool showCurveOutline;

  const GraphConfiguration({
    this.graphDivisions = 10,
    this.curveDivisions = 1000,
    required this.axisColor,
    required this.curveLineColor,
    required this.graphMarkerColor,
    required this.axisWidth,
    required this.curveLineWidth,
    required this.pointerSize,
    required this.curveOutlineColor,
    this.showCurveOutline = false,
  })  : assert(pointerSize > 0, 'pointerSize must be greater than 0'),
        assert(axisWidth > 0, 'axisWidth must be greater than 0'),
        assert(curveLineWidth > 0, 'curveLineWidth must be greater than 0'),
        assert(curveDivisions > 0, 'curveDivisions must be greater than 0'),
        assert(graphDivisions >= 0, 'graphDivisions must be not negative');
}
