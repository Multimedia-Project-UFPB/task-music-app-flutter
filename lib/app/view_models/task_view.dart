import 'package:flutter/material.dart';

// View Model
import 'package:task_music/app/view_models/task_list_view.dart';

// Widget
import 'package:task_music/app/widgets/custom_button.dart';
import 'package:task_music/app/widgets/new_task_dialog.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    Key? key,
    required this.sizeHeight,
    required this.sizeWidth,
  }) : super(key: key);

  final double sizeHeight;
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    _handleDialog() {
      showDialog<void>(
        context: context,
        // isScrollControlled: true,
        builder: (_) => Builder(
          builder: (context) {
            return const Dialog(
              child: NewTaskDialog(),
            );
          },
        ),
      );
    }

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: sizeHeight / 1.8),
          height: sizeHeight,
          padding: MediaQuery.of(context).viewInsets,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tarefas',
                      style: TextStyle(fontSize: 18),
                    ),
                    CustomButton(
                      function: _handleDialog,
                      icon: Icons.add_box,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const TaskListView()
      ],
    );
  }
}
