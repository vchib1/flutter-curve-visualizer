import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_curve_visualizer/screen_mode.dart';
import 'package:flutter_curve_visualizer/utils/curves_enum.dart';

class CodeBlock extends StatelessWidget {
  final CurvesEnum curve;

  CodeBlock({super.key, CurvesEnum? curve})
      : curve = curve ?? CurvesEnum.values.first;

  void copyCode(BuildContext context, String code) {
    Clipboard.setData(ClipboardData(text: code));

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Code copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mode = ScreenModeWidget.of(context);

    final codeStyle = switch (mode) {
      ScreenMode.mobile => Theme.of(context).textTheme.bodySmall,
      ScreenMode.tablet => Theme.of(context).textTheme.bodyMedium,
      ScreenMode.web => Theme.of(context).textTheme.bodyLarge,
    };

    final double padding = mode.isMobile ? 8 : 16;

    final double spacing = mode.isMobile ? 5 : 10;

    final double radius = mode.isMobile ? 5 : 7.5;

    final lightsColors = <Color>[
      Color(0xffff5d5e),
      Color(0xfffbbe27),
      Color(0xff2bc542),
    ];

    final code =
        "CurvedAnimation(\n\t\t\t\tparent: controller,\n\t\t\t\tcurve: Curves.${curve.name},\n);";

    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryFixed,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 5,
                  children: List.from(lightsColors).map((color) {
                    return CircleAvatar(radius: radius, backgroundColor: color);
                  }).toList(),
                ),
                IconButton(
                  onPressed: () => copyCode(context, code),
                  iconSize: radius * 3,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  color: Theme.of(context).colorScheme.onSurface,
                  icon: Icon(Icons.copy),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(child: Text(code, style: codeStyle)),
            ),
          ],
        ),
      ),
    );
  }
}
