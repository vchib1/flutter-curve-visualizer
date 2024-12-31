import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/screen_mode.dart';
import 'package:flutter_curve_visualizer/utils/curves_enum.dart';
import 'package:flutter_curve_visualizer/utils/extension/string.dart';
import 'package:flutter_curve_visualizer/utils/theme/theme_provider.dart';
import 'package:flutter_curve_visualizer/views/widgets/animated_box/animated_box_widget.dart';
import 'package:flutter_curve_visualizer/views/widgets/dropdown_menu.dart';
import 'package:flutter_curve_visualizer/views/widgets/graph/graph_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/code_block.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;

  late CurvedAnimation animation;

  late String selectedCategory;

  late CurvesEnum selectedCurve;

  late int animationTime;

  late AnimationController playPauseController;

  bool showCurveOutline = true;

  @override
  void initState() {
    super.initState();
    selectedCategory = CurvesEnum.list.keys.first;
    selectedCurve = CurvesEnum.list.values.first.first;

    animationTime = 2;

    playPauseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationTime),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: selectedCurve.curve,
    );

    controller.repeat(reverse: true);

    controller.addListener(playPauseListener);
  }

  void playPauseListener() {
    if (controller.isAnimating) {
      playPauseController.forward();
    } else {
      playPauseController.reset();
    }
  }

  @override
  void dispose() {
    controller.removeListener(playPauseListener);
    playPauseController.dispose();
    controller.dispose();
    super.dispose();
  }

  void updateCategory(String? category) {
    setState(() {
      selectedCategory = category!;
      selectedCurve = CurvesEnum.list[category]!.first;
      animation = CurvedAnimation(
        parent: controller,
        curve: selectedCurve.curve,
      );
    });
  }

  void updateCurve(CurvesEnum curve) {
    setState(() {
      selectedCurve = curve;

      animation = CurvedAnimation(
        parent: controller,
        curve: selectedCurve.curve,
      );
    });
  }

  void updateAnimationTime(double seconds) {
    animationTime = seconds.toInt();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationTime),
    );
    setState(() {});

    animation = CurvedAnimation(
      parent: controller,
      curve: selectedCurve.curve,
    );
    controller.repeat(reverse: true);
    playPauseController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    final theme = Theme.of(context);

    final decoration = BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimaryFixed,
      borderRadius: BorderRadius.circular(10),
    );

    final animationWidget = Column(
      children: [
        // Graph
        GraphWidget(
          showCurveOutline: showCurveOutline,
          controller: controller,
          animation: animation,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width /
              (screenMode.isMobileOrTablet ? 1 : 3),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            children: AnimationType.values.map(
              (animationType) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8.0,
                  children: [
                    Text(animationType.name.capitalizeFirst()),
                    SizedBox.square(
                      dimension: 100,
                      child: AnimatedBoxWidget(
                        animationType: animationType,
                        animation: animation,
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ],
    );

    final controlsWidget = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          // Code block
          CodeBlock(curve: selectedCurve),

          // Curve category
          DropdownMenuWidget<String>(
            title: "Curve Category",
            value: selectedCategory,
            items: CurvesEnum.list.keys.toList(),
            onChanged: updateCategory,
          ),

          // Curve type
          DropdownMenuWidget<CurvesEnum>(
            title: "Curve Type",
            value: selectedCurve,
            items: CurvesEnum.list[selectedCategory]!..toList(),
            onChanged: (value) => updateCurve(value!),
            childBuilder: (context, value, textStyle) {
              return Text(value.name.toString(), style: textStyle);
            },
          ),

          // Curve type
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: decoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Time: ${animationTime}s",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Slider(
                  value: animationTime.toDouble(),
                  min: 1.0,
                  max: 10.0,
                  onChanged: updateAnimationTime,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedIcon(
              icon: AnimatedIcons.play_pause, progress: playPauseController),
        ),
        onPressed: () {
          if (controller.isAnimating) {
            controller.stop();
            playPauseController.animateBack(0.0);
          } else {
            controller.repeat(reverse: true);
            playPauseController.forward();
          }
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: switch (ScreenModeWidget.of(context)) {
            ScreenMode.mobile => Column(
                spacing: 10,
                children: [
                  animationWidget,
                  controlsWidget,
                  const SizedBox(height: 10),
                ],
              ),
            ScreenMode.tablet => Column(
                spacing: 20,
                children: [
                  animationWidget,
                  controlsWidget,
                  const SizedBox(height: 20),
                ],
              ),
            ScreenMode.web => Row(
                spacing: 10,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: animationWidget,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: controlsWidget,
                    ),
                  ),
                ],
              ),
          },
        ),
      ),
    );
  }
}