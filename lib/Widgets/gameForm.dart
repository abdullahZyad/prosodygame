import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:prosodygame/model/game_model/check_ansr.dart';
import 'package:prosodygame/model/game_model/current_options.dart';
import 'package:prosodygame/model/game_model/temp_track.dart';
import '../model/data.dart';

class GameForm extends StatefulWidget {
  const GameForm({super.key});

  @override
  State<GameForm> createState() =>
      _GameFormState();

}

class _GameFormState extends State<GameForm> {

  @override
  Widget build(BuildContext context) {

    Hive.openBox("myBox");

    List<Widget> chooses = [
      // random bayt widget
      Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 2, color: HexColor("#6A2601")),
                left: BorderSide(width: 2, color: HexColor("#6A2601")),
                top: BorderSide(width: 2, color: HexColor("#6A2601")),
                right: BorderSide(width: 2, color: HexColor("#6A2601")),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.white
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
          width: MediaQuery.of(context).size.width*0.75,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: AutoSizeText(
                CurrentOptions.currQuesList[TempTracker.tempTrack],
                style: TextStyle(
                    fontSize: 60,
                  color: HexColor("#42272F"),
                  fontFamily: 'second'
                ),
                maxLines: 3,
                minFontSize: 5,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 25,),
      // option 1
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                Data().setOC1(!Data().getOC1Play());
                if(!Data().getOC1Play()==false){
                  Data().playAudio(Data().giveMeCurrentG().indexOf(CurrentOptions.currAnsrList[TempTracker.tempTrack][0]));
                } else {
                  Data().stopAudio();
                }
              });
            },
            icon: Icon(
              !Data().getOC1Play()?Icons.play_arrow:Icons.stop,
              size: 40,
              color: Data().getOC1Play()? Colors.green:HexColor("#42272F"),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: HexColor("#F9F0F1"),
                side: BorderSide(width: 2, color: HexColor("#42272F"))
            ),
          ),
          const Text("  "),
          ElevatedButton(
              onPressed: () {
                Data().resetOCAll();
                Data().stopAudio();
                if(!Data().getDisableButton()) {
                  if(TempTracker().incrable()) {
                    if(CheckAnsr.isItTheAnswer(
                      CurrentOptions.currQuesList[TempTracker.tempTrack],
                       CurrentOptions.currAnsrList[TempTracker.tempTrack][0])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        Data().setDisableButtonToT();
                        Data().setFirstOC(Colors.green);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                            TempTracker().incrTempTrack();
                            Data().changeTheGameForm();
                            Data().setDisableButtonToF();
                          });
                        });
                      });
                    } else {
                      setState(() {
                        Data().getMyMap().putAt(3, Data().getMyMap().getAt(3)+1);
                        Data().getMyMap().putAt(5, Data().getMyMap().getAt(5)+1);
                        Data().setFirstOC(Colors.red);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                          });
                        });
                      });
                    }
                  }
                  else {
                    if(CheckAnsr.isItTheAnswer(
                      CurrentOptions.currQuesList[TempTracker.tempTrack],
                       CurrentOptions.currAnsrList[TempTracker.tempTrack][0])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        if(Data().getNum()<3) {
                          Data().getMyMap().putAt(Data().getNum()-1, true);
                        }
                        Data().setDisableButtonToT();
                        Data().setFirstOC(Colors.green);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                            Data().setDisableButtonToF();
                            Data().setGameIsActive(false);
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/home');
                          });
                        });
                      });
                    } else {
                      setState(() {
                        Data().getMyMap().putAt(3, Data().getMyMap().getAt(3)+1);
                        Data().getMyMap().putAt(5, Data().getMyMap().getAt(5)+1);
                        Data().setFirstOC(Colors.red);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                          });
                        });
                      });
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Data().getFirstOptionColor(),
                  side: BorderSide(width: 2, color: HexColor("#42272F"))
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.08,
                    child: Center(
                      child: AutoSizeText(
                        CurrentOptions.currAnsrList[TempTracker.tempTrack][0],
                        style: TextStyle(
                            fontSize: 25,
                            color: HexColor("#6A2601")
                        ),
                        maxLines: 1,
                        minFontSize: 5,
                      ),
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
      const SizedBox(height: 15,),
      // option 2
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                Data().setOC1(!Data().getOC1Play());
                if(!Data().getOC1Play()==false){
                  Data().playAudio(Data().giveMeCurrentG().indexOf(CurrentOptions.currAnsrList[TempTracker.tempTrack][1]));
                } else {
                  Data().stopAudio();
                }
              });
            },
            icon: Icon(
              !Data().getOC1Play()?Icons.play_arrow:Icons.stop,
              size: 40,
              color: Data().getOC1Play()? Colors.green:HexColor("#42272F"),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: HexColor("#F9F0F1"),
                side: BorderSide(width: 2, color: HexColor("#42272F"))
            ),
          ),
          const Text("  "),
          ElevatedButton(
              onPressed: () {
                Data().resetOCAll();
                Data().stopAudio();
                if(!Data().getDisableButton()) {
                  if(TempTracker().incrable()) {
                    if(CheckAnsr.isItTheAnswer(
                      CurrentOptions.currQuesList[TempTracker.tempTrack],
                       CurrentOptions.currAnsrList[TempTracker.tempTrack][1])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        Data().setDisableButtonToT();
                        Data().setFirstOC(Colors.green);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                            TempTracker().incrTempTrack();
                            Data().changeTheGameForm();
                            Data().setDisableButtonToF();
                          });
                        });
                      });
                    } else {
                      setState(() {
                        Data().getMyMap().putAt(3, Data().getMyMap().getAt(3)+1);
                        Data().getMyMap().putAt(5, Data().getMyMap().getAt(5)+1);
                        Data().setFirstOC(Colors.red);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                          });
                        });
                      });
                    }
                  }
                  else {
                    if(CheckAnsr.isItTheAnswer(
                      CurrentOptions.currQuesList[TempTracker.tempTrack],
                       CurrentOptions.currAnsrList[TempTracker.tempTrack][1])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        if(Data().getNum()<3) {
                          Data().getMyMap().putAt(Data().getNum()-1, true);
                        }
                        Data().setDisableButtonToT();
                        Data().setFirstOC(Colors.green);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                            Data().setDisableButtonToF();
                            Data().setGameIsActive(false);
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/home');
                          });
                        });
                      });
                    } else {
                      setState(() {
                        Data().getMyMap().putAt(3, Data().getMyMap().getAt(3)+1);
                        Data().getMyMap().putAt(5, Data().getMyMap().getAt(5)+1);
                        Data().setFirstOC(Colors.red);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                          });
                        });
                      });
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Data().getFirstOptionColor(),
                  side: BorderSide(width: 2, color: HexColor("#42272F"))
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.08,
                    child: Center(
                      child: AutoSizeText(
                        CurrentOptions.currAnsrList[TempTracker.tempTrack][1],
                        style: TextStyle(
                            fontSize: 25,
                            color: HexColor("#6A2601")
                        ),
                        maxLines: 1,
                        minFontSize: 5,
                      ),
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
      const SizedBox(height: 15,),
      // option 3
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                Data().setOC1(!Data().getOC1Play());
                if(!Data().getOC1Play()==false){
                  Data().playAudio(Data().giveMeCurrentG().indexOf(
                    CurrentOptions.currAnsrList[TempTracker.tempTrack][2]));
                } else {
                  Data().stopAudio();
                }
              });
            },
            icon: Icon(
              !Data().getOC1Play()?Icons.play_arrow:Icons.stop,
              size: 40,
              color: Data().getOC1Play()? Colors.green:HexColor("#42272F"),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: HexColor("#F9F0F1"),
                side: BorderSide(width: 2, color: HexColor("#42272F"))
            ),
          ),
          const Text("  "),
          ElevatedButton(
              onPressed: () {
                Data().resetOCAll();
                Data().stopAudio();
                if(!Data().getDisableButton()) {
                  if(TempTracker().incrable()) {
                    if(CheckAnsr.isItTheAnswer(
                      CurrentOptions.currQuesList[TempTracker.tempTrack],
                       CurrentOptions.currAnsrList[TempTracker.tempTrack][2])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        Data().setDisableButtonToT();
                        Data().setFirstOC(Colors.green);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                            TempTracker().incrTempTrack();
                            Data().changeTheGameForm();
                            Data().setDisableButtonToF();
                          });
                        });
                      });
                    } else {
                      setState(() {
                        Data().getMyMap().putAt(3, Data().getMyMap().getAt(3)+1);
                        Data().getMyMap().putAt(5, Data().getMyMap().getAt(5)+1);
                        Data().setFirstOC(Colors.red);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                          });
                        });
                      });
                    }
                  }
                  else {
                    if(CheckAnsr.isItTheAnswer(
                      CurrentOptions.currQuesList[TempTracker.tempTrack],
                       CurrentOptions.currAnsrList[TempTracker.tempTrack][2])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        if(Data().getNum()<3) {
                          Data().getMyMap().putAt(Data().getNum()-1, true);
                        }
                        Data().setDisableButtonToT();
                        Data().setFirstOC(Colors.green);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                            Data().setDisableButtonToF();
                            Data().setGameIsActive(false);
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/home');
                          });
                        });
                      });
                    } else {
                      setState(() {
                        Data().getMyMap().putAt(3, Data().getMyMap().getAt(3)+1);
                        Data().getMyMap().putAt(5, Data().getMyMap().getAt(5)+1);
                        Data().setFirstOC(Colors.red);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          setState(() {
                            Data().resetOCC(1);
                          });
                        });
                      });
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Data().getFirstOptionColor(),
                  side: BorderSide(width: 2, color: HexColor("#42272F"))
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.08,
                    child: Center(
                      child: AutoSizeText(
                        CurrentOptions.currAnsrList[TempTracker.tempTrack][2],
                        style: TextStyle(
                            fontSize: 25,
                            color: HexColor("#6A2601")
                        ),
                        maxLines: 1,
                        minFontSize: 5,
                      ),
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
      const SizedBox(height: 30,),
      AutoSizeText(
        "${Data().getIndexOfTracker()}\\${Data().getIndexTrack().length}",
        maxLines: 1,
        maxFontSize: 40,
        minFontSize: 5,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
        textDirection: TextDirection.rtl,
      )
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: chooses,
      ),
    );

  }

}