import 'package:prosodygame/model/prosody-info-service.dart';

class CheckAnsr{

  static bool isItTheAnswer(String bayt, String ansr) {
    String b7r = "";
    for(int i=0; i<prosodyInfSer.allAbyat.length; i++) {
      for(int j=0; j<prosodyInfSer.allAbyat[i].length; j++) {
        if(bayt == prosodyInfSer.allAbyat[i][j]) {
          b7r = prosodyInfSer.prosodiesNames[i];
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
    for(int i=0; i<prosodyInfSer.allAbyat.length; i++) {
      for(int j=0; j<prosodyInfSer.allAbyat[i].length; j++) {
        if(bayt == prosodyInfSer.allAbyat[i][j]) {
          ansr = prosodyInfSer.prosodiesNames[i];
        }
      }
    }
    return ansr;
  }

}