import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:task_music/app/controller/pomodoro_store.dart';
import 'package:task_music/app/utils/enum/range_type.dart';
import 'package:task_music/app/utils/filters/background_filter_home.dart';
import 'package:task_music/app/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool time = true;
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: const CustomAppBar(),
      drawer: const Drawer(),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1586473219010-2ffc57b0d282?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGFza3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,
          ),
          const BackgroundFilterHome(),
          _Pomodoro(sizeHeight: sizeHeight, sizeWidth: sizeWidth),
        ],
      ),
    );
  }
}

class _Pomodoro extends StatefulWidget {
  const _Pomodoro({
    Key? key,
    required this.sizeHeight,
    required this.sizeWidth,
  }) : super(key: key);

  final double sizeHeight;
  final double sizeWidth;

  @override
  State<_Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<_Pomodoro> {
  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _store.rangeType == RangeType.job
                ? 'Hora de Trabalhar'
                : 'Hora de Descansar',
            style: const TextStyle(
              fontSize: 40,
              // color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
                          color: Theme.of(context).textTheme.bodyText1!.color,
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
                              : const EdgeInsets.only(left: 8),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: _store.start,
                              child: !_store.initiated && !_store.pause
                                  ? const Text("Iniciar")
                                  : const Text('Continuar'),
                              style: ElevatedButton.styleFrom(
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
                                color: Theme.of(context).colorScheme.primary,
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
