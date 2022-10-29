import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:task_music/app/view/home_screen.dart';
import 'package:task_music/app/view/music_player.dart';

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem(this.title, this.icon);
}

class MenuItems {
  static const task = MenuItem('Tasks', Icons.task);
  static const music = MenuItem('Music', Icons.music_note);

  static const all = <MenuItem>[
    task,
    music,
  ];
}

class HomeDrawerMenu extends StatefulWidget {
  static const String route = '/home-drawer';
  const HomeDrawerMenu({Key? key}) : super(key: key);

  @override
  State<HomeDrawerMenu> createState() => _HomeDrawerMenuState();
}

class _HomeDrawerMenuState extends State<HomeDrawerMenu> {
  MenuItem currentItem = MenuItems.task;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        menuBackgroundColor: Theme.of(context).colorScheme.primary,
        mainScreen: getScreen(),
        menuScreen: Builder(
          builder: (context) => MenuScreen(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            },
          ),
        ),
        slideWidth: MediaQuery.of(context).size.width * 0.60,
        angle: -10.0,
        showShadow: true,
        shadowLayer1Color: const Color(0xff7c0000),
        shadowLayer2Color: const Color.fromARGB(255, 229, 89, 89),
      );

  getScreen() {
    switch (currentItem) {
      case MenuItems.task:
        return const HomeScreen();
      case MenuItems.music:
        return const MusicPlayer();

      default:
    }
  }
}

class MenuScreen extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuScreen(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              ...MenuItems.all.map(buildMenuItem).toList(),
              const Spacer(
                flex: 2,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'by Leandro Simões',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: const Color.fromARGB(255, 255, 159, 159),
                        ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTile(
        selectedColor: const Color(0xff7c0000),
        selectedTileColor: const Color.fromARGB(255, 255, 159, 159),
        selected: currentItem == item,
        minLeadingWidth: 30,
        leading: Icon(item.icon),
        title: Text(item.title),
        onTap: () => onSelectedItem(item),
      );
}
