import 'package:todo_project_task/core/excepation/base_excepation.dart';
import 'package:todo_project_task/feature_todo/domain/entity/todo_entity.dart';
import 'package:todo_project_task/feature_todo/domain/repository/todo_reposotory.dart';

final class UpdateTodoUsecase {
  final TodoRepository repository;

  UpdateTodoUsecase({required this.repository});

  Future<void> call({
    required String title,
    required bool isChecked,
    required String id,
  }) async {
    try {
      if (title.trim().isEmpty) {
        throw BaseException("Title should not be empty. Try again");
      }

      final todo = TodoEntity(
        id: id,
        title: title,
        isChecked: isChecked,
      );
      await repository.updateTodo(todo);
    } catch (e) {
      throw BaseException('Cannot Update Todo');
    }
  }
}
