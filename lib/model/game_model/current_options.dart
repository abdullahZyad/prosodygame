import 'dart:math';
import 'package:prosodygame/model/game_model/check_ansr.dart';
import 'package:prosodygame/model/game_model/temp_track.dart';
import 'package:prosodygame/model/prosody-info-service.dart';

class CurrentOptions {
  
  static List<String> currQuesList = [];
  static List<List<String>> currAnsrList = [];
  static int numOfOptions = 0;

  static List<String> setCurrQuesList(
      int numOfQues, List<int> alb7or, int numOfOption) {
    currQuesList = [];
    currAnsrList = [];
    numOfOptions = numOfOption;
    int diff = numOfQues - alb7or.length;
    if (diff == 0) {
      Set<String> set1 = {};
      while (set1.length < alb7or.length) {
        for (int i = 0; i < alb7or.length; i++) {
          set1.add(prosodyInfSer.allAbyat[alb7or[i] - 1]
              [Random().nextInt(prosodyInfSer.allAbyat[alb7or[i] - 1].length)]);
        }
      }
      currQuesList = set1.toList();
    } else if (diff > 0) {
      Set<String> set1 = {};
      Set<String> set2 = {};
      while (set1.length < alb7or.length) {
        for (int i = 0; i < alb7or.length; i++) {
          set1.add(prosodyInfSer.allAbyat[alb7or[i] - 1]
              [Random().nextInt(prosodyInfSer.allAbyat[alb7or[i] - 1].length)]);
        }
      }
      while (set2.length < diff) {
        for (int i = 0; i < alb7or.length; i++) {
          set2.add(prosodyInfSer.allAbyat[alb7or[i] - 1]
              [Random().nextInt(prosodyInfSer.allAbyat[alb7or[i] - 1].length)]);
        }
      }
      currQuesList = set1.toList() + set2.toList();
    } else {
      // make a random pick using int set
      Set<int> alb7orRandomPicker = {};
      while (alb7orRandomPicker.length < numOfQues) {
        alb7orRandomPicker.add(alb7or[Random().nextInt(alb7or.length)]);
      }
      // convert set into list to make for loop to set1
      List<int> alb7orRandomListPicker = alb7orRandomPicker.toList();
      Set<String> set1 = {};
      while (set1.length < numOfQues) {
        for (int i = 0; i < alb7orRandomListPicker.length; i++) {
          set1.add(prosodyInfSer.allAbyat[alb7orRandomListPicker[i] - 1][
              Random().nextInt(prosodyInfSer
                  .allAbyat[alb7orRandomListPicker[i] - 1].length)]);
        }
      }
      currQuesList = set1.toList();
    }
    currQuesList.shuffle();
    currQuesList.shuffle();
    Set<String> tempList = {};
    for(int i=0; i<numOfQues; i++) {
      tempList.add(currQuesList[i]);
    }
    currQuesList = tempList.toList();
    currQuesList.shuffle();
    setCurrAnsrList();
    TempTracker.tempTrack=0;
    return currQuesList;
  }

  static void setCurrAnsrList() {
    for (int i = 0; i < currQuesList.length; i++) {
      List<String> tempList = [];
      Set<String> tempSet = {};
      for (int j = 0; j < numOfOptions; j++) {
        while (tempSet.length < numOfOptions) {
          if (!tempSet.contains(
              CheckAnsr.giveMeTheAnsr(CurrentOptions.currQuesList[i]))) {
            tempSet
                .add(CheckAnsr.giveMeTheAnsr(CurrentOptions.currQuesList[i]));
          } else {
            tempSet.add(prosodyInfSer.prosodiesNames[Random().nextInt(14)]);
          }
        }
      }
      tempList = tempSet.toList();
      tempList.shuffle();
      currAnsrList.add(tempList);
    }
  }

}
