import 'package:flutter/material.dart';

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
    return Container(
      margin: EdgeInsets.only(top: sizeHeight / 1.8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
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
                IconButton(
                  iconSize: 30,
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_box,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          Card(
            color: Colors.amber,
            child: Column(
              children: [
                Text('data'),
                Container(
                  height: sizeHeight / 4.5,
                  width: sizeWidth / 1.1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
