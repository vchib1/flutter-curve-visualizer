import 'package:flutter_curve_visualizer/model/curve_model.dart';

class GraphSettings {
  final String selectedCategory;
  final CurveModel selectedCurve;
  final bool enableAxisLines;
  final bool enableCurveOutline;
  final bool enableValueVerticalLine;
  final int animationTime;

  const GraphSettings({
    required this.selectedCategory,
    required this.selectedCurve,
    required this.enableAxisLines,
    required this.enableCurveOutline,
    required this.enableValueVerticalLine,
    required this.animationTime,
  });

  GraphSettings copyWith({
    String? selectedCategory,
    CurveModel? selectedCurve,
    bool? enableAxisLines,
    bool? enableCurveOutline,
    bool? enableValueVerticalLine,
    int? animationTime,
  }) {
    return GraphSettings(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedCurve: selectedCurve ?? this.selectedCurve,
      enableAxisLines: enableAxisLines ?? this.enableAxisLines,
      enableCurveOutline: enableCurveOutline ?? this.enableCurveOutline,
      enableValueVerticalLine:
          enableValueVerticalLine ?? this.enableValueVerticalLine,
      animationTime: animationTime ?? this.animationTime,
    );
  }
}
