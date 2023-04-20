import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class FlashcardAudioPlayer extends StatefulWidget {
  final String audioUrl;
  final VoidCallback onToggle;

  const FlashcardAudioPlayer(
      {super.key, required this.audioUrl, required this.onToggle});

  @override
  _FlashcardAudioPlayerState createState() => _FlashcardAudioPlayerState();
}

class _FlashcardAudioPlayerState extends State<FlashcardAudioPlayer> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _initAudioPlayer() async {
    try {
      await _audioPlayer.setUrl(widget.audioUrl);
      _audioPlayer.play();
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  void _toggleAudio() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    widget.onToggle();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_audioPlayer.playing ? Icons.pause : Icons.play_arrow),
      onPressed: _toggleAudio,
    );
  }
}
