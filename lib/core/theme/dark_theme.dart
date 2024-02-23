import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_project_task/core/theme/extention/colors_extention.dart';
import 'package:todo_project_task/core/theme/extention/spaces_extention.dart';
import 'package:todo_project_task/core/theme/extention/typography_extention.dart';

part 'dark_theme.g.dart';

final _darkTheme = ThemeData(brightness: Brightness.light, extensions: [
  AppColorExtension(
    primary: Colors.black,
    secondary: Colors.white,
    text: Colors.white,
    textInverse: Colors.black26,
    textSubtle: Colors.black26,
    textSubtlest: Colors.black,
    backgroundDanger: Colors.white30,
  ),
  AppSpaceExtension.fromBaseSpace(8),
  AppTypographyExtension.fromColors(
    defaultFontColor: Colors.white,
    linkColor: Colors.blue,
    dimFontColor: Colors.black,
  )
]);

@riverpod
ThemeData darkTheme(DarkThemeRef ref) {
  return _darkTheme;
}
