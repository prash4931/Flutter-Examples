import 'package:flutter/material.dart';
import 'package:flutter_application_1/design_patterns/structural/adapter_pattern_example.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<MyAppMediaPlayer>()])
import 'adapter_pattern_example_test.mocks.dart';

void main() {
  group('MediaPlayer Tests', () {
    test('Should call playMp3 when MP3 is played', () {
      final mediaPlayer = MockMyAppMediaPlayer();
      final mediaAdapter = MediaAdapter(mediaPlayer);

      mediaAdapter.play('mp3', 'song.mp3');

      verify(mediaPlayer.playMp3('song.mp3')).called(1);
    });

    test('Should call playMp4 when MP4 is played', () {
      final mediaPlayer = MockMyAppMediaPlayer();
      final mediaAdapter = MediaAdapter(mediaPlayer);

      mediaAdapter.play('mp4', 'video.mp4');

      verify(mediaPlayer.playMp4('video.mp4')).called(1);
    });
  });

  group('AppMediaPlayer Tests', () {
    testWidgets('Should display two buttons and react to taps', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MyApp());

      expect(find.byType(CustomWidgetMediaPlayer), findsNWidgets(2));

      await tester.tap(find.widgetWithText(TextButton, 'Play').first);

      await tester.pump();
    });
  });
}
