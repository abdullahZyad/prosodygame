import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:prosodygame/Widget/settings.dart';
import 'package:prosodygame/model/audio_service.dart';
import 'package:prosodygame/model/game_model/current_options.dart';
import '../model/data.dart';
import 'package:iconly/iconly.dart';
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
        : (Data().getIsSettings())
            ? const Settings() : (!Data().getIsHome())? Learning()
            : Center(
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  CurrentOptions.setCurrQuesList(
                                    10, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], 3);
                                  Data().resetOCColor();
                                  Data().setGameIsActive(true);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      width: 2, color: HexColor("#42272F"))),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: Center(
                                  child: AutoSizeText("العب",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: HexColor("#6A2601"),
                                      ),
                                      maxLines: 1,
                                      maxFontSize: 40,
                                      minFontSize: 10
                                      ),
                                ),
                              )));

   
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

          body: changeable,

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Data().getGameIsActive()? Text("") : SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Container(
                decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bar.png"),
                          fit: BoxFit.fitHeight,
                          // opacity: 0.4
                        ),
                      ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.07,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Data().setIsHome(false);
                                    Data().setIsSettings(false);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 2,
                                        color: HexColor("#42272F"))),
                                child: Icon(
                                  IconlyBold.info_circle,
                                  size: 30,
                                  color: ((!Data().getIsHome())&&(!Data().getIsSettings()))
                                            ? HexColor("#F9F0F1")
                                            : HexColor("#6A2601"),
                                )
                                ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.08,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    AudioSer.stopAudio();
                                    Data().setIsHome(true);
                                    Data().setIsSettings(false);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 2,
                                        color: HexColor("#42272F"))),
                                child: Icon(
                                  IconlyBold.home,
                                  size: 40,
                                  color: (Data().getIsHome())
                                            ? HexColor("#F9F0F1") : 
                                            HexColor("#6A2601"),
                                )
                                ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.07,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Data().setIsHome(false);
                                    Data().setIsSettings(true);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 2,
                                        color: HexColor("#42272F"))),
                                child: Icon(
                                  IconlyBold.setting,
                                  size: 30,
                                  color: Data().getIsSettings()
                                            ? HexColor("#F9F0F1")
                                            : HexColor("#6A2601")
                                )
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
