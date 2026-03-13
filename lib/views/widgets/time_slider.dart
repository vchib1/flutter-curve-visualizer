import 'package:flutter/material.dart';

class TimeSlider extends StatelessWidget {
  const TimeSlider({super.key, required this.animationTime, this.onChanged});

  final int animationTime;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);

    return ListTile(
      title: Text(
        "Time: ${animationTime}s",
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Slider(
        value: animationTime.toDouble(),
        min: 1.0,
        max: 10.0,
        inactiveColor: Theme.of(context).colorScheme.surfaceDim,
        onChanged: onChanged,
        divisions: 9,
      ),
    );
  }
}
