import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff695f12),
      surfaceTint: Color(0xff695f12),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff2e48a),
      onPrimaryContainer: Color(0xff201c00),
      secondary: Color(0xff715c0d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffde186),
      onSecondaryContainer: Color(0xff231b00),
      tertiary: Color(0xff416652),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc2ecd2),
      onTertiaryContainer: Color(0xff002113),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff9eb),
      onSurface: Color(0xff1d1c13),
      onSurfaceVariant: Color(0xff4a4739),
      outline: Color(0xff7b7768),
      outlineVariant: Color(0xffccc6b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323027),
      inversePrimary: Color(0xffd5c871),
      primaryFixed: Color(0xfff2e48a),
      onPrimaryFixed: Color(0xff201c00),
      primaryFixedDim: Color(0xffd5c871),
      onPrimaryFixedVariant: Color(0xff504700),
      secondaryFixed: Color(0xfffde186),
      onSecondaryFixed: Color(0xff231b00),
      secondaryFixedDim: Color(0xffe0c56d),
      onSecondaryFixedVariant: Color(0xff564500),
      tertiaryFixed: Color(0xffc2ecd2),
      onTertiaryFixed: Color(0xff002113),
      tertiaryFixedDim: Color(0xffa7d0b7),
      onTertiaryFixedVariant: Color(0xff294e3b),
      surfaceDim: Color(0xffdfdacc),
      surfaceBright: Color(0xfffff9eb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3e5),
      surfaceContainer: Color(0xfff3ede0),
      surfaceContainerHigh: Color(0xffede8da),
      surfaceContainerHighest: Color(0xffe7e2d5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4b4300),
      surfaceTint: Color(0xff695f12),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff807628),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff514100),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff897324),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff254a37),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff577d67),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff9eb),
      onSurface: Color(0xff1d1c13),
      onSurfaceVariant: Color(0xff464336),
      outline: Color(0xff625f51),
      outlineVariant: Color(0xff7f7b6b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323027),
      inversePrimary: Color(0xffd5c871),
      primaryFixed: Color(0xff807628),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff665d0f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff897324),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6e5a0a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff577d67),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3e644f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdfdacc),
      surfaceBright: Color(0xfffff9eb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3e5),
      surfaceContainer: Color(0xfff3ede0),
      surfaceContainerHigh: Color(0xffede8da),
      surfaceContainerHighest: Color(0xffe7e2d5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff272300),
      surfaceTint: Color(0xff695f12),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4b4300),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2b2100),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff514100),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002818),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff254a37),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff9eb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff262418),
      outline: Color(0xff464336),
      outlineVariant: Color(0xff464336),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323027),
      inversePrimary: Color(0xfffcee92),
      primaryFixed: Color(0xff4b4300),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff332d00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff514100),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff372c00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff254a37),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff0c3322),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdfdacc),
      surfaceBright: Color(0xfffff9eb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3e5),
      surfaceContainer: Color(0xfff3ede0),
      surfaceContainerHigh: Color(0xffede8da),
      surfaceContainerHighest: Color(0xffe7e2d5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd5c871),
      surfaceTint: Color(0xffd5c871),
      onPrimary: Color(0xff373100),
      primaryContainer: Color(0xff504700),
      onPrimaryContainer: Color(0xfff2e48a),
      secondary: Color(0xffe0c56d),
      onSecondary: Color(0xff3b2f00),
      secondaryContainer: Color(0xff564500),
      onSecondaryContainer: Color(0xfffde186),
      tertiary: Color(0xffa7d0b7),
      onTertiary: Color(0xff113725),
      tertiaryContainer: Color(0xff294e3b),
      onTertiaryContainer: Color(0xffc2ecd2),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff15130c),
      onSurface: Color(0xffe7e2d5),
      onSurfaceVariant: Color(0xffccc6b5),
      outline: Color(0xff959181),
      outlineVariant: Color(0xff4a4739),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e2d5),
      inversePrimary: Color(0xff695f12),
      primaryFixed: Color(0xfff2e48a),
      onPrimaryFixed: Color(0xff201c00),
      primaryFixedDim: Color(0xffd5c871),
      onPrimaryFixedVariant: Color(0xff504700),
      secondaryFixed: Color(0xfffde186),
      onSecondaryFixed: Color(0xff231b00),
      secondaryFixedDim: Color(0xffe0c56d),
      onSecondaryFixedVariant: Color(0xff564500),
      tertiaryFixed: Color(0xffc2ecd2),
      onTertiaryFixed: Color(0xff002113),
      tertiaryFixedDim: Color(0xffa7d0b7),
      onTertiaryFixedVariant: Color(0xff294e3b),
      surfaceDim: Color(0xff15130c),
      surfaceBright: Color(0xff3b3930),
      surfaceContainerLowest: Color(0xff100e07),
      surfaceContainerLow: Color(0xff1d1c13),
      surfaceContainer: Color(0xff212017),
      surfaceContainerHigh: Color(0xff2c2a21),
      surfaceContainerHighest: Color(0xff37352c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdacc75),
      surfaceTint: Color(0xffd5c871),
      onPrimary: Color(0xff1a1600),
      primaryContainer: Color(0xff9d9241),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe4c971),
      onSecondary: Color(0xff1d1600),
      secondaryContainer: Color(0xffa78f3e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffabd4bb),
      onTertiary: Color(0xff001b0e),
      tertiaryContainer: Color(0xff729982),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff15130c),
      onSurface: Color(0xfffffaf3),
      onSurfaceVariant: Color(0xffd0cbb9),
      outline: Color(0xffa7a392),
      outlineVariant: Color(0xff878373),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e2d5),
      inversePrimary: Color(0xff514900),
      primaryFixed: Color(0xfff2e48a),
      onPrimaryFixed: Color(0xff141100),
      primaryFixedDim: Color(0xffd5c871),
      onPrimaryFixedVariant: Color(0xff3d3700),
      secondaryFixed: Color(0xfffde186),
      onSecondaryFixed: Color(0xff171000),
      secondaryFixedDim: Color(0xffe0c56d),
      onSecondaryFixedVariant: Color(0xff423500),
      tertiaryFixed: Color(0xffc2ecd2),
      onTertiaryFixed: Color(0xff00150a),
      tertiaryFixedDim: Color(0xffa7d0b7),
      onTertiaryFixedVariant: Color(0xff173d2b),
      surfaceDim: Color(0xff15130c),
      surfaceBright: Color(0xff3b3930),
      surfaceContainerLowest: Color(0xff100e07),
      surfaceContainerLow: Color(0xff1d1c13),
      surfaceContainer: Color(0xff212017),
      surfaceContainerHigh: Color(0xff2c2a21),
      surfaceContainerHighest: Color(0xff37352c),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf3),
      surfaceTint: Color(0xffd5c871),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffdacc75),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe4c971),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffeefff2),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffabd4bb),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff15130c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffffaf3),
      outline: Color(0xffd0cbb9),
      outlineVariant: Color(0xffd0cbb9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e2d5),
      inversePrimary: Color(0xff302a00),
      primaryFixed: Color(0xfff7e98e),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffdacc75),
      onPrimaryFixedVariant: Color(0xff1a1600),
      secondaryFixed: Color(0xffffe596),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe4c971),
      onSecondaryFixedVariant: Color(0xff1d1600),
      tertiaryFixed: Color(0xffc7f1d6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffabd4bb),
      onTertiaryFixedVariant: Color(0xff001b0e),
      surfaceDim: Color(0xff15130c),
      surfaceBright: Color(0xff3b3930),
      surfaceContainerLowest: Color(0xff100e07),
      surfaceContainerLow: Color(0xff1d1c13),
      surfaceContainer: Color(0xff212017),
      surfaceContainerHigh: Color(0xff2c2a21),
      surfaceContainerHighest: Color(0xff37352c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        snackBarTheme: SnackBarThemeData(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
        ),
        textTheme: textTheme.apply(
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
