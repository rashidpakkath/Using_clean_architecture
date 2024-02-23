import 'package:flutter/material.dart';
import 'package:todo_project_task/core/theme/app_theme.dart';
import 'package:intl/intl.dart';

class PageTopWidget extends StatelessWidget {
  const PageTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE \nd/M/y ').format(now);
    final apptheme = AppTheme.of(context);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: apptheme.spaces.space_500 * 5.5,
      decoration: BoxDecoration(
        color: apptheme.colors.primary,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            apptheme.colors.textInverse,
            apptheme.colors.primary,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(apptheme.spaces.space_600),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: apptheme.spaces.space_400,
          bottom: apptheme.spaces.space_200,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: apptheme.typography.h600!.copyWith(
                color: apptheme.colors.secondary,
                fontSize: apptheme.spaces.space_400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
