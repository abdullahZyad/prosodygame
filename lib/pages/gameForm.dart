import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'data.dart';

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
      const SizedBox(height: 20),
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
                Data().getRBayt(),
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
                  Data().playAudio(Data().giveMeCurrentG().indexOf(Data().getListA()[0]));
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
                  if(Data().getIndexOfTracker()!=(Data().getIndexTrack().length-1)) {
                    if(Data().isItTheAnswer(Data().getListA()[0])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        Data().setDisableButtonToT();
                        Data().setFirstOC(Colors.green);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(1);
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
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(1);
                          });
                        });
                      });
                    }
                  }
                  else {
                    if(Data().isItTheAnswer(Data().getListA()[0])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        if(Data().getNum()<3) {
                          Data().getMyMap().putAt(Data().getNum()-1, true);
                        }
                        Data().setDisableButtonToT();
                        Data().setFirstOC(Colors.green);
                        Future.delayed(const Duration(seconds: 1), () {
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
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(1);
                          });
                        });
                      });
                    }
                  }
                } else {
                  null;
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
                        Data().getListA()[0],
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
                Data().setOC2(!Data().getOC2Play());
                if(!Data().getOC2Play()==false){
                  Data().playAudio(Data().giveMeCurrentG().indexOf(Data().getListA()[1]));
                } else {
                  Data().stopAudio();
                }
              });
            },
            icon: Icon(
              !Data().getOC2Play()?Icons.play_arrow:Icons.stop,
              size: 40,
              color: Data().getOC2Play()? Colors.green:HexColor("#42272F"),
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
                  if(Data().getIndexOfTracker()!=(Data().getIndexTrack().length-1)) {
                    if(Data().isItTheAnswer(Data().getListA()[1])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        Data().setDisableButtonToT();
                        Data().setSecondOC(Colors.green);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(2);
                            Data().changeTheGameForm();
                            Data().setDisableButtonToF();
                          });
                        });
                      });
                    } else {
                      setState(() {
                        Data().getMyMap().putAt(3, Data().getMyMap().getAt(3)+1);
                        Data().getMyMap().putAt(5, Data().getMyMap().getAt(5)+1);
                        Data().setSecondOC(Colors.red);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(2);
                          });
                        });
                      });
                    }
                  }
                  else {
                    if(Data().isItTheAnswer(Data().getListA()[1])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        if(Data().getNum()<3) {
                          Data().getMyMap().putAt(Data().getNum()-1, true);
                        }
                        Data().setDisableButtonToT();
                        Data().setSecondOC(Colors.green);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(2);
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
                        Data().setSecondOC(Colors.red);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(2);
                          });
                        });
                      });
                    }
                  }
                } else {
                  null;
                }

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Data().getSecondOptionColor(),
                  side: BorderSide(width: 2, color: HexColor("#42272F"))
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.08,
                    child: Center(
                      child: AutoSizeText(
                        Data().getListA()[1],
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
                Data().setOC3(!Data().getOC3Play());
                if(!Data().getOC3Play()==false){
                  Data().playAudio(Data().giveMeCurrentG().indexOf(Data().getListA()[2]));
                } else {
                  Data().stopAudio();
                }
              });
            },
            icon: Icon(
              !Data().getOC3Play()?Icons.play_arrow:Icons.stop,
              size: 40,
              color: Data().getOC3Play()? Colors.green:HexColor("#42272F"),
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
                  if(Data().getIndexOfTracker()!=10) {
                    if(Data().isItTheAnswer(Data().getListA()[2])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        Data().setDisableButtonToT();
                        Data().setThirdOC(Colors.green);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(3);
                            Data().changeTheGameForm();
                            Data().setDisableButtonToF();
                          });
                        });
                      });
                    } else {
                      setState(() {
                        Data().getMyMap().putAt(3, Data().getMyMap().getAt(3)+1);
                        Data().getMyMap().putAt(5, Data().getMyMap().getAt(5)+1);
                        Data().setThirdOC(Colors.red);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(3);
                          });
                        });
                      });
                    }
                  }
                  else {
                    if(Data().isItTheAnswer(Data().getListA()[2])) {
                      setState(() {
                        Data().getMyMap().putAt(2, Data().getMyMap().getAt(2)+1);
                        Data().getMyMap().putAt(4, Data().getMyMap().getAt(4)+1);
                        if(Data().getNum()<3) {
                          Data().getMyMap().putAt(Data().getNum()-1, true);
                        }
                        Data().setDisableButtonToT();
                        Data().setThirdOC(Colors.green);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(3);
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
                        Data().setThirdOC(Colors.red);
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            Data().resetOCC(3);
                          });
                        });
                      });
                    }
                  }
                } else {
                  null;
                }

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Data().getThirdOptionColor(),
                  side: BorderSide(width: 2, color: HexColor("#42272F"))
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.08,
                    child: Center(
                      child: AutoSizeText(
                        Data().getListA()[2],
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
      
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: chooses,
      ),
    );

  }

}