import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text('Dice Game'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset('image/dice$leftDice.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Image.asset('image/dice$rightDice.png'),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  leftDice = Random().nextInt(6) + 1;
                  rightDice = Random().nextInt(6) + 1;
                  showToast('$leftDice and $rightDice');
                });
              },
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent, minimumSize: Size(100, 60)),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
