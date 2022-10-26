// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PomodoroStore on _PomodoroStoreBase, Store {
  late final _$initiatedAtom =
      Atom(name: '_PomodoroStoreBase.initiated', context: context);

  @override
  bool get initiated {
    _$initiatedAtom.reportRead();
    return super.initiated;
  }

  @override
  set initiated(bool value) {
    _$initiatedAtom.reportWrite(value, super.initiated, () {
      super.initiated = value;
    });
  }

  late final _$pauseAtom =
      Atom(name: '_PomodoroStoreBase.pause', context: context);

  @override
  bool get pause {
    _$pauseAtom.reportRead();
    return super.pause;
  }

  @override
  set pause(bool value) {
    _$pauseAtom.reportWrite(value, super.pause, () {
      super.pause = value;
    });
  }

  late final _$minutesAtom =
      Atom(name: '_PomodoroStoreBase.minutes', context: context);

  @override
  int get minutes {
    _$minutesAtom.reportRead();
    return super.minutes;
  }

  @override
  set minutes(int value) {
    _$minutesAtom.reportWrite(value, super.minutes, () {
      super.minutes = value;
    });
  }

  late final _$secondsAtom =
      Atom(name: '_PomodoroStoreBase.seconds', context: context);

  @override
  int get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  late final _$workTimeAtom =
      Atom(name: '_PomodoroStoreBase.workTime', context: context);

  @override
  int get workTime {
    _$workTimeAtom.reportRead();
    return super.workTime;
  }

  @override
  set workTime(int value) {
    _$workTimeAtom.reportWrite(value, super.workTime, () {
      super.workTime = value;
    });
  }

  late final _$restTimeAtom =
      Atom(name: '_PomodoroStoreBase.restTime', context: context);

  @override
  int get restTime {
    _$restTimeAtom.reportRead();
    return super.restTime;
  }

  @override
  set restTime(int value) {
    _$restTimeAtom.reportWrite(value, super.restTime, () {
      super.restTime = value;
    });
  }

  late final _$rangeTypeAtom =
      Atom(name: '_PomodoroStoreBase.rangeType', context: context);

  @override
  RangeType get rangeType {
    _$rangeTypeAtom.reportRead();
    return super.rangeType;
  }

  @override
  set rangeType(RangeType value) {
    _$rangeTypeAtom.reportWrite(value, super.rangeType, () {
      super.rangeType = value;
    });
  }

  late final _$_PomodoroStoreBaseActionController =
      ActionController(name: '_PomodoroStoreBase', context: context);

  @override
  void start() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.start');
    try {
      return super.start();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.stop');
    try {
      return super.stop();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restart() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.restart');
    try {
      return super.restart();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseWorkingTime() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.increaseWorkingTime');
    try {
      return super.increaseWorkingTime();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseWorkingTime() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.decreaseWorkingTime');
    try {
      return super.decreaseWorkingTime();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseRestTime() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.increaseRestTime');
    try {
      return super.increaseRestTime();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseRestTime() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.decreaseRestTime');
    try {
      return super.decreaseRestTime();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initiated: ${initiated},
pause: ${pause},
minutes: ${minutes},
seconds: ${seconds},
workTime: ${workTime},
restTime: ${restTime},
rangeType: ${rangeType}
    ''';
  }
}
