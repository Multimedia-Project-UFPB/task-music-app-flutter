import 'package:flutter/material.dart';
import 'package:task_music/app/utils/filters/background_filter_home.dart';
import 'package:task_music/app/view_models/custom_app_bar.dart';

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
          _Pomodoro(sizeHeight: sizeHeight, sizeWidth: sizeWidth, time: time),
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
    required this.time,
  }) : super(key: key);

  final double sizeHeight;
  final double sizeWidth;
  final bool time;

  @override
  State<_Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<_Pomodoro> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(120),
            boxShadow: [
              BoxShadow(
                color: Colors.green.shade900.withOpacity(0.9),
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
                  '25:00',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                ),
              ),
              Positioned(
                height: 30,
                top: 150.0,
                left: 50,
                child: widget.time
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Iniciar"),
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
                              onPressed: () {},
                              child: const Text("Pausar"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
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
    );
  }
}
