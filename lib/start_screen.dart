import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(123, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Welcome to the quiz app',
            style: GoogleFonts.lato(
              color:const Color.fromARGB(255, 254, 231, 231),
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 253, 227, 227)),
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text('Start quiz'), //child to label because .icon
          ),
        ],
      ),
    );
  }
}
