import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project_task/core/constants/constants.dart';
import 'package:todo_project_task/core/theme/app_theme.dart';
import 'package:todo_project_task/core/theme/dark_theme.dart';
import 'package:todo_project_task/core/theme/theme_provider.dart';
import 'package:todo_project_task/feature_todo/presentation/widgets/bootom_sheet_widget.dart';

class BottomWidget extends ConsumerWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(appConstantsProvider);
    final apptheme = AppTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: apptheme.colors.textInverse,
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: Offset(0, -1))
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            apptheme.spaces.space_600,
          ),
          topRight: Radius.circular(
            apptheme.spaces.space_600,
          ),
        ),
        color: apptheme.colors.textSubtlest,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              ref.read(themeProvider.notifier).lightTheme();
            },
            child: Text(
              constants.txtLight,
              style: TextStyle(color: apptheme.colors.text),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: apptheme.spaces.space_500 * 1.5,
              height: apptheme.spaces.space_500 * 1.5,
              decoration: BoxDecoration(
                border: Border.all(
                  color: apptheme.colors.secondary,
                ),
                borderRadius: BorderRadius.circular(apptheme.spaces.space_400),
                color: apptheme.colors.textSubtle,
              ),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const BottomsheetWidget(),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: apptheme.colors.secondary,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(themeProvider.notifier).darkTheme();
            },
            child: Text(
              constants.txtDark,
              style: TextStyle(color: apptheme.colors.text),
            ),
          ),
        ],
      ),
    );
  }
}
