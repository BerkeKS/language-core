import 'package:flutter/material.dart';
import 'package:language/Models/sentence.dart';
import '../UnitTemplates/unitGrammar.dart';
import 'Unit2.dart';
import 'Unit4.dart';
import 'package:language/Pages/Unit/UnitTemplates/unitStructure.dart';

// ignore: must_be_immutable
class Unit3 extends StatelessWidget {
  Unit3();

  List<String> unit3VocabularyTopics = ["Active Verbs", "Places"];
  static List<String> unit3GrammarTopics = [
    "Present Tense",
    "Marks(Korean)/Akkusativ(German)"
  ];
  List<Sentence> unit3Dialogue = [];
  String unit3VocabularyTip =
      "When we merge two nouns like 'Arbeitsplatz' in German, the gender of the noun will be the gender of the secondary name.";
  List<Widget> unit3GrammarData = [
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit3GrammarTopics[0],
            grammarSubTitle: 'Present Tense',
            grammarLanguage: 'Chinese'),
        const Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Present tense is simple in Chinese.\nJust obey the rule of SUBJECT + VERB + OTHER COMPONENTS without any modification of the verb itself.",
                style: TextStyle(fontSize: 30)),
            SizedBox(height: 15),
            Text("Examples: ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Text("• 我是学生。\n(I am a student.)", style: TextStyle(fontSize: 25)),
            Text("• 她是老板。\n(She is a boss.)", style: TextStyle(fontSize: 25)),
            Text("• 我们是医生。\n(We are doctors.)", style: TextStyle(fontSize: 25)),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit3GrammarTopics[0],
            grammarSubTitle: 'Present Tense',
            grammarLanguage: 'German'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(TextSpan(style: TextStyle(fontSize: 30), children: [
              TextSpan(text: "This table shows the conjugation for the "),
              TextSpan(
                  text: "regular",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " verbs for present tense.")
            ])),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  border: TableBorder.all(
                    width: 1.5,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  children: const [
                    TableRow(children: [
                      Text(
                        'Personal Noun',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Conjugation",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Ich',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-e',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Du',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-st',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Er/Sie/Es',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-t',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Wir',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-en',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Ihr',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-t',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Sie/Sie',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-en',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                  ],
                )),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit3GrammarTopics[0],
            grammarSubTitle: 'Present Tense',
            grammarLanguage: 'Korean'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(TextSpan(style: TextStyle(fontSize: 30), children: [
              TextSpan(
                  text:
                      "There are more than one way to conjugate verb in Korean, depending on the person spoken to."),
              TextSpan(text: "In this unit you are introduced to "),
              TextSpan(
                  text: "general",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      " version of Present Tense in Korean. Other version will be introduced in following units.")
            ])),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  border: TableBorder.all(
                    width: 1.5,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  children: const [
                    TableRow(children: [
                      Text(
                        'Verb',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Conjugation",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Verb Ending with a Vowel',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-ㅂ니다',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Verb Ending with a Consonant',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-습니다',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                  ],
                )),
            const Text("Examples: ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const Text("• 제 선생님이 달립니다.\n(My teacher runs.)",
                style: TextStyle(fontSize: 25)),
            const Text("• 저는 학교에 갑니다.\n(I go to school.)",
                style: TextStyle(fontSize: 25)),
            const Text("• 단신의 친구는 집을 삽니다.\n(Your friend buys a house.)",
                style: TextStyle(fontSize: 25)),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit3GrammarTopics[0],
            grammarSubTitle: 'Present Tense',
            grammarLanguage: 'Spanish'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(TextSpan(style: TextStyle(fontSize: 30), children: [
              TextSpan(text: "This table shows the conjugation for the "),
              TextSpan(
                  text: "regular",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " verbs for present tense.")
            ])),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  border: TableBorder.all(
                    width: 1.5,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  children: const [
                    TableRow(children: [
                      Text(
                        'Personal Noun',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Conjugation",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Yo',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-o',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Tú/Usted',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-as\n-es',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Él/Ella',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-a\n-e',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Nosotros/Nosotras',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-amos\n-emos',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Vosotros/Vosotras',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-ais\n-eis',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Ustedes/Ellos/Ellas',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          '-an\n-en',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                  ],
                )),
          ],
        ))
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return UnitStructure(
        unitNumber: 3,
        unitTitle: "Unit 3 - My Daily Life",
        unitVocabularyTopics: unit3VocabularyTopics,
        unitGrammarTopics: unit3GrammarTopics,
        unitDialogue: unit3Dialogue,
        unitDialogueImage: '',
        unitVocabularyTips: unit3VocabularyTip,
        unitGrammarData: unit3GrammarData,
        unitBefore: Unit2(),
        unitAfter: Unit4());
  }
}
