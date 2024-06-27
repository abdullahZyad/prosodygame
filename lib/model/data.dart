import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Data {

  // hive local storage
  static var myMap = Hive.box("myBox");
  Future<void> setMyMap() async {
    Hive.openBox("myBox");
    await openHiveBox("myBox");
    if (myMap.toMap().isEmpty) {
      // to do (what you want to save locally):
      
    }
  }
  Box getMyMap() {
    return myMap;
  }

  Future<Box> openHiveBox(String boxName) async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName))
      // ignore: curly_braces_in_flow_control_structures
      Hive.init((await getApplicationDocumentsDirectory()).path);

    return await Hive.openBox(boxName);
  }

  static bool isHome = true;
  bool getIsHome(){return isHome;}
  void setIsHome(bool b){
    isHome = b;
    gameIsActive = false;
  }

  static bool isSettings= false;
  bool getIsSettings(){return isSettings;}
  void setIsSettings(bool b){
    isSettings = b;
  }

  static bool gameIsActive = false;
  void setGameIsActive(bool b) {
    gameIsActive = b;
  }
  bool getGameIsActive() {
    return gameIsActive;
  }

  static bool OC1Play = false;
  static bool OC2Play = false;
  static bool OC3Play = false;
  void setOC1(bool b) {
    if(b==true){
      OC2Play = false;
      OC3Play = false;
    }
    OC1Play = b;
  }
  void setOC2(bool b) {
    if(b==true){
      OC1Play = false;
      OC3Play = false;
    }
    OC2Play = b;
  }
  void setOC3(bool b) {
    if(b==true){
      OC1Play = false;
      OC2Play = false;
    }
    OC3Play = b;
  }
  bool getOC1Play() {
    return OC1Play;
  }
  bool getOC2Play() {
    return OC2Play;
  }
  bool getOC3Play() {
    return OC3Play;
  }
  void resetOCAll() {
    OC1Play = false;
    OC2Play = false;
    OC3Play = false;
  }
  
  static bool disableButton = false;
  void setDisableButtonToT() {
    disableButton = true;
  }
  void setDisableButtonToF() {
    disableButton = false;
  }
  bool getDisableButton() {
    return disableButton;
  }
  static Color firstOC = Colors.white;
  Color getFirstOptionColor() {
    return firstOC;
  }
  void setFirstOC(Color c) {
    firstOC = c;
  }

  static Color secondOC = Colors.white;
  Color getSecondOptionColor() {
    return secondOC;
  }
  void setSecondOC(Color c) {
    secondOC = c;
  }
  static Color thirdOC = Colors.white;
  Color getThirdOptionColor() {
    return thirdOC;
  }
  void setThirdOC(Color c) {
    thirdOC = c;
  }

  void resetOCColor() {
    firstOC = Colors.white;
    secondOC = Colors.white;
    thirdOC = Colors.white;
  }
  void resetOCC(int i) {
    i == 1?firstOC = Colors.white :
        i == 2? secondOC = Colors.white:
            thirdOC = Colors.white;
  }

}