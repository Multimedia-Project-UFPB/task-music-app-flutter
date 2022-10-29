import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Controller
import 'package:task_music/app/controller/task_store.dart';

// Modell
import 'package:task_music/app/model/task_model.dart';

// View Model
import 'package:task_music/app/view_models/custom_futere_builder.dart';

// Widget
import 'package:task_music/app/widgets/today_task.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<TaskStore>(context);
    final _sizeHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: _sizeHeight / 1.5),
      child: CustomFutureBuilder<List<TaskModel>>(
        future: _store.getTasks(),
        onEmpty: (context) => const SizedBox(),
        onError: (context, error) => Center(
          child: Text(error.message),
        ),
        onLoading: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onComplete: (context) => _store.taskList.isEmpty
            ? const Center(child: Text('Não há tarefas cadastradas!'))
            : ListView.builder(
                padding: const EdgeInsets.only(bottom: 100),
                shrinkWrap: true,
                itemCount: _store.taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  var _task = _store.taskList[index];
                  return TodayTask(
                    _task.title.toString(),
                    _task.description.toString(),
                  );
                },
              ),
      ),
    );
  }
}
