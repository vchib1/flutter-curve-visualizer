import 'package:flutter/material.dart';
import 'package:flutter_curve_visualizer/utils/curves_enum.dart';
import 'package:flutter_curve_visualizer/views/widgets/animation_graph.dart';

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
    selectedCurve = curve;

    animation = CurvedAnimation(
      parent: controller,
      curve: selectedCurve.curve,
    );

    setState(() {});
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Curve Visualizer'),
        actions: [
          DropdownButton(
            value: selectedCurve,
            items: CurvesEnum.values
                .map((curve) => DropdownMenuItem(
                      value: curve,
                      child: Text(curve.name),
                    ))
                .toList(),
            onChanged: (value) => updateCurve(value!),
          ),
        ],
      ),
      body: Column(
        spacing: 50.0,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(8.0),
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  final constrainedOffset =
                      animation.value * (constraints.maxWidth - 100);

                  return Transform.translate(
                    offset: Offset(constrainedOffset, 0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          LayoutBuilder(builder: (context, constraints) {
            return AnimationGraph(
              controller: controller,
              animation: animation,
            );
          }),
        ],
      ),
    );
  }
}
