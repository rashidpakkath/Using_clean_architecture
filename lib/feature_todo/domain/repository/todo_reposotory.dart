import 'package:todo_project_task/feature_todo/domain/entity/todo_entity.dart';

abstract class TodoRepository {
  Future<void> addtodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo);
  Future<void> deleteTodo(String id);
  Stream<List<TodoEntity>> getTodo();
}
