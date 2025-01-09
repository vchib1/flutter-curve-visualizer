import 'package:flutter/material.dart';

class TimeSlider extends StatelessWidget {
  const TimeSlider({
    super.key,
    required this.animationTime,
    this.onChanged,
  });

  final int animationTime;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);

    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 1.0,
      borderRadius: borderRadius,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryFixed,
          borderRadius: borderRadius,
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
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
