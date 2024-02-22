import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_project_task/feature_todo/data/data_source/todo_firestore_datasource.dart';
import 'package:todo_project_task/feature_todo/data/data_source/todo_firestore_datasource_impl.dart';
import 'package:todo_project_task/feature_todo/data/model/todo_model.dart';
import 'package:todo_project_task/feature_todo/domain/entity/todo_entity.dart';
import 'package:todo_project_task/feature_todo/domain/repository/todo_reposotory.dart';

part 'todo_repository_impl.g.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoFirestoreDataSource dataSource;

  TodoRepositoryImpl({
    required this.dataSource,
  });

  ///add todo
  @override
  Future<void> addtodo(TodoEntity todo) async {
    final addTodo = TodoModel(
      title: todo.title,
      isChecked: todo.isChecked,
    );
    await dataSource.addtodo(addTodo);
  }

  ///delete todo
  @override
  Future<void> deleteTodo(String id) async {
    await dataSource.deleteTodo(id);
  }

  ///get todo
  @override
  Stream<List<TodoEntity>> getTodo() async* {
    final dataStream = dataSource.getTodo();
    await for (final snapshot in dataStream) {
      final modelsList = snapshot.docs;
      yield [
        for (final model in modelsList)
          TodoEntity(
              id: model.id,
              title: model.data().title,
              isChecked: model.data().isChecked)
      ];
    }
  }

  ///update todo
  @override
  Future<void> updateTodo(TodoEntity todo) async {
    await dataSource.updateTodo(
      TodoModel(title: todo.title, isChecked: todo.isChecked),
      todo.id,
    );
  }
}

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepositoryImpl(
    dataSource: ref.watch(todoFirestoreDataSourceProvider),
  );
}
