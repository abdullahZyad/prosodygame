import 'package:prosodygame/model/prosody_info.dart';

class CheckAnsr{

  static bool isItTheAnswer(String bayt, String ansr) {
    String b7r = "";
    for(int i=0; i<ProsodyInf.allAbyat.length; i++) {
      for(int j=0; j<ProsodyInf.allAbyat[i].length; j++) {
        if(bayt == ProsodyInf.allAbyat[i][j]) {
          b7r = ProsodyInf.prosodiesNames[i];
        }
      }
    }
    if(ansr == b7r) {
      return true;
    }
    else {
      return false;
    }
  }

  static String giveMeTheAnsr(String bayt) {
    String ansr = "";
    for(int i=0; i<ProsodyInf.allAbyat.length; i++) {
      for(int j=0; j<ProsodyInf.allAbyat[i].length; j++) {
        if(bayt == ProsodyInf.allAbyat[i][j]) {
          ansr = ProsodyInf.prosodiesNames[i];
        }
      }
    }
    return ansr;
  }

}