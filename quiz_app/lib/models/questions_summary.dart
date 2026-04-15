import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/result_page.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    

    return SizedBox(
      height: 300,
      child: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Column(
          children: summaryData.map((data) {

            bool isCorrect = data['user_answer'] == data['correct_answer'];

            return Column(
              children: [
                // num plus question text
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isCorrect ? const Color.fromARGB(255, 27, 112, 30) : const Color.fromARGB(255, 150, 26, 17),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 16, 
                          color: Colors.white, 
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              blurRadius: 2,
                              color: Colors.black,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isCorrect ? const Color.fromARGB(255, 27, 112, 30) : const Color.fromARGB(255, 150, 26, 17),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          data['question'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 14, 
                            color: Colors.white, 
                            fontWeight: FontWeight.w300,
                            height: 1.3,
                            letterSpacing: 1.5,
                            shadows: [
                              Shadow(
                                blurRadius: 2,
                                color: Colors.black,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // answers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      data['user_answer'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 11, 
                        color: Colors.yellow, 
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 11, 
                        color: Colors.green, 
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
          ),
        ),
      ),
    );
  }
}