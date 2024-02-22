import 'package:todo_project_task/core/excepation/base_excepation.dart';
import 'package:todo_project_task/feature_todo/domain/repository/todo_reposotory.dart';

final class DeleteTodoUsecase {
  final TodoRepository repository;

  DeleteTodoUsecase({required this.repository});

  Future<void> call({required String id}) async {
    try {
      if (id.trim().isEmpty) {
        throw BaseException("Title should not be empty. Try again");
      }

      await repository.deleteTodo(id);
    } catch (e) {
      throw BaseException('Cannot Delete Todo');
    }
  }
}
