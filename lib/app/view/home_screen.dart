import 'package:flutter/material.dart';

import 'package:task_music/app/utils/filters/background_filter_home.dart';
import 'package:task_music/app/widgets/custom_app_bar.dart';
import 'package:task_music/app/widgets/stopwatch.dart';

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
          Stopwatch(sizeHeight: sizeHeight, sizeWidth: sizeWidth)
        ],
      ),
    );
  }
}
