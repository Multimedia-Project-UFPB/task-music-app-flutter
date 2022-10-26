import 'package:flutter/material.dart';
import 'package:task_music/app/view/home_screen.dart';
import 'package:task_music/app/view/splash_screen.dart';
import 'package:task_music/app/view/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
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
      home: const HomeScreen(),
      // initialRoute: SplashScreen.route,
      // routes: {
      //   SplashScreen.route: (_) => const SplashScreen(),
      //   WelcomeScreen.route: (_) => const WelcomeScreen(),
      //   HomeScreen.route: (_) => const HomeScreen(),
      // },
    );
  }
}
