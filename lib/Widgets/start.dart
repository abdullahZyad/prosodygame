import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/data.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    Hive.openBox("myBox");
    Data().setMyMap();
    return SafeArea(
      child: Scaffold(
        body: Stack(
            children: [
              Image.asset(
                "assets/Patterns.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                    width:  MediaQuery.of(context).size.width*0.8,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: AutoSizeText(
                      "شكر خاص لـ: أ. محمد بن علي العمري ،أستاذ اللغة العربية في جامعة الملك خالد",
                      style: TextStyle(
                          fontSize: 20,
                          color: HexColor("#6A2601"),
                      ),
                      maxLines: 3,
                      minFontSize: 5,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.08,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Data().setGameIsActive(false);
                        Data().resetOCAll();
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1, color: HexColor("#42272F"))
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.15,
                        width: MediaQuery.of(context).size.width*0.3,
                        child: Center(
                          child: AutoSizeText(
                            "ابدأ",
                            style: TextStyle(fontSize: 42, color: HexColor("#6A2601")),
                            maxLines: 1,
                          ),
                        ),
                      )
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: InkWell(
                        child: const AutoSizeText(
                          'الخصوصية',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20
                          ),
                          maxLines: 1,
                          maxFontSize: 30,
                          minFontSize: 10,
                        ),
                        onTap: () => _launchUrl('https://na3mla-terms-of-service.netlify.app/')
                    ),
                  ),

                ],
              ),
            ),
            ]
        ),
      ),
    );
  }
  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }
}
