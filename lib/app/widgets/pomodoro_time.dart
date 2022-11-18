import 'package:flutter/material.dart';

// Controller
import 'package:task_music/app/controller/pomodoro_store.dart';

// Enum
import 'package:task_music/app/utils/enum/range_type.dart';

// Widget
import 'package:task_music/app/widgets/input_time.dart';

class PomodoroTime extends StatelessWidget {
  const PomodoroTime({
    Key? key,
    required PomodoroStore store,
    required this.sizeWidth,
  })  : _store = store,
        super(key: key);

  final PomodoroStore _store;
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 350,
      left: 20,
      child: Row(
        children: [
          InputTime(
            value: _store.workTime,
            title: "Trabalho",
            dec: _store.initiated && _store.rangeType == RangeType.job
                ? null
                : _store.decreaseWorkingTime,
            inc: _store.initiated && _store.rangeType == RangeType.job
                ? null
                : _store.increaseWorkingTime,
          ),
          SizedBox(
            width: sizeWidth / 6,
          ),
          InputTime(
            value: _store.restTime,
            title: "Descanso",
            dec: _store.initiated && _store.rangeType == RangeType.rest
                ? null
                : _store.decreaseRestTime,
            inc: _store.initiated && _store.rangeType == RangeType.rest
                ? null
                : _store.increaseRestTime,
          ),
        ],
      ),
    );
  }
}
