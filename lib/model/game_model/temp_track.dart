import 'package:prosodygame/model/game_model/current_options.dart';

class TempTracker {
  static int tempTrack = 0;
  void incrTempTrack() => tempTrack<CurrentOptions.currQuesList.length-1? tempTrack++ : tempTrack=0;
  bool incrable()=>!(tempTrack==CurrentOptions.currQuesList.length-1);
}