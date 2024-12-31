import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/screen_mode.dart';
import 'package:flutter_curve_visualizer/utils/curves_enum.dart';
import 'package:flutter_curve_visualizer/utils/extension/string.dart';
import 'package:flutter_curve_visualizer/views/widgets/animated_box/animated_box_widget.dart';
import 'package:flutter_curve_visualizer/views/widgets/appbar.dart';
import 'package:flutter_curve_visualizer/views/widgets/dropdown_menu.dart';
import 'package:flutter_curve_visualizer/views/widgets/graph/graph_widget.dart';
import 'widgets/code_block.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController playPauseController;
  late AnimationController controller;
  late CurvedAnimation curveAnimation;

  late String selectedCategory;
  late CurvesEnum selectedCurve;

  late int animationTime;

  @override
  void initState() {
    super.initState();
    selectedCategory = CurvesEnum.list.keys.first;
    selectedCurve = CurvesEnum.list.values.first.first;

    animationTime = 2;

    playPauseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..forward();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationTime),
    )..repeat(reverse: true);

    curveAnimation = CurvedAnimation(
      parent: controller,
      curve: selectedCurve.curve,
    );
  }

  @override
  void dispose() {
    playPauseController.dispose();
    controller.dispose();
    super.dispose();
  }

  void updateCategory(String? category) {
    if (category == null) return;

    setState(() {
      selectedCategory = category;
      selectedCurve = CurvesEnum.list[category]!.first;
      curveAnimation = CurvedAnimation(
        parent: controller,
        curve: selectedCurve.curve,
      );
    });
  }

  void updateCurve(CurvesEnum curve) {
    setState(() {
      selectedCurve = curve;
      curveAnimation.curve = curve.curve;
    });
  }

  void updateAnimationTime(double seconds) {
    // return if both values are same
    if (animationTime == seconds.toInt()) return;

    setState(() {
      animationTime = seconds.toInt();

      controller.duration = Duration(seconds: animationTime);

      curveAnimation.curve = selectedCurve.curve;

      if (controller.isForwardOrCompleted) {
        controller.repeat(reverse: true);
      } else {
        controller.reverse().then((value) => controller.repeat(reverse: true));
      }

      playPauseController.forward();
    });
  }

  void playPauseAnimation() {
    if (controller.isAnimating) {
      controller.stop();
      playPauseController.animateBack(0.0);
    } else {
      controller.repeat(reverse: true);
      playPauseController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    final double spacing = switch (screenMode) {
      ScreenMode.mobile => 20,
      ScreenMode.tablet => 30,
      ScreenMode.web => 30,
    };

    final animationWidget = Column(
      children: [
        // Graph
        GraphWidget(
          controller: controller,
          animation: curveAnimation,
        ),

        // Box Animations
        SizedBox(
          width: MediaQuery.of(context).size.width /
              (screenMode.isMobileOrTablet ? 1 : 3),
          child: Wrap(
            spacing: spacing / 2,
            runSpacing: spacing / 2,
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
                        animation: curveAnimation,
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
        spacing: spacing,
        children: [
          // Code block
          CodeBlock(curve: selectedCurve),

          // Curve category
          DropdownMenuWidget<String>(
            title: "Category",
            value: selectedCategory,
            items: CurvesEnum.list.keys.toList(),
            onChanged: updateCategory,
          ),

          // Curve type
          DropdownMenuWidget<CurvesEnum>(
            title: "Type",
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
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryFixed,
              borderRadius: BorderRadius.circular(10),
            ),
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
      appBar: HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: playPauseAnimation,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: playPauseController,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: switch (ScreenModeWidget.of(context)) {
            ScreenMode.mobile => Column(
                spacing: spacing,
                children: [
                  animationWidget,
                  controlsWidget,
                  const SizedBox(height: 10),
                ],
              ),
            ScreenMode.tablet => Column(
                spacing: spacing,
                children: [
                  animationWidget,
                  controlsWidget,
                  const SizedBox(height: 20),
                ],
              ),
            ScreenMode.web => Row(
                spacing: spacing,
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
