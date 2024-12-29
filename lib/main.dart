import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/screen_mode.dart';
import 'package:flutter_curve_visualizer/utils/theme/theme.dart';
import 'views/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ScreenMode getLayoutType(double width) {
    if (width < 480) {
      return ScreenMode.mobile;
    } else if (width < 850) {
      return ScreenMode.tablet;
    } else {
      return ScreenMode.web;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = MaterialTheme(Theme.of(context).textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Curve Visualizer',
      themeMode: ThemeMode.light,
      theme: theme.lightMediumContrast(),
      darkTheme: theme.dark(),
      home: LayoutBuilder(
        builder: (context, constraints) {
          return ScreenModeWidget(
            mode: getLayoutType(constraints.maxWidth),
            child: const HomePage(),
          );
        },
      ),
    );
  }
}
