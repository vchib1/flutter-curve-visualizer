import 'package:flutter/material.dart';

class GraphConfiguration {
  final int xAxisLineCount;
  final int yAxisLineCount;
  final int curveDivisions;
  final Color axisColor;
  final Color curveLineColor;
  final Color curveLineBoldColor;
  final Color curveOutlineColor;
  final Color graphMarkerColor;
  final double axisWidth;
  final double curveLineWidth;
  final double curveLineBoldWidth;
  final double pointerSize;

  const GraphConfiguration({
    this.xAxisLineCount = 10,
    this.yAxisLineCount = 10,
    this.curveDivisions = 1000,
    required this.axisColor,
    required this.curveLineColor,
    required this.curveLineBoldColor,
    required this.graphMarkerColor,
    required this.axisWidth,
    required this.curveLineWidth,
    required this.curveLineBoldWidth,
    required this.pointerSize,
    required this.curveOutlineColor,
  }) : assert(pointerSize > 0, 'pointerSize must be greater than 0'),
       assert(axisWidth > 0, 'axisWidth must be greater than 0'),
       assert(curveLineWidth > 0, 'curveLineWidth must be greater than 0'),
       assert(
         curveLineBoldWidth > 0,
         'curveLineBoldWidth must be greater than 0',
       ),
       assert(curveDivisions > 0, 'curveDivisions must be greater than 0'),
       assert(xAxisLineCount >= 0, 'graphDivisions must be not negative');
}
