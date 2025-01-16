import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_curve_visualizer/utils/theme/theme_provider.dart';
import 'package:flutter_curve_visualizer/views/widgets/screen_mode.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:light_dark_theme_toggle/light_dark_theme_toggle.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final screenMode = ScreenModeWidget.of(context);

    final actionPadding = const EdgeInsets.only(right: 12.0);

    final width = MediaQuery.sizeOf(context).width;

    double hPadding = switch (screenMode) {
      ScreenMode.mobile => 0,
      ScreenMode.tablet => 0,
      ScreenMode.web => width * 0.075,
    };

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: AppBar(
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
            child: Consumer<ThemeProvider>(builder: (context, value, child) {
              return LightDarkThemeToggle(
                  themeIconType: ThemeIconType.expand,
                  duration: 500.milliseconds,
                  reverseDuration: 500.milliseconds,
                  value: value.getThemeMode() == ThemeMode.dark,
                  onChanged: (isDark) {
                    value.toggleTheme();
                  });
            }),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
