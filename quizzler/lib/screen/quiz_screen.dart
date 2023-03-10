import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/components/SelectButton.dart';
import 'package:quizzler/model/quizbrain.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> resultReminder = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QuizPart(),
              SelectionPart(),
              ResultReminderPart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget QuizPart() {
    return Expanded(
      child: Center(
        child: Text(
          quizBrain.getQuizText(),
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  Widget SelectionPart() {
    return Column(
      children: [
        SelectButton(
          buttonContext: 'True',
          buttonColor: Colors.green,
          onPressed: () {
            onButtonPressed(true);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        SelectButton(
          buttonContext: 'False',
          buttonColor: Colors.red,
          onPressed: () {
            onButtonPressed(false);
          },
        ),
      ],
    );
  }

  Widget ResultReminderPart() {
    return Row(
      children: resultReminder,
    );
  }

  void onButtonPressed(bool bUserSelection) {
    setState(() {
      bool bAnswer = quizBrain.getQuizAnswer();
      addReminderIcon(bAnswer, bUserSelection);
      if (quizBrain.isLastQuiz()) {
        ShowAlert(title: 'Quiz Over', content: 'End of Quiz');
        resultReminder.clear();
        quizBrain.moveFirstQuiz();
      } else {
        quizBrain.moveNextQuiz();
      }
    });
  }

  void addReminderIcon(bool bAnswer, bool bUserSelection) {
    if (bUserSelection == bAnswer) {
      resultReminder.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      resultReminder.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  void ShowAlert({required String title, required String content}) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text("??????"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
