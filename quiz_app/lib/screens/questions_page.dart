import 'package:flutter/material.dart';
import '../UI/answer_button.dart';
import '../data/questions.dart'; 
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionsIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionsIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // verificar se o índice é válido
    if (currentQuestionsIndex >= questions.length) {
      return const SizedBox.shrink();
    }
    
    final currentQuestion = questions[currentQuestionsIndex];
    
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:  const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                currentQuestion.text,
                style: GoogleFonts.roboto(
                  fontSize: 26, 
                  color: const Color.fromARGB(255, 236, 209, 209),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffleAnswers().map((item) {
              return AnswerButton(
                item, 
                () {
                  answerQuestion(item);
                }
              );
            })
          ],
        ),
      ),
    ); 
  }
}