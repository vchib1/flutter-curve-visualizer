import 'package:flutter/material.dart';

enum ScreenMode {
  mobile,
  tablet,
  web;

  bool get isMobile => this == ScreenMode.mobile;

  bool get isTablet => this == ScreenMode.tablet;

  bool get isWeb => this == ScreenMode.web;

  bool get isMobileOrTablet =>
      this == ScreenMode.mobile || this == ScreenMode.tablet;}

class ScreenModeWidget extends InheritedWidget {
  final ScreenMode mode;

  const ScreenModeWidget({super.key, required super.child, required this.mode});

  static ScreenMode of(BuildContext context) {
    final responsiveLayout =
    context.dependOnInheritedWidgetOfExactType<ScreenModeWidget>();

    if (responsiveLayout == null) {
      throw FlutterError('ResponsiveLayout not found in widget tree!');
    }
    return responsiveLayout.mode;
  }

  @override
  bool updateShouldNotify(covariant ScreenModeWidget oldWidget) =>
      mode != oldWidget.mode;
}
