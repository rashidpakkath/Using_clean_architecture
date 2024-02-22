import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
class TodoModel with _$TodoModel {
  const TodoModel._();

  const factory TodoModel({
    required String title,
    required bool isChecked,
  }) = _TodoModel;

  factory TodoModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TodoModel(
      title: data?['title'],
      isChecked: data?['ischecked'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "ischecked": isChecked,
    };
  }
}
