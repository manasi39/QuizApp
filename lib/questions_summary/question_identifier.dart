import 'package:flutter/widgets.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.correctAns,
    required this.qIndex,
  });
  final int qIndex;
  final bool correctAns;

  @override
  Widget build(BuildContext context) {
    final qNum = qIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: correctAns
            ? const Color.fromARGB(147, 63, 147, 76)
            : const Color.fromARGB(159, 222, 100, 112),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        qNum.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(200, 254, 239, 240),
        ),
      ),
    );
  }
}
