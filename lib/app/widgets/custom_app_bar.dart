import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
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
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: Text(
          'TaskMusic',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
