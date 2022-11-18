import 'dart:math';

import 'package:flutter/material.dart';

class SeekbarData {
  final Duration position;
  final Duration duration;

  SeekbarData(this.position, this.duration);
}

class Seekbar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangedEdn;

  const Seekbar(
      {Key? key,
      required this.position,
      required this.duration,
      this.onChanged,
      this.onChangedEdn})
      : super(key: key);

  @override
  State<Seekbar> createState() => _SeekbarState();
}

class _SeekbarState extends State<Seekbar> {
  double? _dragValue;
  String? minutes;
  String? seconds;

  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return '--:--';
    } else {
      minutes = duration.inMinutes.toString().padLeft(2, '0');
      seconds = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    }
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_formatDuration(widget.position)),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
                trackHeight: 4,
                thumbShape: const RoundSliderThumbShape(
                  disabledThumbRadius: 4,
                  enabledThumbRadius: 4,
                ),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 10,
                ),
                activeTrackColor: Colors.white.withOpacity(0.2),
                inactiveTrackColor: Colors.white,
                thumbColor: Colors.white,
                overlayColor: Colors.white),
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(
                _dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble(),
              ),
              onChanged: (value) {
                setState(() => _dragValue = value);
                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangedEdn != null) {
                  widget.onChangedEdn!(Duration(milliseconds: value.round()));
                }
                _dragValue = value;
              },
            ),
          ),
        ),
        Text(_formatDuration(widget.duration)),
      ],
    );
  }
}
