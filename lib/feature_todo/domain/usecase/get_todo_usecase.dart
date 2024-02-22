import 'package:todo_project_task/core/excepation/base_excepation.dart';
import 'package:todo_project_task/feature_todo/domain/entity/todo_entity.dart';
import 'package:todo_project_task/feature_todo/domain/repository/todo_reposotory.dart';

final class GetTodoUsecase {
  final TodoRepository repository;
  GetTodoUsecase({required this.repository});

  Stream<List<TodoEntity>> call() async* {
    try {
      final todoStream = repository.getTodo();
      await for (final todos in todoStream) {
        for (final todo in todos) {
          if (todo.title.trim().isEmpty) {
            throw BaseException('Title should not be empty. Try again');
          }
        }
        yield todos;
      }
    } catch (e) {
      throw BaseException('Cannot Get Todo');
    }
  }
}
