import 'dart:async';

import 'package:mobx/mobx.dart';

// Enum
import 'package:task_music/app/utils/enum/range_type.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStoreBase with _$PomodoroStore;

abstract class _PomodoroStoreBase with Store {
  @observable
  bool initiated = false;
  @observable
  bool pause = false;

  @observable
  int minutes = 1;
  @observable
  int seconds = 0;

  @observable
  int workTime = 2;
  @observable
  int restTime = 2;

  @observable
  RangeType rangeType = RangeType.job;

  Timer? stopwatch;

  @action
  void start() {
    initiated = true;
    stopwatch = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        if (minutes == 0 && seconds == 0) {
          _rangeTypeChange();
        } else if (seconds == 0) {
          seconds = 59;
          minutes--;
        } else {
          seconds--;
        }
      },
    );
  }

  @action
  void stop() {
    initiated = false;
    pause = true;
    stopwatch?.cancel();
  }

  @action
  void restart() {
    initiated = false;
    pause = false;
    minutes = rangeType == RangeType.job ? workTime : restTime;
    seconds = 0;
    stopwatch?.cancel();
  }

  @action
  void increaseWorkingTime() {
    workTime++;
    if (rangeType == RangeType.job) {
      restart();
    }
  }

  @action
  void decreaseWorkingTime() {
    if (workTime > 1) {
      workTime--;
    }

    if (rangeType == RangeType.job) {
      restart();
    }
  }

  @action
  void increaseRestTime() {
    restTime++;
    if (rangeType == RangeType.rest) {
      restart();
    }
  }

  @action
  void decreaseRestTime() {
    if (restTime > 1) {
      restTime--;
    }
    if (rangeType == RangeType.rest) {
      restart();
    }
  }

  void _rangeTypeChange() {
    if (rangeType == RangeType.job) {
      rangeType = RangeType.rest;
      minutes = restTime;
    } else {
      rangeType = RangeType.job;
      minutes = workTime;
    }
    seconds = 0;
  }
}
