import 'package:flutter/material.dart';

class DropdownMenuWidget<T> extends StatelessWidget {
  final String title;
  final T? value;
  final List<T> items;
  final Widget Function(BuildContext context, T value, TextStyle? textStyle)?
      builder;
  final void Function(T?)? onChanged;

  const DropdownMenuWidget({
    super.key,
    required this.title,
    required this.items,
    this.builder,
    this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleSmall;

    final childTextStyle = Theme.of(context).textTheme.titleMedium;

    return PhysicalModel(
      color: Theme.of(context).colorScheme.onPrimaryFixed,
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 1.0,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            DropdownButton<T>(
              value: value,
              onChanged: onChanged,
              underline: const SizedBox.shrink(),
              isExpanded: true,
              isDense: false,
              items: items.map(
                (item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: builder?.call(context, item, childTextStyle) ??
                        Text(item.toString(), style: childTextStyle),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
