import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:prosodygame/Widget/option_game.dart';
import 'package:prosodygame/model/audio_service.dart';
import '../model/data.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  @override
  Widget build(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("متأكد"),
      onPressed: () {
        Data().setIsHome(true);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      },
    );
    Widget noButton = TextButton(
      child: Text("الغاء"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      content: Text("سيلغى تقدمك، هل انت متأكد؟"),
      actions: [
        noButton,
        okButton
      ],
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0,20,0,0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0,0,MediaQuery.of(context).size.width*0.1,0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            AudioSer.stopAudio;
                            Data().setOC1(false);
                            Data().setOC2(false);
                            Data().setOC3(false);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                                width: 1,
                                color: HexColor("#42272F"))),
                        child: const AutoSizeText(
                          "الرجوع",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20),
                          maxLines: 1,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.8,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(child: OptionGame())
              ),
            ]
        ),
      ),
    );

  }

}