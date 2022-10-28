// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStoreBase, Store {
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

  @override
  String toString() {
    return '''
taskModel: ${taskModel}
    ''';
  }
}
