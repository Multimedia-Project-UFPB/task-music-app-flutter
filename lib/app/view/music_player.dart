import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:task_music/app/model/song.dart';
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
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF570013),
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
              _trendingMusic(context, Song.songs),
            ],
          ),
        ),
      ),
    );
  }

  Padding _trendingMusic(BuildContext context, List<Song> songs) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _sectionSongsInHigh(context, 'Músicas em alta', 'Veja mais'),
          const SizedBox(height: 20),
          SizedBox(
            height: size.height * 0.50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Row _sectionSongsInHigh(BuildContext context, String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        Text(
          action,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
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

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({
    required this.song,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/song', arguments: song),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: size.width * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                  image: AssetImage(song.coverUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                height: 60,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          song.title,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: const Color(0xFF570013),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          song.description,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.play_circle,
                      color: const Color(0xFF570013),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
