import 'package:flutter/material.dart';
import 'package:first_app/grandient_container.dart';

const List<Color> colors = [
  Colors.purple,
  Colors.purpleAccent,
  Colors.deepPurple,
  Colors.deepPurpleAccent,
];

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors),
      ),
    ),
  );
}