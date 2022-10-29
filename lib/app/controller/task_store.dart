import 'package:mobx/mobx.dart';

// Model
import 'package:task_music/app/model/task_model.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store {
  @observable
  List<TaskModel> taskList = [];

  @observable
  TaskModel taskModel = TaskModel();

  @action
  Future<List<TaskModel>> getTasks() async {
    return await Future.delayed(const Duration(seconds: 1), () => taskList);
  }

  @action
  void setTitlte(String value) => taskModel.title = value;
  @action
  void setDescription(String value) => taskModel.description = value;

  @computed
  String get getTitlte => taskModel.title.toString();
  @computed
  String get getDescription => taskModel.description.toString();
}
