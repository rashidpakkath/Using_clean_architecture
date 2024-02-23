import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project_task/core/constants/constants.dart';
import 'package:todo_project_task/feature_todo/domain/entity/todo_entity.dart';
import 'package:todo_project_task/feature_todo/presentation/provider/todo_provider.dart';

class DeleteWidget extends ConsumerWidget {
  final TodoEntity todo;
  const DeleteWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(appConstantsProvider);
    return AlertDialog(
      title: Text(constants.txtSure),
      content: Text(constants.txtMassege),
      actions: [
        TextButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            child: Text(
              constants.txtCancel,
            )),
        TextButton(
          onPressed: () {
            ref.read(todoStateProvider.notifier).deleteTodo(todo.id);
            Navigator.of(context).pop();
          },
          child: Text(
            constants.txtDelete,
          ),
        )
      ],
    );
  }
}
