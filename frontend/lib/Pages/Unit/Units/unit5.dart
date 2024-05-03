import 'package:flutter/material.dart';
import 'package:language/Pages/Unit/Units/Unit0.dart';
import 'package:language/Pages/Unit/Units/Unit4.dart';
import 'package:language/Pages/Unit/UnitTemplates/unitStructure.dart';
import '../../../Models/sentence.dart';

// ignore: must_be_immutable
class Unit5 extends StatelessWidget {
  Unit5();
  List<String> unit5VocabularyTopics = ["Countries", "Nationalities"];
  List<String> unit5GrammarTopics = [
    "Basic Speech Sentences",
    "To Be + Sentence Structure"
  ];
  List<Sentence> unit5Dialogue = [];
  String unit5VocabularyTip = "";
  List<Widget> unit5GrammarData = [
    Column(),
    Column(),
  ];

  @override
  Widget build(BuildContext context) {
    return UnitStructure(
        unitNumber: 4,
        unitTitle: "Unit 4 - In My Family...",
        unitVocabularyTopics: unit5VocabularyTopics,
        unitGrammarTopics: unit5GrammarTopics,
        unitDialogue: unit5Dialogue,
        unitDialogueImage: '',
        unitVocabularyTips: unit5VocabularyTip,
        unitGrammarData: unit5GrammarData,
        unitBefore: Unit4(),
        unitAfter: Unit0());
  }
}
