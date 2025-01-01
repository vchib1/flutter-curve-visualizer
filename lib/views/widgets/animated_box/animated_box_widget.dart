import 'dart:math';
import 'package:flutter/material.dart';

enum AnimationType { translateX, translateY, rotate, scale, fade, flip }

class AnimatedBoxWidget extends StatelessWidget {
  final AnimationType animationType;
  final Animation animation;

  const AnimatedBoxWidget({
    super.key,
    required this.animation,
    required this.animationType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return LayoutBuilder(builder: (context, constraints) {
      final boxSize = min(constraints.maxWidth, constraints.maxHeight) / 4;

      return AnimatedBuilder(
        animation: animation,
        child: ColoredBox(
          color: theme.primary,
          child: SizedBox.square(dimension: boxSize),
        ),
        builder: (context, child) {
          return ColoredBox(
            color: theme.onPrimaryFixed,
            child: Align(
              alignment: Alignment.center,
              child: switch (animationType) {
                /// Rotate
                AnimationType.rotate =>
                  Transform.rotate(angle: animation.value * pi, child: child),

                /// Scale
                AnimationType.scale => Transform.scale(
                    scale: animation.value,
                    child: child,
                  ),

                /// Translate x
                AnimationType.translateX => Transform.translate(
                    offset: Tween(
                      begin: Offset((-constraints.maxWidth + boxSize) / 2, 0),
                      end: Offset((constraints.maxHeight - boxSize) / 2, 0),
                    ).transform(animation.value),
                    child: child,
                  ),

                /// Translate Y
                AnimationType.translateY => Transform.translate(
                    offset: Tween(
                      begin: Offset(0, (-constraints.maxHeight + boxSize) / 2),
                      end: Offset(0, (constraints.maxHeight - boxSize) / 2),
                    ).transform(animation.value),
                    child: child,
                  ),

                /// Fade
                AnimationType.fade => AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: animation.value.clamp(0.0, 1.0),
                    child: child,
                  ),

                /// Flip
                AnimationType.flip => Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..setEntry(2, 1, 0.0002)
                      ..rotateY(animation.value * pi),
                    child: child,
                  ),
              },
            ),
          );
        },
      );
    });
  }
}
