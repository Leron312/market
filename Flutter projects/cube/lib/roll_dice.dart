import 'dart:math';
import 'package:flutter/material.dart';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  var firstDice = 'assets/1.png';
  var secondDice = 'assets/1.png';

  void rolling() {
    var random1 = Random().nextInt(6) + 1;
    var random2 = Random().nextInt(6) + 1;
    setState(() {
      firstDice = 'assets/$random1.png';
      secondDice = 'assets/$random2.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 400.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                firstDice,
                width: 120,
              ),
              const SizedBox(width: 20),
              Image.asset(
                secondDice,
                width: 120,
              ),
            ],
          ),
          const SizedBox(height: 180),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: rolling,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Roll Dice'),
            ),
          )
        ],
      ),
    );
  }
}