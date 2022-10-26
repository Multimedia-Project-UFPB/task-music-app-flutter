import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:task_music/app/utils/enum/range_type.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStoreBase with _$PomodoroStore;

abstract class _PomodoroStoreBase with Store {
  @observable
  bool initiated = false;

  @observable
  int minutes = 2;
  @observable
  int seconds = 0;

  @observable
  int workTime = 5;
  @observable
  int restTime = 5;

  @observable
  RangeType rangeType = RangeType.job;

  Timer? stopwatch;

  @action
  void start() {
    initiated = true;
    stopwatch = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _rangeTypeChange();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    initiated = false;
    stopwatch?.cancel();
  }

  @action
  void restart() {
    stop();
    minutes = rangeType == RangeType.job ? workTime : restTime;
    seconds = 0;
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
    if (rangeType == RangeType.rest) {
      rangeType = RangeType.rest;
      minutes = restTime;
    } else {
      rangeType = RangeType.job;
      minutes = workTime;
    }
    seconds = 0;
  }
}
