import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// Controller
import 'package:task_music/app/controller/pomodoro_store.dart';

// Enum
import 'package:task_music/app/utils/enum/range_type.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({
    Key? key,
    required this.sizeHeight,
    required this.sizeWidth,
  }) : super(key: key);

  final double sizeHeight;
  final double sizeWidth;

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(120),
              boxShadow: [
                BoxShadow(
                  color: _store.rangeType == RangeType.job
                      ? Theme.of(context).colorScheme.primary
                      : Colors.green.shade900.withOpacity(0.9),
                  spreadRadius: 6,
                  blurRadius: 9,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            margin: const EdgeInsets.only(top: 120),
            height: widget.sizeHeight / 3.5,
            width: widget.sizeWidth / 1.9,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    '${_store.minutes.toString().padLeft(2, '0')}:${_store.seconds.toString().padLeft(2, '0')}',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: _store.rangeType == RangeType.job
                              ? Theme.of(context).textTheme.bodyText1!.color
                              : Colors.green.shade900,
                        ),
                  ),
                ),
                Positioned(
                  height: 30,
                  top: 150.0,
                  left: 50,
                  child: !_store.initiated
                      ? Padding(
                          padding: !_store.initiated && !_store.pause
                              ? const EdgeInsets.only(left: 20.0)
                              : const EdgeInsets.only(left: 6),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: _store.start,
                              child: !_store.initiated && !_store.pause
                                  ? const Text("Iniciar")
                                  : const Text('Continuar'),
                              style: ElevatedButton.styleFrom(
                                primary: _store.rangeType == RangeType.job
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.green.shade900,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: ElevatedButton(
                                onPressed: _store.stop,
                                child: const Text("Pausar"),
                                style: ElevatedButton.styleFrom(
                                  primary: _store.rangeType == RangeType.job
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.green.shade900,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: _store.restart,
                              icon: Icon(
                                Icons.close_rounded,
                                color: _store.rangeType == RangeType.job
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.green.shade900,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
