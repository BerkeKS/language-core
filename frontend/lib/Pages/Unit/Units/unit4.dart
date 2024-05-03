import 'package:flutter/material.dart';
import 'package:language/Pages/Unit/Units/Unit5.dart';
import '../../../Models/sentence.dart';
import 'Unit3.dart';
import 'package:language/Pages/Unit/UnitTemplates/unitStructure.dart';

// ignore: must_be_immutable
class Unit4 extends StatelessWidget {
  Unit4();
  List<String> unit4VocabularyTopics = ["Close Relatives", "Distant Relatives"];
  List<String> unit4GrammarTopics = ["To Have", "Negation"];
  List<Sentence> unit4Dialogue = [];
  String unit4VocabularyTip =
      "Spanish does not have dirext translation of sibling.";
  List<Widget> unit4GrammarData = [
    Column(),
    Column(),
  ];

  @override
  Widget build(BuildContext context) {
    return UnitStructure(
        unitNumber: 4,
        unitTitle: "Unit 4 - In My Family...",
        unitVocabularyTopics: unit4VocabularyTopics,
        unitGrammarTopics: unit4GrammarTopics,
        unitDialogue: unit4Dialogue,
        unitDialogueImage: '',
        unitVocabularyTips: unit4VocabularyTip,
        unitGrammarData: unit4GrammarData,
        unitBefore: Unit3(),
        unitAfter: Unit5());
  }
}
