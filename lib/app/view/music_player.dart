import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:task_music/app/utils/filters/background_filter_home.dart';
import 'package:task_music/app/widgets/custom_app_bar.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool expandedBox = false;

  _expandedBox() {
    setState(() {
      expandedBox = !expandedBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 87, 0, 19),
              Color(0xFFE80234),
            ],
          )),
          child: Scaffold(
            appBar: CustomAppBar(
              func: () => ZoomDrawer.of(context)!.toggle(),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _headerPageMusic(context),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: _expandedBox,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            width: !expandedBox ? 100 : MediaQuery.of(context).size.width,
            height: !expandedBox ? 100 : MediaQuery.of(context).size.height,
            color: Colors.purple,
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1586473219010-2ffc57b0d282?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGFza3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                    fit: BoxFit.cover,
                  ),
                  const BackgroundFilterHome(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding _headerPageMusic(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bem Vindo',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            'Aproveite suas músicas favoritas',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Pesquisar',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade400,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}
