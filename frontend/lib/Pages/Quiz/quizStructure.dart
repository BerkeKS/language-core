import 'dart:async';

import 'package:flutter/material.dart';
import 'package:language/Pages/OtherPages/navBar.dart';

import '../../Models/Words.dart';
import 'quizSections.dart';

class QuizPage extends StatelessWidget {
  const QuizPage(this.quizTopic, this.quizTrueFalseSet, this.quizTestSet,
      this.quizWordSet, this.quizFillBlankSet);

  final String quizTopic;
  final List<dynamic> quizTrueFalseSet;
  final List<dynamic> quizTestSet;
  final List<Word> quizWordSet;
  final List<dynamic> quizFillBlankSet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: Builder(
        builder: (context) => Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.black,
              Color.fromARGB(255, 200, 53, 115),
              Color.fromARGB(255, 255, 193, 30),
              Color.fromARGB(255, 54, 162, 161),
              Color.fromARGB(255, 127, 221, 233),
              Color.fromARGB(255, 88, 48, 209)
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
                color: Colors.white,
              ),
              QuizImplementation(quizTopic, quizTrueFalseSet, quizTestSet,
                  quizWordSet, quizFillBlankSet)
            ],
          ),
        ),
      ),
    );
  }
}

class QuizImplementation extends StatefulWidget {
  const QuizImplementation(
      this.quizTitle, this.tfSet, this.test, this.words, this.fillTheBlank);

  final String quizTitle;
  final List<dynamic> tfSet;
  final List<dynamic> test;
  final List<Word> words;
  final List<dynamic> fillTheBlank;
  static int quizScore = 0;

  @override
  State<QuizImplementation> createState() => _QuizImplementationState();
}

class _QuizImplementationState extends State<QuizImplementation> {
  var quizMessage;
  int mixedLanguageMinutes = 30;
  int simpleLanguageMinutes = 15;
  int leftSeconds = 0;
  int isMixedQuiz = 0;
  int totalMixedQuizSeconds = 30 * 60;
  int totalSimpleQuizSeconds = 15 * 60;
  int passedSeconds = 0;
  String leftSecondString = "00";

  @override
  void initState() {
    quizMessage = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'This is the page where you can test your previous knowledge.\nDo you prefer a mixed quiz or a quiz which contains questions about just one language?',
          style: TextStyle(fontSize: 30),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                isMixedQuiz = 1;
                mixedQuizBegin();
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 6, 6, 65)),
            child: const Text('MIXED LANGUAGE QUIZ')),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                isMixedQuiz = 2;
                simpleQuizBegin();
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 6, 6, 65)),
            child: const Text('SIMPLE LANGUAGE QUIZ'))
      ],
    );
    super.initState();
  }

  Timer? quizTime;

  mixedQuizStartTimer() {
    quizTime = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (!(mixedLanguageMinutes == 0 && leftSeconds == 0)) {
          if (leftSeconds == 0) {
            mixedLanguageMinutes--;
            leftSeconds = 59;
          } else {
            leftSeconds--;
          }
        }
        leftSecondString =
            (leftSeconds < 10) ? '0$leftSeconds' : '$leftSeconds';
        totalMixedQuizSeconds--;
        if (passedSeconds == totalMixedQuizSeconds) {
          passedSeconds++;
        }
      });
    });
  }

  simpleQuizStartTimer() {
    quizTime = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (!(simpleLanguageMinutes == 0 && leftSeconds == 0)) {
          if (leftSeconds == 00) {
            simpleLanguageMinutes--;
            leftSeconds = 59;
          } else {
            leftSeconds--;
          }
        } else {
          quizMessage = Text(
              'Your time is up! Your final score is ${QuizImplementation.quizScore}');
        }
        leftSecondString =
            (leftSeconds < 10) ? '0$leftSeconds' : '$leftSeconds';
        totalSimpleQuizSeconds--;
        if (passedSeconds != totalSimpleQuizSeconds) {
          passedSeconds++;
        }
      });
    });
  }

  mixedQuizBegin() {
    quizMessage = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Your quiz will start after clicking the button below,\nand you will have 30 minutes to finish it.\nDo you want to do it now?',
          style: TextStyle(fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isMixedQuiz = 2;
                    simpleQuizBegin();
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 6, 65)),
                child: const Text('CHANGE THE QUIZ STYLE')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  mixedQuizStartTimer();
                  /*
                  quizMessage = QuizQuestions(widget.tfSet, widget.test,
                      widget.words, widget.fillTheBlank);
                      */
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 6, 65)),
                child: const Text('START THE QUIZ')),
          ],
        )
      ],
    );
  }

  simpleQuizBegin() {
    quizMessage = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Your quiz will start after clicking the button below,\nand you will have 15 minutes to finish it.\nDo you want to do it now?',
          style: TextStyle(fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isMixedQuiz = 1;
                    mixedQuizBegin();
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 6, 65)),
                child: const Text('CHANGE THE QUIZ STYLE')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  simpleQuizStartTimer();
                  /*
                  quizMessage = QuizQuestions(widget.tfSet, widget.test,
                      widget.words, widget.fillTheBlank);
                      */
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 6, 65)),
                child: const Text('START THE QUIZ'))
          ],
        )
      ],
    );
  }

  timeDisplayer(int quizOption) {
    if (quizOption == 0) {
      return Container();
    } else if (quizOption == 1) {
      return Column(
        children: [
          Text(
            '$mixedLanguageMinutes:$leftSecondString',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 10,
              width: MediaQuery.of(context).size.width * 0.3,
              child: LinearProgressIndicator(
                value: 1 - (passedSeconds / totalMixedQuizSeconds),
                valueColor: const AlwaysStoppedAnimation(
                    Color.fromARGB(255, 0, 113, 4)),
              ))
        ],
      );
    } else {
      return Column(
        children: [
          Text(
            '$simpleLanguageMinutes:$leftSecondString',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 10,
              width: MediaQuery.of(context).size.width * 0.3,
              child: LinearProgressIndicator(
                value: 1 - (passedSeconds / totalSimpleQuizSeconds),
                valueColor: const AlwaysStoppedAnimation(
                    Color.fromARGB(255, 0, 113, 4)),
              ))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.4)),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.quizTitle,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        timeDisplayer(isMixedQuiz),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              quizMessage
            ],
          ),
        ),
      ],
    );
  }
}

class QuizQuestions extends StatefulWidget {
  const QuizQuestions(this.tfQuestionSet, this.testQuestionSet,
      this.quizWordSet, this.fillQuestionSet);

  final List<dynamic> tfQuestionSet;
  final List<dynamic> testQuestionSet;
  final List<Word> quizWordSet;
  final List<dynamic> fillQuestionSet;
  static Widget activeQuizPart = Container();
  static String activeQuizPartString = "Part 1 - True/False";

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  @override
  void initState() {
    super.initState();
    QuizQuestions.activeQuizPart = QuizTrueFalse(widget.tfQuestionSet);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 21, 89, 206)),
          child: Text(
            QuizQuestions.activeQuizPartString,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 25),
        QuizQuestions.activeQuizPart
      ],
    );
  }
}
