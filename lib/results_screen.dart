import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAns, required this.onRestart});

  final void Function() onRestart;
  final List<String> chosenAns;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_ans': questions[i].answers[0],
        'user_ans': chosenAns[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQ = questions.length;
    final correctQ = summaryData.where((data) {
      return data['user_ans'] == data['correct_ans'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctQ out of $totalQ questions correctly",
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(185, 187, 62, 89), //(184, 133, 16, 41)
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(168, 255, 255, 255)),
              icon: const Icon(Icons.restart_alt_outlined),
              label: const Text(
                'Restart',
                style: TextStyle(
                  color: Color.fromARGB(168, 255, 255, 255),
                  fontSize: 19,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
