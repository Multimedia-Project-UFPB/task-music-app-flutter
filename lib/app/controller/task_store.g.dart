// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStoreBase, Store {
  late final _$taskListAtom =
      Atom(name: '_TaskStoreBase.taskList', context: context);

  @override
  List<TaskModel> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(List<TaskModel> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$taskModelAtom =
      Atom(name: '_TaskStoreBase.taskModel', context: context);

  @override
  TaskModel get taskModel {
    _$taskModelAtom.reportRead();
    return super.taskModel;
  }

  @override
  set taskModel(TaskModel value) {
    _$taskModelAtom.reportWrite(value, super.taskModel, () {
      super.taskModel = value;
    });
  }

  late final _$getTasksAsyncAction =
      AsyncAction('_TaskStoreBase.getTasks', context: context);

  @override
  Future<List<TaskModel>> getTasks() {
    return _$getTasksAsyncAction.run(() => super.getTasks());
  }

  late final _$_TaskStoreBaseActionController =
      ActionController(name: '_TaskStoreBase', context: context);

  @override
  void setTitlte(String value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setTitlte');
    try {
      return super.setTitlte(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskList: ${taskList},
taskModel: ${taskModel}
    ''';
  }
}
