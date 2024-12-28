import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/screen_mode.dart';
import 'package:flutter_curve_visualizer/utils/curves_enum.dart';
import 'package:flutter_curve_visualizer/utils/extension/string.dart';
import 'package:flutter_curve_visualizer/views/widgets/animation_graph.dart';

import 'widgets/code_block.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;

  late CurvedAnimation animation;

  late CurvesEnum selectedCurve;

  late int animationTimeInSeconds;

  bool showCurveOutline = false;

  @override
  void initState() {
    super.initState();

    selectedCurve = CurvesEnum.values.first;

    animationTimeInSeconds = 2;

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationTimeInSeconds),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: selectedCurve.curve,
    );

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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

  void updateAnimationTime(int seconds) {
    animationTimeInSeconds = seconds;
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationTimeInSeconds),
    );
    setState(() {});

    animation = CurvedAnimation(
      parent: controller,
      curve: selectedCurve.curve,
    );
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final mode = ScreenModeWidget.of(context);

    final drawer = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          DropdownButton(
            value: selectedCurve,
            underline: SizedBox.shrink(),
            isExpanded: true,
            items: CurvesEnum.values
                .map((curve) => DropdownMenuItem(
                      value: curve,
                      child: Text(curve.name.capitalizeFirst()),
                    ))
                .toList(),
            onChanged: (value) => updateCurve(value!),
          ),
          SizedBox(
            width: 300,
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: showCurveOutline,
              onChanged: (value) {
                setState(() => showCurveOutline = value);
              },
              title: Text("Enable Curve Outline"),
            ),
          )
        ],
      ),
    );

    final graph = AnimationGraph(
      showCurveOutline: showCurveOutline,
      controller: controller,
      animation: animation,
    );

    final codeBlock = CodeBlock(curve: selectedCurve);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Curve Visualizer'),
        actions: [],
      ),
      drawer: mode.isMobileOrTablet ? Drawer(child: drawer) : null,
      body: mode.isWeb || mode.isTablet
          ? Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (mode.isWeb)
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            DropdownButton(
                              value: selectedCurve,
                              underline: SizedBox.shrink(),
                              isExpanded: true,
                              items: CurvesEnum.values
                                  .map((curve) => DropdownMenuItem(
                                        value: curve,
                                        child:
                                            Text(curve.name.capitalizeFirst()),
                                      ))
                                  .toList(),
                              onChanged: (value) => updateCurve(value!),
                            ),
                            SizedBox(
                              width: 300,
                              child: SwitchListTile(
                                contentPadding: EdgeInsets.zero,
                                value: showCurveOutline,
                                onChanged: (value) {
                                  setState(() => showCurveOutline = value);
                                },
                                title: Text("Enable Curve Outline"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(width: 50),
                  // Graph
                  Expanded(
                    flex: 3,
                    child: Center(child: graph),
                  ),
                  codeBlock,
                  const SizedBox(width: 50),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 50),
                      graph,
                      const SizedBox(height: 50),
                      codeBlock,
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
