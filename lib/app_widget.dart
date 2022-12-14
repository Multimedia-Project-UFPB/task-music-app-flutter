import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Controller
import 'package:task_music/app/controller/pomodoro_store.dart';
import 'package:task_music/app/controller/task_store.dart';

// View
import 'package:task_music/app/view/home_drawer_menu.dart';
import 'package:task_music/app/view/song.screen.dart';
import 'package:task_music/app/view/splash_screen.dart';
import 'package:task_music/app/view/welcome_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(create: (_) => PomodoroStore()),
        ChangeNotifierProvider<TaskStore>(create: (_) => TaskStore())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Music',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: const Color(0xffd1192f),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Righteous',
                bodyColor: const Color(0xffd1192f),
              ),
        ),
        // home: const SplashScreen(),
        initialRoute: SplashScreen.route,
        routes: {
          SplashScreen.route: (context) => const SplashScreen(),
          WelcomeScreen.route: (context) => const WelcomeScreen(),
          HomeDrawerMenu.route: (context) => const HomeDrawerMenu(),
          SongScreen.route: (context) => const SongScreen(),
        },
      ),
    );
  }
}
