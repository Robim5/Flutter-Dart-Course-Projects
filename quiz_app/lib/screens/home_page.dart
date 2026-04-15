import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage( this.startQuiz , {super.key});

  final void Function() startQuiz;

  @override
  Widget build(ctx) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(  
              'assets/quiz-logo.png',
              width: 200,
              height: 200,
              //color: const Color.fromARGB(0, 255, 82, 82),
              // you can adjust the color and opacity as needed, easier than widget tree
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Learn flutter the fun way!',
            style: GoogleFonts.roboto(
              fontSize: 28, 
              color: const Color.fromARGB(255, 237, 209, 209),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.white, width: 2),
              ),
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_forward),
          ),
         ],
      )
    );
  }
}

