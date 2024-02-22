import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project_task/core/theme/app_theme.dart';
import 'package:todo_project_task/core/utils/error_snakbar_utile.dart';
import 'package:todo_project_task/feature_todo/domain/entity/todo_entity.dart';
import 'package:todo_project_task/feature_todo/presentation/provider/todo_provider.dart';
import 'package:todo_project_task/feature_todo/presentation/widgets/bootom_sheet_widget.dart';
import 'package:todo_project_task/feature_todo/presentation/widgets/delete_widget.dart';

class ListViewWidget extends ConsumerWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);

    return switch (ref.watch(todoProvider)) {
      AsyncData(:final value) => SizedBox(
          height: apptheme.spaces.space_500 * 11.9,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(apptheme.spaces.space_100),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: apptheme.spaces.space_150,
                  ),
                  child: Container(
                    width: apptheme.spaces.space_500 * 5,
                    height: apptheme.spaces.space_400 * 2.1,
                    decoration: BoxDecoration(
                      color: apptheme.colors.textInverse,
                      borderRadius: BorderRadius.circular(
                        apptheme.spaces.space_100,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: apptheme.spaces.space_100),
                      child: Row(
                        children: [
                          Checkbox(
                            value: value[index].isChecked,
                            onChanged: (values) => ref
                                .read(todoStateProvider.notifier)
                                .checkTodo(value[index].id, values ?? false,
                                    value[index].title)
                                .then(
                                  (error) => ErrorSnackbarUtil.showError(
                                      context, error),
                                ),
                          ),
                          SizedBox(
                            width: apptheme.spaces.space_150,
                          ),
                          SizedBox(
                            width: apptheme.spaces.space_500 * 4.7,
                            child: Text(
                              value[index].title,
                              style: apptheme.typography.h600!
                                  .copyWith(color: apptheme.colors.secondary),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => BottomsheetWidget(
                                            todo: value[index],
                                          ));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: apptheme.colors.text,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) => DeleteWidget(
                                            todo: value[index],
                                          )));
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: apptheme.colors.secondary,
                                ),
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
        ),
      AsyncError() => Center(
          child: Text("data"),
        ),
      _ => Center(
          child: CircularProgressIndicator(),
        ),
    };
  }
}
