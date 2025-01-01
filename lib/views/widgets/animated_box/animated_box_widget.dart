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
                /// Translate x
                AnimationType.translateX =>
                  _buildTransformX(constraints, boxSize, child),

                /// Translate Y
                AnimationType.translateY =>
                  _buildTransformY(constraints, boxSize, child),

                /// Rotate
                AnimationType.rotate => _buildRotate(child),

                /// Scale
                AnimationType.scale => _buildScale(child),

                /// Fade
                AnimationType.fade => _buildFade(child),

                /// Flip
                AnimationType.flip => _buildFlip(child),
              },
            ),
          );
        },
      );
    });
  }

  Transform _buildFlip(Widget? child) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(2, 1, 0.0002)
        ..rotateY(animation.value * pi),
      child: child,
    );
  }

  AnimatedOpacity _buildFade(Widget? child) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: animation.value.clamp(0.0, 1.0),
      child: child,
    );
  }

  Transform _buildTransformY(
      BoxConstraints constraints, double boxSize, Widget? child) {
    return Transform.translate(
      offset: Tween(
        begin: Offset(0, (-constraints.maxHeight + boxSize) / 2),
        end: Offset(0, (constraints.maxHeight - boxSize) / 2),
      ).transform(animation.value),
      child: child,
    );
  }

  Transform _buildTransformX(
      BoxConstraints constraints, double boxSize, Widget? child) {
    return Transform.translate(
      offset: Tween(
        begin: Offset((-constraints.maxWidth + boxSize) / 2, 0),
        end: Offset((constraints.maxHeight - boxSize) / 2, 0),
      ).transform(animation.value),
      child: child,
    );
  }

  Transform _buildScale(Widget? child) {
    return Transform.scale(
      scale: animation.value,
      child: child,
    );
  }

  Transform _buildRotate(Widget? child) =>
      Transform.rotate(angle: animation.value * pi, child: child);
}
