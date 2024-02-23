import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_project_task/core/theme/dark_theme.dart';
import 'package:todo_project_task/core/theme/light_theme.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeData build() {
    return ref.watch(lightThemeProvider);
  }

  void darkTheme() {
    state = ref.watch(darkThemeProvider);
  }

  void lightTheme() {
    state = ref.watch(lightThemeProvider);
  }
}
