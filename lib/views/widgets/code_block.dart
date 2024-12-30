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
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mode = ScreenModeWidget.of(context);

    final codeStyle = switch (mode) {
      ScreenMode.mobile => Theme.of(context).textTheme.bodyMedium,
      ScreenMode.tablet => Theme.of(context).textTheme.bodyLarge,
      ScreenMode.web => Theme.of(context).textTheme.bodyLarge,
    };

    final double spacing = mode.isMobile ? 5 : 10;

    final double radius = mode.isMobile ? 3 : 5;

    final lightsColors = <Color>[
      Color(0xffff5d5e),
      Color(0xfffbbe27),
      Color(0xff2bc542),
    ];

    final code = "Curve.${curve.name}";

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.0),
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Wrap(
                spacing: 5,
                children: List.from(lightsColors).map((color) {
                  return CircleAvatar(radius: radius, backgroundColor: color);
                }).toList(),
              ),
              Spacer(),
              IconButton(
                onPressed: () => copyCode(context, code),
                padding: EdgeInsets.zero,
                iconSize: 16,
                constraints: BoxConstraints(),
                color: Theme.of(context).colorScheme.onSurface,
                icon: Icon(Icons.copy),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(code, style: codeStyle),
          ),
        ],
      ),
    );
  }
}
