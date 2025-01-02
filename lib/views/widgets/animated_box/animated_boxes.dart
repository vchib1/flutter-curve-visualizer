import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/utils/extension/string.dart';
import 'package:flutter_curve_visualizer/views/widgets/screen_mode.dart';

import 'animated_box_widget.dart';

class AnimationBoxes extends StatelessWidget {
  const AnimationBoxes({super.key, required this.curveAnimation});

  final CurvedAnimation curveAnimation;

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    final spacing = screenMode.spacing;

    return SizedBox(
      width: MediaQuery.of(context).size.width /
          (screenMode.isMobileOrTablet ? 1 : 2),
      child: Wrap(
        spacing: spacing / 2,
        runSpacing: spacing / 2,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: AnimationType.values.map(
          (animationType) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 8.0,
              children: [
                Text(animationType.name.capitalizeFirst()),
                SizedBox.square(
                  dimension: 100,
                  child: AnimatedBoxWidget(
                    animationType: animationType,
                    animation: curveAnimation,
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
