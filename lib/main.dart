import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dices',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
                color: Colors.redAccent.shade300,
              ),
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var LeftDice = 1;
  var RightDice = 1;
  int max = 6;

  void randomdice() {
    setState(() {
      LeftDice = Random().nextInt(max) + 1;
      RightDice = Random().nextInt(max) + 1;
      print('LeftDice no is $LeftDice');
      print('RightDice no is $RightDice');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: FlatButton(
                child: Image.asset(
              'images/dice$LeftDice.png',
              height: 500,
              width: 200,
            )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: FloatingActionButton(
                    tooltip: 'Increment Counter',
                    onPressed: () {
                      randomdice();
                      final player = AudioCache();
                      player.play(
                          'dice.wav'); // if user press the button , then he listen sound.
                    },
                    child: const Icon(
                      Icons.offline_bolt,
                      size: 60.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image(
                image: AssetImage(
                  'images/dice$RightDice.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
