import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/utils/theme/theme_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: const Text('Flutter Curve Visualizer'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(
            onPressed: () {
              launchUrl(Uri.parse(
                  "https://github.com/vchib1/flutter-curve-visualizer"));
            },
            icon: SvgPicture.asset(
              "assets/svg/github.svg",
              width: theme.iconTheme.size ?? 24,
              height: theme.iconTheme.size ?? 24,
              colorFilter: ColorFilter.mode(
                theme.iconTheme.color ?? Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Consumer<ThemeProvider>(
            builder: (context, value, child) {
              final iconData = value.getThemeMode() == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode;

              return IconButton(
                onPressed: () => value.toggleTheme(),
                icon: Icon(iconData),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
