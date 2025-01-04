import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CubicCurveInputWidget extends StatelessWidget {
  final List<TextEditingController> controllers;
  final void Function(Curve curve)? onApply;

  const CubicCurveInputWidget({
    super.key,
    required this.controllers,
    this.onApply,
  });

  void _onPressed() {
    if (onApply == null) return;

    final x1 = double.parse(controllers[0].text);
    final y1 = double.parse(controllers[1].text);
    final x2 = double.parse(controllers[2].text);
    final y2 = double.parse(controllers[3].text);
    onApply?.call(Cubic(x1, y1, x2, y2));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.titleSmall;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryFixed,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Control Points", style: titleStyle),
            Flex(
              direction: Axis.horizontal,
              children: [
                _TextField(
                  key: UniqueKey(),
                  label: "X1",
                  controller: controllers[0],
                ),
                _TextField(
                  key: UniqueKey(),
                  label: "Y1",
                  controller: controllers[1],
                ),
                _TextField(
                  key: UniqueKey(),
                  label: "X2",
                  controller: controllers[2],
                ),
                _TextField(
                  key: UniqueKey(),
                  label: "Y2",
                  controller: controllers[3],
                ),
              ],
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: _onPressed,
              mouseCursor: WidgetStateMouseCursor.clickable,
              color: theme.colorScheme.primary,
              padding: EdgeInsets.all(12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minWidth: constraints.maxWidth,
              child: Text(
                "Apply",
                style: theme.primaryTextTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 0),
          ],
        ),
      );
    });
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const _TextField({
    super.key,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
