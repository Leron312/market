import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

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