import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/views/widgets/screen_mode.dart';
import 'package:flutter_curve_visualizer/utils/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/theme/theme_provider.dart';
import 'views/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(pref: pref),
      child: const MyApp(),
    ),
  );
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

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Curve Visualizer',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.getThemeMode(),
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
      },
    );
  }
}
