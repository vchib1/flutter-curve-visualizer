import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/utils/theme/theme_provider.dart';
import 'package:flutter_curve_visualizer/views/widgets/animated_theme_switch/painter.dart';
import 'package:provider/provider.dart';

class AnimatedThemeSwitcher extends StatefulWidget {
  const AnimatedThemeSwitcher({super.key});

  @override
  State<AnimatedThemeSwitcher> createState() => _AnimatedThemeSwitcherState();
}

class _AnimatedThemeSwitcherState extends State<AnimatedThemeSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutBack,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isDark =
        context.read<ThemeProvider>().getThemeMode() == ThemeMode.dark;

    if ((isDark && controller.status != AnimationStatus.completed) ||
        (!isDark && controller.status != AnimationStatus.dismissed)) {
      if (isDark) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconTheme = Theme.of(context).iconTheme;

    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return IconButton(
          onPressed: provider.toggleTheme,
          icon: CustomPaint(
            size: Size.square(iconTheme.size ?? 24),
            painter: ThemeSwitchPainter(
              animation: animation,
              iconThemeData: iconTheme,
            ),
          ),
        );
      },
    );
  }
}
