import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:task_music/app/model/song.dart';
import 'package:task_music/app/utils/filters/background_filter_song.dart';
import 'package:task_music/app/widgets/skeekbar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

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

  Stream<SeekbarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekbarData>(
        audioPlayer.positionStream,
        audioPlayer.durationStream,
        (Duration position, Duration? duration) =>
            SeekbarData(position, duration ?? Duration.zero),
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
          Image.asset(
            song.coverUrl,
            fit: BoxFit.cover,
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
  final Stream<SeekbarData> _seekBarData;
  final AudioPlayer audioPlayer;
  final Song song;

  const MusicPlayer({
    Key? key,
    required Stream<SeekbarData> seekBarData,
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
          Center(
            child: Text(
              song.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Text(
              song.description,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 30),
          StreamBuilder<SeekbarData>(
              stream: _seekBarData,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return Seekbar(
                  position: positionData?.position ?? Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
                  onChanged: audioPlayer.seek,
                );
              })
        ],
      ),
    );
  }
}
