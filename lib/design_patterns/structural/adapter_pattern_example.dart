import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';

// @GenerateNiceMocks([MockSpec<MyAppMediaPlayer>()])
// import 'adapter_pattern_example.mocks.dart';

abstract interface class MediaPlayer {
  void play(String audioType, String fileName);
}

// Adaptee Class
class MyAppMediaPlayer {
  void playMp3(String fileName) {}

  void playMp4(String fileName) {}
}

// Adapter Class
class MediaAdapter implements MediaPlayer {
  MediaAdapter(this.myAppMediaPlayer);
  final MyAppMediaPlayer myAppMediaPlayer;

  @override
  void play(String audioType, String fileName) {
    if (audioType.toLowerCase() == 'mp3') {
      myAppMediaPlayer.playMp3(fileName);
    } else if (audioType.toLowerCase() == 'mp4') {
      myAppMediaPlayer.playMp4(fileName);
    }
  }
}

class AppMediaPlayer implements MediaPlayer {
  @override
  void play(String audioType, String fileName) {
    final mediaAdapter = MediaAdapter(MyAppMediaPlayer());
    mediaAdapter.play(audioType, fileName);
  }
}

class CustomWidgetMediaPlayer extends StatelessWidget {
  const CustomWidgetMediaPlayer({
    super.key,
    required this.type,
    required this.fileName,
    required this.adapter,
  });

  final String type;
  final String fileName;
  final MediaPlayer adapter;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        adapter.play(type, fileName);
      },
      child: Text('Play'),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              CustomWidgetMediaPlayer(
                type: 'mp3',
                fileName: 'file.mp3',
                adapter: AppMediaPlayer(),
              ),
              CustomWidgetMediaPlayer(
                type: 'mp4',
                fileName: 'file.mp4',
                adapter: AppMediaPlayer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main2() {
  runApp(MyApp());
}

// class MockMyAppMediaPlayer implements MyAppMediaPlayer {
//   @override
//   void playMp3(String fileName) {
//     // TODO: implement playMp3
//   }

//   @override
//   void playMp4(String fileName) {
//     // TODO: implement playMp4
//   }
// }

// void main() {
//   group('MediaPlayer Tests', () {
//     test('Should call playMp3 when MP3 is played', () {
//       final mediaPlayer = MockMyAppMediaPlayer();
//     });
//   });
// }
