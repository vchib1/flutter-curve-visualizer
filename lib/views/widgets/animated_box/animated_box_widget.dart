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
      final boxSize = constraints.maxHeight / 4;

      return AnimatedBuilder(
        animation: animation,
        child: ColoredBox(
          color: theme.primary,
          child: SizedBox(
            width: boxSize,
            height: boxSize,
          ),
        ),
        builder: (context, child) {
          return Container(
            alignment: Alignment.center,
            color: theme.onPrimaryFixed,
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
              AnimationType.fade => Opacity(
                  // accept values between 0 and 1
                  opacity: max(0, min(1, animation.value)),
                  child: child,
                ),

              /// Flip
              AnimationType.flip => Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(2, 1, 0.0015)
                    ..rotateY(animation.value * pi),
                  child: child,
                ),
            },
          );
        },
      );
    });
  }
}
