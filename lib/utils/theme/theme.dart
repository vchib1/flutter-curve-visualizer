import "package:flutter/material.dart";
import "package:flutter_curve_visualizer/utils/theme/colors.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff825513),
      surfaceTint: Color(0xff825513),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffddb8),
      onPrimaryContainer: Color(0xff2a1700),
      secondary: Color(0xff196584),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc1e8ff),
      onSecondaryContainer: Color(0xff001e2b),
      tertiary: Color(0xff7d570e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdeae),
      onTertiaryContainer: Color(0xff281800),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff211a13),
      onSurfaceVariant: Color(0xff504539),
      outline: Color(0xff827568),
      outlineVariant: Color(0xffd4c4b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f27),
      inversePrimary: Color(0xfff8bb71),
      primaryFixed: Color(0xffffddb8),
      onPrimaryFixed: Color(0xff2a1700),
      primaryFixedDim: Color(0xfff8bb71),
      onPrimaryFixedVariant: Color(0xff653e00),
      secondaryFixed: Color(0xffc1e8ff),
      onSecondaryFixed: Color(0xff001e2b),
      secondaryFixedDim: Color(0xff8ecff2),
      onSecondaryFixedVariant: Color(0xff004d67),
      tertiaryFixed: Color(0xffffdeae),
      onTertiaryFixed: Color(0xff281800),
      tertiaryFixedDim: Color(0xfff1be6d),
      onTertiaryFixedVariant: Color(0xff604100),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e5),
      surfaceContainer: Color(0xfff9ece0),
      surfaceContainerHigh: Color(0xfff3e6da),
      surfaceContainerHighest: Color(0xffeee0d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff603b00),
      surfaceTint: Color(0xff825513),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9c6b28),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004862),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff377c9c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5b3d00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff966d25),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff211a13),
      onSurfaceVariant: Color(0xff4c4136),
      outline: Color(0xff695d51),
      outlineVariant: Color(0xff86786b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f27),
      inversePrimary: Color(0xfff8bb71),
      primaryFixed: Color(0xff9c6b28),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff7f5210),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff377c9c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff146382),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff966d25),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7b550b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e5),
      surfaceContainer: Color(0xfff9ece0),
      surfaceContainerHigh: Color(0xfff3e6da),
      surfaceContainerHighest: Color(0xffeee0d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff331d00),
      surfaceTint: Color(0xff825513),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff603b00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002635),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004862),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff311f00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5b3d00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2b2218),
      outline: Color(0xff4c4136),
      outlineVariant: Color(0xff4c4136),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f27),
      inversePrimary: Color(0xffffe8d2),
      primaryFixed: Color(0xff603b00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff422700),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004862),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003143),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5b3d00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3e2800),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e5),
      surfaceContainer: Color(0xfff9ece0),
      surfaceContainerHigh: Color(0xfff3e6da),
      surfaceContainerHighest: Color(0xffeee0d4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff8bb71),
      surfaceTint: Color(0xfff8bb71),
      onPrimary: Color(0xff472a00),
      primaryContainer: Color(0xff653e00),
      onPrimaryContainer: Color(0xffffddb8),
      secondary: Color(0xff8ecff2),
      onSecondary: Color(0xff003548),
      secondaryContainer: Color(0xff004d67),
      onSecondaryContainer: Color(0xffc1e8ff),
      tertiary: Color(0xfff1be6d),
      onTertiary: Color(0xff432c00),
      tertiaryContainer: Color(0xff604100),
      onTertiaryContainer: Color(0xffffdeae),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff18120c),
      onSurface: Color(0xffeee0d4),
      onSurfaceVariant: Color(0xffd4c4b5),
      outline: Color(0xff9c8e80),
      outlineVariant: Color(0xff504539),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeee0d4),
      inversePrimary: Color(0xff825513),
      primaryFixed: Color(0xffffddb8),
      onPrimaryFixed: Color(0xff2a1700),
      primaryFixedDim: Color(0xfff8bb71),
      onPrimaryFixedVariant: Color(0xff653e00),
      secondaryFixed: Color(0xffc1e8ff),
      onSecondaryFixed: Color(0xff001e2b),
      secondaryFixedDim: Color(0xff8ecff2),
      onSecondaryFixedVariant: Color(0xff004d67),
      tertiaryFixed: Color(0xffffdeae),
      onTertiaryFixed: Color(0xff281800),
      tertiaryFixedDim: Color(0xfff1be6d),
      onTertiaryFixedVariant: Color(0xff604100),
      surfaceDim: Color(0xff18120c),
      surfaceBright: Color(0xff403830),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff211a13),
      surfaceContainer: Color(0xff251e17),
      surfaceContainerHigh: Color(0xff302921),
      surfaceContainerHighest: Color(0xff3b332b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffcbf74),
      surfaceTint: Color(0xfff8bb71),
      onPrimary: Color(0xff231300),
      primaryContainer: Color(0xffbc8641),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff92d3f6),
      onSecondary: Color(0xff001924),
      secondaryContainer: Color(0xff5698b9),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff6c271),
      onTertiary: Color(0xff211400),
      tertiaryContainer: Color(0xffb6893e),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff18120c),
      onSurface: Color(0xfffffaf7),
      onSurfaceVariant: Color(0xffd8c8b9),
      outline: Color(0xffafa092),
      outlineVariant: Color(0xff8e8173),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeee0d4),
      inversePrimary: Color(0xff673f00),
      primaryFixed: Color(0xffffddb8),
      onPrimaryFixed: Color(0xff1c0e00),
      primaryFixedDim: Color(0xfff8bb71),
      onPrimaryFixedVariant: Color(0xff4f2f00),
      secondaryFixed: Color(0xffc1e8ff),
      onSecondaryFixed: Color(0xff00131d),
      secondaryFixedDim: Color(0xff8ecff2),
      onSecondaryFixedVariant: Color(0xff003b50),
      tertiaryFixed: Color(0xffffdeae),
      onTertiaryFixed: Color(0xff1b0f00),
      tertiaryFixedDim: Color(0xfff1be6d),
      onTertiaryFixedVariant: Color(0xff4b3100),
      surfaceDim: Color(0xff18120c),
      surfaceBright: Color(0xff403830),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff211a13),
      surfaceContainer: Color(0xff251e17),
      surfaceContainerHigh: Color(0xff302921),
      surfaceContainerHighest: Color(0xff3b332b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf7),
      surfaceTint: Color(0xfff8bb71),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfffcbf74),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff7fbff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff92d3f6),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff6c271),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff18120c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffffaf7),
      outline: Color(0xffd8c8b9),
      outlineVariant: Color(0xffd8c8b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeee0d4),
      inversePrimary: Color(0xff3e2400),
      primaryFixed: Color(0xffffe2c4),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfffcbf74),
      onPrimaryFixedVariant: Color(0xff231300),
      secondaryFixed: Color(0xffccebff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff92d3f6),
      onSecondaryFixedVariant: Color(0xff001924),
      tertiaryFixed: Color(0xffffe3bc),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff6c271),
      onTertiaryFixedVariant: Color(0xff211400),
      surfaceDim: Color(0xff18120c),
      surfaceBright: Color(0xff403830),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff211a13),
      surfaceContainer: Color(0xff251e17),
      surfaceContainerHigh: Color(0xff302921),
      surfaceContainerHighest: Color(0xff3b332b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        primaryColor: ThemeColors.primaryColor,
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        snackBarTheme: SnackBarThemeData(showCloseIcon: true),
        textTheme: textTheme.apply(
          fontFamily: "Outfit",
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
