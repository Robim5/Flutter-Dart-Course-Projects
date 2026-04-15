import 'package:flutter/material.dart';

List<Color> gradientColors = [
  const Color.fromARGB(255, 93, 12, 107),
  const Color.fromARGB(255, 180, 21, 74),
  const Color.fromARGB(255, 17, 76, 124),
];

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override 
  Widget build(ctx){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
      ),
    );
  }
}
