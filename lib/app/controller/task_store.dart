import 'dart:math';

import 'package:flutter/material.dart';

import '../model/task_model.dart';

class TaskStore extends ChangeNotifier {
  List<TaskModel> taskList = [];

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  Future<List<TaskModel>> getTasks() async {
    return await Future.delayed(const Duration(seconds: 1), () => taskList);
  }

  Future<void> addTask(TaskModel task) async {
    taskList.add(task);
    clearTextFormField();
    notifyListeners();
  }

  TaskModel returnTask() {
    return TaskModel(
      id: Random().nextInt(100).toString(),
      title: controllerTitle.text,
      description: controllerDescription.text,
    );
  }

  void deleteTask(String id) {
    taskList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void clearTextFormField() {
    controllerTitle.clear();
    controllerDescription.clear();
  }
}
