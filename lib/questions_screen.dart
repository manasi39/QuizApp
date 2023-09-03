import 'package:flutter/material.dart';
import 'package:quiz_app/ans_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAns});

  final void Function(String ans) onSelectedAns;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestIndex = 0;

  void answerQuestion(String selectedAns) {
    widget.onSelectedAns(selectedAns);
    setState(() {
      currentQuestIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuest = questions[currentQuestIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuest.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 223, 238),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuest.getShuffledAns().map((ans) {
              //... used to return list as individual ele
              return AnswerButton(
                answerText: ans,
                onTap: () {
                  answerQuestion(ans);
                },
              );
            }) //to convert vals to different vals
          ],
        ),
      ),
    );
  }
}
