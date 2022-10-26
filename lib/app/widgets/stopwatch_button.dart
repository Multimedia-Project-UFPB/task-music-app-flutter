import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Controller
import 'package:task_music/app/controller/pomodoro_store.dart';

// Enum
import 'package:task_music/app/utils/enum/range_type.dart';

class StopWatchButton extends StatelessWidget {
  final String text;
  final void Function() function;
  const StopWatchButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<PomodoroStore>(context);
    return ElevatedButton(
      onPressed: function,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: _store.rangeType == RangeType.job
            ? Theme.of(context).colorScheme.primary
            : Colors.green.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
