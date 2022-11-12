import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

// Controller
import 'package:task_music/app/controller/pomodoro_store.dart';

// Enum
import 'package:task_music/app/utils/enum/range_type.dart';

// Filter
import 'package:task_music/app/utils/filters/background_filter_home.dart';

// Widget
import 'package:task_music/app/widgets/custom_app_bar.dart';
import 'package:task_music/app/widgets/input_time.dart';
import 'package:task_music/app/widgets/stopwatch.dart';

// View Model
import 'package:task_music/app/view_models/task_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<PomodoroStore>(context);
    bool time = true;
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Observer(
      builder: (_) => Scaffold(
        appBar: CustomAppBar(
          func: () => ZoomDrawer.of(context)!.toggle(),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1586473219010-2ffc57b0d282?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGFza3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              fit: BoxFit.cover,
            ),
            const BackgroundFilterHome(),
            Stopwatch(sizeHeight: sizeHeight, sizeWidth: sizeWidth),
            Positioned(
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
            ),
            TaskView(sizeHeight: sizeHeight, sizeWidth: sizeWidth),
          ],
        ),
      ),
    );
  }
}
