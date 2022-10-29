import 'package:flutter/material.dart';
import 'package:task_music/app/widgets/custom_button.dart';

class TodayTask extends StatefulWidget {
  final String title;
  final String description;
  const TodayTask(
    this.title,
    this.description,
  );

  @override
  State<TodayTask> createState() => _TodayTaskState();
}

class _TodayTaskState extends State<TodayTask> {
  final _colors = [
    Colors.transparent,
    Colors.red,
    Colors.amber,
    Colors.green,
  ];
  int _colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: _colors[_colorIndex],
            spreadRadius: 1,
            blurRadius: 9,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: _query.size.width * 0.9,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    icon: Icons.delete_outline,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          bottom: 20,
                        ),
                        child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, bottom: 5, right: 20),
                      child: Text(widget.description,
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    icon: Icons.close_rounded,
                    function: () => setState(() => _colorIndex = 1),
                    color: _colorIndex == 1 ? Colors.red : Colors.black,
                  ),
                  CustomButton(
                    icon: Icons.play_arrow_outlined,
                    function: () => setState(() => _colorIndex = 2),
                    color: _colorIndex == 2 ? Colors.amber : Colors.black,
                  ),
                  CustomButton(
                    icon: Icons.check,
                    function: () => setState(() => _colorIndex = 3),
                    color: _colorIndex == 3 ? Colors.green : Colors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
