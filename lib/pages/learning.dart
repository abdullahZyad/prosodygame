import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'data.dart';

// ignore: must_be_immutable
class Learning extends StatefulWidget {
  Learning({super.key});

  List<String> sounds =
    ["1.mp3","2.mp3","3.mp3","4.mp3","5.mp3",
    "6.mp3","7.mp3","8.mp3","9.mp3","10.mp3",
    "11.mp3","12.mp3","13.mp3","14.mp3","15.mp3"];
  static final player = AudioPlayer();
  // play audio
  void playAudio(int i) async
  {
    stopAudio();
    player.play(AssetSource("sounds/${sounds[i]}"));
  }
  // stop audio
  void stopAudio() {player.stop();}


  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {

  @override
  Widget build(BuildContext context) {

    // audio lists in widget
    List<Widget> list1 = [];
    for(int i=0; i<4; i++) {
      list1.add(
          Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.08,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("#E7BB8E"),
                      foregroundColor: HexColor("#F9F0F1"),
                      side: BorderSide(width: 2, color: HexColor("##42272F"))
              ),
                  onPressed: () {
                    Learning().playAudio(i);
                  },
                  child: AutoSizeText(
                      Data().getProsodyNames()[i],
                    style: TextStyle(
                      fontSize: 20,
                      color: HexColor("#6A2601"),
                    ),
                    maxLines: 1,
                    minFontSize: 5,
                  )
              ),
            ),
          )
      );
    }
    List<Widget> list2 = [];
    for(int i=4; i<8; i++) {
      list2.add(
          Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.08,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("#E7BB8E"),
                      foregroundColor: HexColor("#F9F0F1"),
                      side: BorderSide(width: 2, color: HexColor("##42272F"))
              ),
                  onPressed: () {
                    Learning().playAudio(i);
                  },
                  child: AutoSizeText(
                      Data().getProsodyNames()[i],
                    style: TextStyle(
                      fontSize: 20,
                      color: HexColor("#6A2601"),
                    ),
                    maxLines: 1,
                    minFontSize: 5,
                  )
              ),
            ),
          )
      );    }
    List<Widget> list3 = [];
    for(int i=8; i<12; i++) {
      list3.add(
          Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.08,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("#E7BB8E"),
                      foregroundColor: HexColor("#F9F0F1"),
                      side: BorderSide(width: 2, color: HexColor("##42272F"))
              ),
                  onPressed: () {
                    Learning().playAudio(i);
                  },
                  child: AutoSizeText(
                      Data().getProsodyNames()[i],
                    style: TextStyle(
                      fontSize: 20,
                      color: HexColor("#6A2601"),
                    ),
                    maxLines: 1,
                    minFontSize: 5,
                  )
              ),
            ),
          )
      );
     }
    List<Widget> list4 = [];
    for(int i=12; i<15; i++) {
      list4.add(
          Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.08,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("#E7BB8E"),
                      foregroundColor: HexColor("#F9F0F1"),
                      side: BorderSide(width: 2, color: HexColor("##42272F"))
              ),
                  onPressed: () {
                    Learning().playAudio(i);
                  },
                  child: AutoSizeText(
                      Data().getProsodyNames()[i],
                    style: TextStyle(
                      fontSize: 20,
                      color: HexColor("#6A2601"),
                    ),
                    maxLines: 1,
                    minFontSize: 5,
                  )
              ),
            ),
          )
      );
     }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children:
        [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.03),
                AutoSizeText(
                  "- طريقة اللعب: -\nتسمع النغمات بالخيارات وتعرضها على البيت"
                      "-ومن هنا أتى اسم علم العروض- "
                      "والنغمة التي تناسب البيت تختارها."
                      " هناك ثلاث مجموعات كل مجموعة سيكون فيها 5 أنغام (أبحر)."
                  ,
                  style: TextStyle(
                    fontSize: 20,
                      color: HexColor("#6A2601"),
                  ),
                  maxLines: 8,
                  minFontSize: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText(
                  "البحور",
                maxLines: 1,
                minFontSize: 5,
                style: TextStyle(
                  fontSize: 25,
                  color: HexColor("#6A2601"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: list1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: list2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: list3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: list4,
              ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Data().getMyMap().putAt(2, 0);
                      Data().getMyMap().putAt(3, 0);
                    });
                  },
                  child: AutoSizeText(
                    "إعادة الاحصائيات",
                    style: TextStyle(
                      color: HexColor("#6A2601"),
                    ),
                    maxLines: 1,
                    minFontSize: 5,
                  )
              )
            ],
          ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Data().getMyMap().putAt(0, false);
                      Data().getMyMap().putAt(1, false);
                      Data().getMyMap().putAt(2, 0);
                      Data().getMyMap().putAt(3, 0);

                    });
                  },
                  child: AutoSizeText(
                    "إعادة تعيين اللعبة",
                    style: TextStyle(
                      color: HexColor("#6A2601")
                    ),
                    maxLines: 1,
                    minFontSize: 5,
                  )
              )
            ],
          ),
        ],
      ),
    );

  }


}
