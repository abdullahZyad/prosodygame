import 'package:audioplayers/audioplayers.dart';

class AudioSer{
  
  static List<String> soundsAll = ["1.mp3","2.mp3","3.mp3","4.mp3","5.mp3",
                            "6.mp3","7.mp3","8.mp3","9.mp3","10.mp3",
                            "11.mp3","12.mp3","13.mp3","14.mp3","15.mp3"
                            ];

  static var player = AudioPlayer();

  static void playAudio(int i) async {
    player.play(AssetSource("sounds/${soundsAll[i]}"));
  }

  // stop audio
  static void stopAudio() {
    player.stop();
  }
}
