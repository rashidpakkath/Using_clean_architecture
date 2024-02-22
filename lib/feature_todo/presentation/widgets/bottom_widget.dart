import 'package:flutter/material.dart';
import 'package:todo_project_task/core/theme/app_theme.dart';
import 'package:todo_project_task/feature_todo/presentation/widgets/bootom_sheet_widget.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final apptheme = AppTheme.of(context);
    return Container(
      color: apptheme.colors.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: apptheme.spaces.space_500 * 1.5,
                height: apptheme.spaces.space_500 * 1.5,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(apptheme.spaces.space_400),
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
                    )),
              )),
        ],
      ),
    );
  }
}
