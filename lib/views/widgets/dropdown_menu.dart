import 'package:flutter/material.dart';

class DropdownMenuWidget<T> extends StatelessWidget {
  final String title;
  final T? value;
  final List<T> items;
  final Widget Function(BuildContext context, T value, TextStyle? textStyle)?
      childBuilder;
  final void Function(T?)? onChanged;

  const DropdownMenuWidget({
    super.key,
    required this.title,
    required this.items,
    this.childBuilder,
    this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleSmall;

    final childTextStyle = Theme.of(context).textTheme.bodyMedium;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryFixed,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          DropdownButton<T>(
            value: value,
            underline: SizedBox.shrink(),
            isExpanded: true,
            items: items.map(
              (e) {
                return DropdownMenuItem<T>(
                  value: e,
                  child: childBuilder == null
                      ? Text(e.toString(), style: childTextStyle)
                      : childBuilder!(context, e, childTextStyle),
                );
              },
            ).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
