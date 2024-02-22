import 'package:flutter/material.dart';
import 'package:todo_project_task/core/theme/app_theme.dart';

class PageTopWidget extends StatelessWidget {
  const PageTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final apptheme = AppTheme.of(context);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: apptheme.spaces.space_500 * 6,
      decoration: BoxDecoration(
        color: apptheme.colors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(apptheme.spaces.space_600),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: apptheme.spaces.space_400,
          bottom: apptheme.spaces.space_300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Monday",
              style: apptheme.typography.h500!.copyWith(
                color: apptheme.colors.secondary,
                fontSize: apptheme.spaces.space_400,
              ),
            ),
            Text(
              "25/03/2024",
              style: apptheme.typography.h900!
                  .copyWith(color: apptheme.colors.secondary),
            )
          ],
        ),
      ),
    );
  }
}
