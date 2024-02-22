import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_project_task/feature_todo/data/model/todo_model.dart';

abstract class TodoFirestoreDataSource {
  Future<void> addtodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo, String id);
  Future<void> deleteTodo(String id);
  Stream<QuerySnapshot<TodoModel>> getTodo();
}
