import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Controller
import 'package:task_music/app/controller/task_store.dart';

// Widget
import 'package:task_music/app/widgets/new_task_dialog.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final void Function() func;

  const CustomAppBar({Key? key, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TaskStore>(context);

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
            color: !store.changeIcon
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
          ),
          onPressed: func,
        ),
        title: Text(
          'TaskMusic',
          style: !store.changeIcon
              ? Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Theme.of(context).colorScheme.primary)
              : Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: !store.changeIcon
                ? IconButton(
                    icon: Icon(
                      Icons.add_task,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: _handleDialog,
                  )
                : Container(
                    width: 80,
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
