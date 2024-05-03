import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:language/Models/sentence.dart';
import 'package:language/Pages/Unit/UnitTemplates/unitGrammar.dart';
import 'Unit1.dart';
import 'Unit3.dart';
import 'package:language/Pages/Unit/UnitTemplates/unitStructure.dart';

// ignore: must_be_immutable
class Unit2 extends StatelessWidget {
  Unit2();
  List<String> unit2VocabularyTopics = ["Countries", "Nationalities"];
  List<String> unit2GrammarTopics = [
    "Starting Conservation",
    "To Be + Sentence Structure"
  ];
  List<Sentence> unit2DialogueList = [];
  String unit2VocabularyTip = "";
  late List<Widget> unit2GrammarData = [
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit2GrammarTopics[0],
            grammarSubTitle: 'Common Phrases',
            grammarLanguage: 'Chinese'),
        Expanded(
            child: Container(
          alignment: Alignment.centerLeft,
          child: RichText(
              text: const TextSpan(style: TextStyle(fontSize: 28), children: [
            TextSpan(text: 'Welcome! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '欢迎!\n ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'How are you? : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '你好吗？\n ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Thank you! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '谢谢！\n ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: "I'm sorry. : ", style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '对不起。\n ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Good Bye! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '再见！\n ', style: TextStyle(fontWeight: FontWeight.bold))
          ])),
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit2GrammarTopics[0],
            grammarSubTitle: 'Common Phrases',
            grammarLanguage: 'German'),
        Expanded(
            child: Container(
          alignment: Alignment.centerLeft,
          child: RichText(
              text: const TextSpan(style: TextStyle(fontSize: 28), children: [
            TextSpan(text: 'Welcome! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: 'Wilkommen!\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'How are you? : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: 'Wie geht es dir?\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Thank you! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: 'Danke!\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: "I'm sorry. : ", style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: 'Tut mir leid.\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Good Bye! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: 'Auf Wiedersehen!\n ',
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit2GrammarTopics[0],
            grammarSubTitle: 'Common Phrases',
            grammarLanguage: 'Korean'),
        Expanded(
            child: Container(
          alignment: Alignment.centerLeft,
          child: RichText(
              text: const TextSpan(style: TextStyle(fontSize: 28), children: [
            TextSpan(text: 'Welcome! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '안녕하세요!\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'How are you? : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '잘 지내셨어요? / 어떻게 지내셨어요?\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Thank you! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '감사합니다!\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: "I'm sorry. : ", style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '죄송합니다. / 미안합니다.\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Good Bye! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '안녕히 겨세요! / 안녕히 가세요!\n ',
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
        )),
        const Text(
          "There isn't a direct translation of 'How are you?' in Korean, instead there are many derivations of this sentence, mostly use are 'Have you been well?' and 'How have you been?'.",
          style: TextStyle(fontSize: 17.5),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit2GrammarTopics[0],
            grammarSubTitle: 'Common Phrases',
            grammarLanguage: 'Spanish'),
        Expanded(
            child: Container(
          alignment: Alignment.centerLeft,
          child: RichText(
              text: const TextSpan(style: TextStyle(fontSize: 28), children: [
            TextSpan(text: 'Welcome! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '¡Bienvenido!(male) / ¡Bienvenida!(female)\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'How are you? : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '¿Cómo estás?\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Thank you! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '¡Gracias!\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: "I'm sorry. : ", style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: 'Lo siento.\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Good Bye! : ', style: TextStyle(color: Colors.grey)),
            TextSpan(
                text: '¡Adiós!\n ',
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit2GrammarTopics[1],
            grammarSubTitle: 'Sentence Structures',
            grammarLanguage: ''),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "CHINESE :Subject + Verb + Object/More Nouns/More Verbs\nGERMAN :Subject + Verb + Object/More Nouns/More Verbs\nSPANISH :Subject + Verb + Object/More Nouns/More Verbs",
                  style: TextStyle(fontSize: 25),
                )),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "KOREAN :Subject + Object/More Nouns/More Verbs + Verb",
                  style: TextStyle(fontSize: 25),
                )),
            const Text(
                "• In German, the verb is always at SECOND order, but some other nouns can be at first order.",
                style: TextStyle(fontSize: 25)),
            RichText(
                text: const TextSpan(style: TextStyle(fontSize: 18), children: [
              TextSpan(
                  text: "A Nice Tip: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "Time adverbs have priority.")
            ])),
            const SizedBox(height: 10),
            const Text("• In Spanish, subjects can be omitted.",
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
            grammarTitle: unit2GrammarTopics[1],
            grammarSubTitle: 'To Be',
            grammarLanguage: 'Chinese'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("是 is used in Chinese to tell who or what it is.",
                style: TextStyle(fontSize: 40)),
            SizedBox(height: 15),
            Text("Examples: ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Text("• 我是学生。", style: TextStyle(fontSize: 25)),
            Text("• 她是老板。", style: TextStyle(fontSize: 25)),
            Text("• 我们是医生。", style: TextStyle(fontSize: 25)),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit2GrammarTopics[1],
            grammarSubTitle: 'To Be',
            grammarLanguage: 'German'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "sein is the infinitive form of 'to be'.\nThis is the table of its conjugation:",
                style: TextStyle(fontSize: 25)),
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
                        "'sein' Conjugation",
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
                          'bin',
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
                          'bist',
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
                          'ist',
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
                          'sind',
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
                          'seid',
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
                          'sind',
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
            grammarTitle: unit2GrammarTopics[1],
            grammarSubTitle: 'To Be',
            grammarLanguage: 'Korean'),
        const Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("이다 is used in Korean to tell who or what it is.",
                style: TextStyle(fontSize: 40)),
            SizedBox(height: 15),
            Text("Examples: ",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Text("• 저는 학생입니다.", style: TextStyle(fontSize: 25)),
            Text("• 선생님은 한국 사람입니다.", style: TextStyle(fontSize: 25)),
            Text("• 그는 의사입니다.", style: TextStyle(fontSize: 25)),
            Text(
                "The conjugation of 이다 and other verbs will be introduced in next unit.",
                style: TextStyle(fontSize: 35)),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit2GrammarTopics[1],
            grammarSubTitle: 'To Be',
            grammarLanguage: 'German'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "ser is the infinitive form of 'to be'.\nThis is the table of its conjugation:",
                style: TextStyle(fontSize: 25)),
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
                        "'ser' Conjugation",
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
                          'soy',
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
                          'eres',
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
                          'es',
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
                          'somos',
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
                          'sois',
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
                          'son',
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
            grammarTitle: unit2GrammarTopics[1],
            grammarSubTitle: 'To Be',
            grammarLanguage: 'German'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: const TextSpan(style: TextStyle(fontSize: 25), children: [
              TextSpan(
                  text:
                      "estar can also be used to tell attributes. However, estar is used to tell temporary "),
              TextSpan(
                  text: "temporary",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " attributes as ser is used to tell "),
              TextSpan(
                  text: "permanent",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: " attributes.\nThis is the table of its conjugation:")
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
                        "'estar' Conjugation",
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
                          'estoy',
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
                          'estás',
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
                          'está',
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
                          'estamos',
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
                          'estáis',
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
                          'están',
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
    )
  ];

  @override
  Widget build(BuildContext context) {
    return UnitStructure(
        unitNumber: 2,
        unitTitle: "Unit 2 - Identity",
        unitVocabularyTopics: unit2VocabularyTopics,
        unitGrammarTopics: unit2GrammarTopics,
        unitDialogue: unit2DialogueList,
        unitDialogueImage: '',
        unitVocabularyTips: unit2VocabularyTip,
        unitGrammarData: unit2GrammarData,
        unitBefore: Unit1(),
        unitAfter: Unit3());
  }
}
