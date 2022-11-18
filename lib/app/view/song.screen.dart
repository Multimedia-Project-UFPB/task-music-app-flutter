import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

// Model
import 'package:task_music/app/model/song.dart';

// Filter
import 'package:task_music/app/utils/filters/background_filter_song.dart';

// Widget
import 'package:task_music/app/widgets/skeekbar.dart';

class SongScreen extends StatefulWidget {
  static const String route = '/song';

  final Song? song;

  const SongScreen({
    Key? key,
    this.song,
  }) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  // final Song song = Get.arguments ?? Song.songs.length;

  play(BuildContext context) {
    final _arguments = ModalRoute.of(context)!.settings.arguments as Song;
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${_arguments.url}'),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[1].url}'),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[2].url}'),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[3].url}'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => play(context));
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
        audioPlayer.positionStream,
        audioPlayer.durationStream,
        (Duration position, Duration? duration) =>
            SeekBarData(position, duration ?? Duration.zero),
      );

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Song song = ModalRoute.of(context)!.settings.arguments as Song;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          StreamBuilder<int?>(
            stream: audioPlayer.currentIndexStream,
            builder: (context, snapshot) {
              final currentIndex = snapshot.data;
              if (currentIndex != null) {
                return Image.asset(
                  Song.songs[currentIndex].coverUrl,
                  fit: BoxFit.cover,
                );
              } else {
                return const Text('');
              }
            },
          ),
          const BackgroundFilterSong(),
          MusicPlayer(
            seekBarData: _seekBarDataStream,
            song: song,
            audioPlayer: audioPlayer,
          ),
        ],
      ),
    );
  }
}

class MusicPlayer extends StatelessWidget {
  final Stream<SeekBarData> _seekBarData;
  final AudioPlayer audioPlayer;
  final Song song;

  const MusicPlayer({
    Key? key,
    required Stream<SeekBarData> seekBarData,
    required this.song,
    required this.audioPlayer,
  })  : _seekBarData = seekBarData,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<int?>(
            stream: audioPlayer.currentIndexStream,
            builder: (context, snapshot) {
              final currentIndex = snapshot.data;
              if (currentIndex != null) {
                return Center(
                  child: Text(
                    Song.songs[currentIndex].title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                );
              } else {
                return const Text('');
              }
            },
          ),
          const SizedBox(height: 5),
          StreamBuilder<int?>(
            stream: audioPlayer.currentIndexStream,
            builder: (context, snapshot) {
              final currentIndex = snapshot.data;
              if (currentIndex != null) {
                return Center(
                  child: Text(
                    Song.songs[currentIndex].description,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                );
              } else {
                return const Text('');
              }
            },
          ),
          const SizedBox(height: 25),
          StreamBuilder<SeekBarData>(
            stream: _seekBarData,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChanged: audioPlayer.seek,
              );
            },
          ),
          PlayerButtons(audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StreamBuilder<int?>(
          stream: audioPlayer.currentIndexStream,
          builder: (context, snapshot) {
            return IconButton(
              onPressed:
                  audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null,
              icon: const Icon(
                Icons.skip_previous_outlined,
                color: Colors.white,
                size: 45,
              ),
            );
          },
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 5),
          child: StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final playerState = snapshot.data;
                final processingState = playerState!.processingState;

                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    width: 64,
                    height: 64,
                    margin: const EdgeInsets.all(10),
                    child: const CircularProgressIndicator.adaptive(),
                  );
                } else if (!audioPlayer.playing) {
                  return IconButton(
                    onPressed: audioPlayer.play,
                    iconSize: 75,
                    icon: const Icon(
                      Icons.play_circle,
                      color: Colors.white,
                    ),
                  );
                } else if (processingState != ProcessingState.completed) {
                  return IconButton(
                    onPressed: audioPlayer.pause,
                    iconSize: 75,
                    icon: const Icon(
                      Icons.pause_circle,
                      color: Colors.white,
                    ),
                  );
                } else {
                  return IconButton(
                    onPressed: () => audioPlayer.seek(
                      Duration.zero,
                      index: audioPlayer.effectiveIndices!.first,
                    ),
                    iconSize: 75,
                    icon: const Icon(
                      Icons.replay_circle_filled_outlined,
                      color: Colors.white,
                    ),
                  );
                }
              } else {
                return const CircularProgressIndicator.adaptive();
              }
            },
          ),
        ),
        StreamBuilder<int?>(
          stream: audioPlayer.currentIndexStream,
          builder: (context, snapshot) {
            return IconButton(
              onPressed: audioPlayer.hasNext ? audioPlayer.seekToNext : null,
              icon: const Icon(
                Icons.skip_next_outlined,
                color: Colors.white,
                size: 45,
              ),
            );
          },
        ),
      ],
    );
  }
}
