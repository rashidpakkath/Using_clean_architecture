import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_project_task/core/theme/app_theme.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final apptheme = AppTheme.of(context);
    return SizedBox(
      height: apptheme.spaces.space_500 * 11.9,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(apptheme.spaces.space_100),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: apptheme.spaces.space_150,
              ),
              child: Container(
                width: apptheme.spaces.space_500 * 5,
                height: apptheme.spaces.space_400 * 2,
                decoration: BoxDecoration(
                  color: apptheme.colors.textInverse,
                  borderRadius: BorderRadius.circular(
                    apptheme.spaces.space_300,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: apptheme.spaces.space_200),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: apptheme.spaces.space_250,
                      ),
                      SizedBox(
                        width: apptheme.spaces.space_150,
                      ),
                      SizedBox(
                        width: apptheme.spaces.space_500 * 4.7,
                        child: Text(
                          "data",
                          style: apptheme.typography.h600!
                              .copyWith(color: apptheme.colors.secondary),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
