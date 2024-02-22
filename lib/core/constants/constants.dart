import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'constants.g.dart';

class AppConstants {
  final String txtAppbarName = 'TODO APP';
  final String txtEnter = 'Pleace Enter TODOs';
  final String txtTask = 'Tasks';
  final String txtCancel = 'Cancel';
  final String txtUpdate = 'Update';
  final String txtCreate = 'Create';
  final String txtDelete = 'Delete';
  final String txtSure = 'Are you sure ?';
  final String txtMassege = 'This todo will delete permenantly';
}

@riverpod
AppConstants appConstants(AppConstantsRef ref) {
  return AppConstants();
}
