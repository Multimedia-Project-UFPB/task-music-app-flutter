import 'package:mobx/mobx.dart';

// Model
import 'package:task_music/app/model/task_model.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store {
  ObservableList<TaskModel> taskList = ObservableList<TaskModel>();

  @observable
  TaskModel taskModel = TaskModel();

  Future<List<TaskModel>> getTasks() async {
    return await Future.delayed(const Duration(seconds: 1), () => taskList);
  }
}
