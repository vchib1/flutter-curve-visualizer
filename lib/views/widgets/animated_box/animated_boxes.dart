import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_curve_visualizer/utils/extension/string.dart';
import 'package:flutter_curve_visualizer/views/widgets/screen_mode.dart';
import 'animated_box_widget.dart';

class AnimationBoxes extends StatelessWidget {
  const AnimationBoxes({
    super.key,
    required this.curveAnimation,
    required this.animationTypes,
    required this.onAcceptWithDetails,
  });

  final List<int> animationTypes;
  final CurvedAnimation curveAnimation;
  final void Function(DragTargetDetails<int> details, int newIndex)?
      onAcceptWithDetails;

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    final spacing = screenMode.spacing;

    const boxSize = 100.0;

    return SizedBox(
      width: MediaQuery.of(context).size.width /
          (screenMode.isMobileOrTablet ? 1 : 2),
      child: Wrap(
        key: ValueKey(animationTypes),
        spacing: spacing / 2,
        runSpacing: spacing / 2,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: animationTypes.map(
          (index) {
            return DragTarget<int>(
              onWillAcceptWithDetails: (_) => true,
              onAcceptWithDetails: (details) =>
                  onAcceptWithDetails?.call(details, index),
              builder: (_, __, ___) {
                final child = Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8.0,
                  children: [
                    Text(AnimationType.values[index].name.capitalizeFirst()),
                    SizedBox.square(
                      dimension: boxSize,
                      child: AnimatedBoxWidget(
                        animationType: AnimationType.values[index],
                        animation: curveAnimation,
                      ),
                    ),
                  ],
                );

                return MouseRegion(
                  cursor: SystemMouseCursors.grab,
                  child: Draggable(
                    data: index,
                    childWhenDragging: Column(
                      children: [
                        Text(""),
                        SizedBox.square(dimension: boxSize),
                      ],
                    ),
                    feedback: AnimatedScale(
                      scale: 1.150,
                      duration: 200.ms,
                      child: Material(
                        child: child,
                      ),
                    ),
                    child: child,
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
