import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project_task/core/constants/constants.dart';
import 'package:todo_project_task/core/theme/app_theme.dart';
import 'package:todo_project_task/core/utils/error_snakbar_utile.dart';
import 'package:todo_project_task/feature_todo/domain/entity/todo_entity.dart';
import 'package:todo_project_task/feature_todo/presentation/provider/todo_provider.dart';

class BottomsheetWidget extends ConsumerWidget {
  final TodoEntity? todo;

  const BottomsheetWidget({
    super.key,
    this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(appConstantsProvider);
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final style = AppTheme.of(context).typography;

    void cancelAction() {
      Navigator.pop(context);
    }

    Future<String?> createOrUpdateTodo() async {
      Navigator.pop(context);
      if (todo != null) {
        return ref
            .read(todoStateProvider.notifier)
            .updateTodo(id: todo!.id, isChecked: todo!.isChecked);
      } else {
        return await ref.read(todoStateProvider.notifier).addTodo();
      }
    }

    if (todo != null) {
      ref.watch(todoStateProvider.notifier).titleController.text = todo!.title;
    }

    return Material(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: space.space_300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller:
                    ref.watch(todoStateProvider.notifier).titleController,
                autofocus: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(space.space_150),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(space.space_150),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(space.space_300))),
                    onPressed: cancelAction,
                    child: Text(
                      constants.txtCancel,
                      style: style.h400!.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(space.space_300),
                        ),
                        backgroundColor: colors.primary),
                    onPressed: () => createOrUpdateTodo().then(
                      (error) => ErrorSnackbarUtil.showError(context, error),
                    ),
                    child: Text(
                      todo != null ? constants.txtUpdate : constants.txtCreate,
                      style: style.h400!.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
