import 'package:flutter/material.dart';

// Model
import 'package:task_music/app/model/song.dart';

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
                  color: Colors.white.withOpacity(0.7),
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
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.play_circle,
                      color: Color(0xFF570013),
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
