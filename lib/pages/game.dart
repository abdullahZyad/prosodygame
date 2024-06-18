import 'package:flutter/material.dart';
import 'data.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0,20,0,0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.7,
        width: MediaQuery.of(context).size.width,
        child: Stack(
            children: [
              Data().getOptions(),
            ]
        ),
      ),
    );

  }

}