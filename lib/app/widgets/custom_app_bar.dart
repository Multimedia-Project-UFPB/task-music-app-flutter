import 'package:flutter/material.dart';

// Widget
import 'package:task_music/app/widgets/new_task_dialog.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final void Function() func;

  const CustomAppBar({Key? key, required this.func}) : super(key: key);

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

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.grid_view_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: func,
        ),
        title: Text(
          'TaskMusic',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.add_task,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: _handleDialog,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
