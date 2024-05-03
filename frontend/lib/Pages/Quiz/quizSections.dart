import 'dart:math';

import 'package:flutter/material.dart';
import 'QuizStructure.dart';

class QuizTrueFalse extends StatefulWidget {
  const QuizTrueFalse(this.trueFalseQuestionSet);

  final List<dynamic> trueFalseQuestionSet;

  @override
  State<QuizTrueFalse> createState() => _QuizTrueFalseState();
}

class _QuizTrueFalseState extends State<QuizTrueFalse> {
  var trueFalseQuestions = [];
  int activeQuestion = 0;
  late bool learnerAnswer;

  answerCheck(bool userAnswer, bool correctAnswer) {
    if (userAnswer == correctAnswer) {
      QuizImplementation.quizScore++;
    }
  }

  questionSelector(List<dynamic> questionSet) {
    List<dynamic> selectedQuestions = [];
    Random rand = Random();
    while (selectedQuestions.length < 6) {
      int randomIndex = rand.nextInt(questionSet.length);
      if (!(selectedQuestions.contains(questionSet[randomIndex]))) {
        selectedQuestions.add(questionSet[randomIndex]);
      }
    }
    return selectedQuestions;
  }

  @override
  void initState() {
    trueFalseQuestions = questionSelector(widget.trueFalseQuestionSet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Text(trueFalseQuestions[activeQuestion][0]),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          learnerAnswer = true;
                          answerCheck(learnerAnswer,
                              trueFalseQuestions[activeQuestion][1]);
                          if (activeQuestion !=
                              (trueFalseQuestions.length - 1)) {
                            activeQuestion++;
                          } else {
                            QuizQuestions.activeQuizPart = QuizFillTheBlanks();
                            QuizQuestions.activeQuizPartString =
                                "Part 2 -Fill The Blanks";
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 12, 135, 16)),
                      child: const Text('True'))),
              const SizedBox(width: 20),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          learnerAnswer = true;
                          answerCheck(learnerAnswer,
                              trueFalseQuestions[activeQuestion][1]);
                          if (activeQuestion !=
                              (trueFalseQuestions.length - 1)) {
                            activeQuestion++;
                          } else {
                            QuizQuestions.activeQuizPart = QuizFillTheBlanks();
                            QuizQuestions.activeQuizPartString =
                                "Part 2 -Fill The Blanks";
                          }
                        });
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('False')))
            ],
          ),
        )
      ],
    );
  }
}

class QuizFillTheBlanks extends StatefulWidget {
  const QuizFillTheBlanks({Key? key}) : super(key: key);

  @override
  State<QuizFillTheBlanks> createState() => _QuizFillTheBlanksState();
}

class _QuizFillTheBlanksState extends State<QuizFillTheBlanks> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
