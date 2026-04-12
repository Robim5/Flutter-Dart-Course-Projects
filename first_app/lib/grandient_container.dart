import 'package:flutter/material.dart';
import 'package:first_app/dice_roller.dart';

const startAlign = Alignment.topLeft;
const endAlign = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(ctx) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlign,
          end: endAlign,
        ),
      ),
      child: Center(
        child: DiceRoller() 
      ),
    );
  }
}
