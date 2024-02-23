import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_project_task/core/theme/color_palette.dart';
import 'package:todo_project_task/core/theme/extention/colors_extention.dart';
import 'package:todo_project_task/core/theme/extention/spaces_extention.dart';
import 'package:todo_project_task/core/theme/extention/typography_extention.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(brightness: Brightness.light, extensions: [
  AppColorExtension(
    primary: AppColorPalette.primary,
    secondary: Colors.white,
    text: Colors.black,
    textInverse: AppColorPalette.secondary,
    textSubtle: AppColorPalette.sub,
    textSubtlest: Colors.white,
    backgroundDanger: AppColorPalette.backGround,
  ),
  AppSpaceExtension.fromBaseSpace(8),
  AppTypographyExtension.fromColors(
    defaultFontColor: AppColorPalette.secondary,
    linkColor: Colors.blue,
    dimFontColor: Colors.black,
  )
]);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
