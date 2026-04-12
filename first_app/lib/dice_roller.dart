import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1; // 1 <> 6;
    });
  }

  @override
  Widget build(ctx) {
    return Column(
      mainAxisSize: MainAxisSize.min, //center vertically
      children: [
        Image.asset('assets/dice-$currentDiceRoll.png', width: 150),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 28),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            backgroundColor: Colors.black.withValues(alpha: 0.2),
          ),
          child: Text('Roll Dice!'),
        ),
      ],
    );
  }
}
