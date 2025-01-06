import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_curve_visualizer/model/curve_model.dart';
import 'package:flutter_curve_visualizer/views/widgets/animated_box/animated_box_widget.dart';
import 'package:flutter_curve_visualizer/views/widgets/screen_mode.dart';
import 'package:flutter_curve_visualizer/utils/curves_enum.dart';
import 'package:flutter_curve_visualizer/views/widgets/appbar.dart';
import 'package:flutter_curve_visualizer/views/widgets/dropdown_menu.dart';
import 'package:flutter_curve_visualizer/views/widgets/graph/graph_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/animated_box/animated_boxes.dart';
import 'widgets/animated_box/provider.dart';
import 'widgets/code_block.dart';
import 'widgets/cubic_curve_input_widget.dart';

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
  late CurveModel selectedCurve;

  late List<TextEditingController> customCubicControllers;

  late int animationTime;

  @override
  void initState() {
    super.initState();

    customCubicControllers = List.generate(4, (index) {
      final value = switch (index) {
        0 => "0.5",
        1 => "0",
        2 => "0.75",
        3 => "1",
        int() => throw UnimplementedError(),
      };

      return TextEditingController(text: value);
    });

    selectedCategory = CurveModel.list.keys.first;
    selectedCurve = CurveModel.list.values.first.first;

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
    for (final controller in customCubicControllers) {
      controller.dispose();
    }

    playPauseController.dispose();
    controller.dispose();
    super.dispose();
  }

  void updateCategory(String? category) {
    if (category == null) return;

    setState(() {
      selectedCategory = category;
      selectedCurve = CurveModel.list[category]!.first;
      curveAnimation = CurvedAnimation(
        parent: controller,
        curve: selectedCurve.curve,
      );
    });
  }

  void updateCurve(CurveModel curve) {
    if (curve == selectedCurve) return;

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
      playPauseController.reverse();
    } else {
      if (controller.isForwardOrCompleted) {
        controller.repeat(reverse: true);
      } else {
        controller.reverse().then((value) => controller.repeat(reverse: true));
      }
      playPauseController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenMode = ScreenModeWidget.of(context);

    final double spacing = screenMode.spacing;

    final animationWidget = Column(
      spacing: spacing,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Graph
        GraphWidget(
          controller: controller,
          animation: curveAnimation,
        ),

        // Box Animations
        Consumer<AnimatedBoxesProvider>(
          builder: (context, value, child) {
            final list = value.animationBoxReordableList;

            return AnimationBoxes(
              curveAnimation: curveAnimation,
              animationTypes: list,
              onAcceptWithDetails: (details, item) {
                final oldIndex = list.indexOf(details.data);
                final newIndex = list.indexOf(item);

                if (oldIndex != -1 && newIndex != -1) {
                  list.removeAt(oldIndex);
                  list.insert(newIndex, details.data);
                  value.saveList(list);
                }
              },
            );
          },
        ),
        SizedBox(height: spacing * 2),
      ],
    );

    final controlsWidget = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: spacing,
        children: [
          // Code block
          CodeBlock(code: selectedCurve.code),

          // Curve selector
          Row(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Curve category
              Flexible(
                child: DropdownMenuWidget<String>(
                  title: "Category",
                  value: selectedCategory,
                  items: CurvesEnum.list.keys.toList(),
                  onChanged: updateCategory,
                ),
              ),

              // Curve type
              Flexible(
                flex: 2,
                child: DropdownMenuWidget<CurveModel>(
                  title: "Type",
                  value: selectedCurve,
                  items: CurveModel.list[selectedCategory]!.toList(),
                  onChanged: (value) => updateCurve(value!),
                  childBuilder: (context, value, textStyle) {
                    return Text(value.name.toString(), style: textStyle);
                  },
                ),
              ),
            ],
          ),

          // Animation time
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

          // TODO : TextField have some issues with current flutter version, waiting it to be fixed
          Visibility(
            visible: false,
            child: AnimatedSize(
              curve: Curves.fastOutSlowIn,
              duration: 200.ms,
              reverseDuration: 200.ms,
              child: (selectedCurve.isCustom)
                  ? CubicCurveInputWidget(
                      controllers: customCubicControllers,
                      onApply: (curve) {
                        updateCurve(selectedCurve.copyWith(curve: curve));
                      },
                    )
                  : const SizedBox.shrink(),
            ),
          )
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
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        child: SingleChildScrollView(
          child: switch (ScreenModeWidget.of(context)) {
            ScreenMode.mobile => Column(
                spacing: spacing,
                children: [
                  animationWidget,
                  controlsWidget,
                  SizedBox(height: spacing),
                ],
              ),
            ScreenMode.tablet => Column(
                spacing: spacing,
                children: [
                  animationWidget,
                  controlsWidget,
                  SizedBox(height: spacing),
                ],
              ),
            ScreenMode.web => Row(
                spacing: spacing,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: animationWidget,
                  ),
                  Flexible(
                    flex: 1,
                    child: controlsWidget,
                  ),
                  SizedBox(width: spacing * 3),
                ],
              ),
          },
        ),
      ),
    );
  }
}
