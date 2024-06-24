import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:prosodygame/model/game_model/current_options.dart';
import '../model/data.dart';
import 'game.dart';
import 'learning.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget changeable = Data().getGameIsActive()
        ? const Game()
        : (!Data().getIsHome())
            ? Learning()
            : Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.width * 0.05, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: AutoSizeText(
                          "المراحل:",
                          maxLines: 1,
                          minFontSize: 5,
                          style: TextStyle(
                            fontSize: 100,
                            color: HexColor("#6A2601"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  CurrentOptions.setCurrQuesList(
                                    10, [1,2,3,4,5], 3);
                                  Data().newIndexTracker();
                                  Data().setNum(1);
                                  Data().stopAudio();
                                  Data().resetOCColor();
                                  Data().resetMEE();
                                  Data().setGameIsActive(true);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      width: 2, color: HexColor("#42272F"))),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: Center(
                                  child: AutoSizeText("المرحلة الأولى",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: HexColor("#6A2601"),
                                      ),
                                      maxLines: 1,
                                      minFontSize: 5),
                                ),
                              ))),
                      const SizedBox(height: 15),
                      Data().getMyMap().getAt(0)
                          ? Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      CurrentOptions.setCurrQuesList(
                                        10, [6,7,8,9,10], 3);
                                      Data().newIndexTracker();
                                      Data().setNum(2);
                                      Data().stopAudio();
                                      Data().resetOCColor();
                                      Data().resetMEE();
                                      Data().setGameIsActive(true);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(
                                          width: 2,
                                          color: HexColor("#42272F"))),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: Center(
                                      child: AutoSizeText(
                                        "المرحلة الثانية",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: HexColor("#6A2601"),
                                        ),
                                        maxLines: 1,
                                        minFontSize: 5,
                                      ),
                                    ),
                                  )))
                          : const Text(""),
                      const SizedBox(height: 15),
                      Data().getMyMap().getAt(1)
                          ? Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      CurrentOptions.setCurrQuesList(
                                        10, [11,12,13,14,15], 3);
                                      Data().newIndexTracker();
                                      Data().setNum(3);
                                      Data().stopAudio();
                                      Data().resetOCColor();
                                      Data().resetMEE();
                                      Data().setGameIsActive(true);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(
                                          width: 2,
                                          color: HexColor("#42272F"))),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: Center(
                                      child: AutoSizeText(
                                        "المرحلة الثالثة",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: HexColor("#6A2601"),
                                        ),
                                        maxLines: 1,
                                        minFontSize: 5,
                                      ),
                                    ),
                                  )))
                          : const Text(""),
                    ],
                  ),
                ),
              );

    return Stack(children: [
      Image.asset(
        "assets/Patterns.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // appbar
          appBar: !Data().getGameIsActive()
              ? PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.15),
                  child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      flexibleSpace: const Image(
                        image: AssetImage('assets/bar.png'),
                        fit: BoxFit.fitHeight,
                      ),
                      automaticallyImplyLeading: false))
              : null,

          body: SingleChildScrollView(child: changeable),

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: SizedBox(
              height: Data().getGameIsActive()
                  ? MediaQuery.of(context).size.height * 0.08
                  : MediaQuery.of(context).size.height * 0.15,
              child: Container(
                decoration: Data().getGameIsActive()
                    ? const BoxDecoration()
                    : const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bar.png"),
                          fit: BoxFit.fitHeight,
                          // opacity: 0.4
                        ),
                      ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: !Data().getGameIsActive()
                            ? [
                                SizedBox(
                                  // width: MediaQuery.of(context).size.height*0.3,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          Learning().stopAudio();
                                          Data().setIsHome(true);
                                        });
                                        Learning().stopAudio();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          side: BorderSide(
                                              width: 2,
                                              color: HexColor("#42272F"))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: AutoSizeText(
                                          "الرئيسية",
                                          style: TextStyle(
                                              color: !Data().getIsHome()
                                                  ? HexColor("#6A2601")
                                                  : HexColor("#F9F0F1"),
                                              fontSize: 20),
                                          maxLines: 1,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  // width: MediaQuery.of(context).size.height*0.3,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          Data().setIsHome(false);
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          side: BorderSide(
                                              width: 2,
                                              color: HexColor("#42272F"))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: AutoSizeText(
                                          "طريقة اللعب",
                                          style: TextStyle(
                                              color: !Data().getIsHome()
                                                  ? HexColor("#F9F0F1")
                                                  : HexColor("#6A2601"),
                                              fontSize: 20),
                                          maxLines: 1,
                                        ),
                                      )),
                                ),
                              ]
                            : [],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
