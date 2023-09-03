import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final correctAns = itemData['user_ans'] == itemData['correct_ans'];

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      QuestionIdentifier(
        correctAns: correctAns,
        qIndex: itemData['question_index'] as int,
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['question'] as String,
              style: const TextStyle(
                  color: Color.fromARGB(
                      115, 6, 48, 56), //Color.fromARGB(120, 91, 32, 7),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 1),
            Text(
              itemData['user_ans'] as String,
              style: const TextStyle(
                color: Color.fromARGB(122, 16, 105, 123), //(102, 14, 53, 103),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              itemData['correct_ans'] as String,
              style: const TextStyle(
                color: Color.fromARGB(137, 13, 113, 37),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    ]);
  }
}
