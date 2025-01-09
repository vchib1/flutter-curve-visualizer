import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/utils/theme/theme_provider.dart';
import 'package:flutter_curve_visualizer/views/widgets/animated_theme_switch/widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final actionPadding = const EdgeInsets.only(right: 12.0);

    return AppBar(
      title: const Text('Flutter Curve Visualizer'),
      actions: [
        Padding(
          padding: actionPadding,
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
          padding: actionPadding,
          child: AnimatedThemeSwitcher(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
