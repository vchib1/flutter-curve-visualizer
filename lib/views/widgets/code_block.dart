import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_curve_visualizer/views/widgets/screen_mode.dart';

class CodeBlock extends StatelessWidget {
  final String code;

  const CodeBlock({super.key, required this.code});

  void copyCode(BuildContext context, String code) {
    Clipboard.setData(ClipboardData(text: code));

    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
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

    final borderRadius = BorderRadius.circular(10);

    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 1.0,
      borderRadius: borderRadius,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryFixed,
          borderRadius: borderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Wrap(
                    spacing: 5,
                    children: List.from(lightsColors).map((color) {
                      return CircleAvatar(
                          radius: radius, backgroundColor: color);
                    }).toList(),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => copyCode(context, code),
                    child: Icon(
                      Icons.copy,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(code, style: codeStyle),
            ),
          ],
        ),
      ),
    );
  }
}
