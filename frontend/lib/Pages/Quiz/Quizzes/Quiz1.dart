import 'package:flutter/src/widgets/framework.dart';
import 'package:language/Pages/Quiz/QuizStructure.dart';

import '../../../Models/Words.dart';

// ignore: must_be_immutable
class Quiz1 extends StatelessWidget {
  Quiz1();

  String title = 'Quiz 1';
  var trueFalseQuestions1 = [
    ["German non-person nouns can be masculine and feminine.", true],
    ["In Spanish, adjectives are used before nouns.", false],
    [
      "Pronunciation of Chinese third singular personal pronouns are same.",
      true
    ]
  ];
  var testQuestions1 = [];
  List<Word> wordSet1 = [];
  var blankSet1 = [];

  @override
  Widget build(BuildContext context) {
    return QuizPage(
        title, trueFalseQuestions1, testQuestions1, wordSet1, blankSet1);
  }
}
