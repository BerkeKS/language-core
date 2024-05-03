import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../Models/sentence.dart';
import 'Unit0.dart';
import 'Unit2.dart';
import 'package:language/Pages/Unit/UnitTemplates/UnitStructure.dart';
import 'package:language/Pages/Unit/UnitTemplates/UnitGrammar.dart';

// ignore: must_be_immutable
class Unit1 extends StatelessWidget {
  Unit1();
  List<String> unit1VocabularyTopics = ["Singular Personal Pronouns", "Jobs"];
  List<String> unit1GrammarTopics = ["Personal Pronouns", "Noun Genders"];
  List<Sentence> unit1Dialogue = [];
  String unit1VocabularyTip =
      "In formal and spoken language of Korean, some words like 선생 and 사장 are used in the form of 선생님 and 사장님. In other words, these words get the formal 님 mark.";
  late List<Widget> unit1GrammarData = [
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'Singular Personal Pronouns',
            grammarLanguage: 'Chinese'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Here is the singular personal pronouns in Chinese:",
              style: TextStyle(fontSize: 22.5),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  border: TableBorder.all(
                    width: 1.5,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text(
                              "English",
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            )),
                        Text(
                          "Chinese\nCharacter",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Chinese\nPinyin",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "I",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "我",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "wǒ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "You",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "你",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "nǐ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "You(Formal)",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "您",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "nín",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "He",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "他",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "tā",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "She",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "她",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "tā",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "It",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "它",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "tā",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'Plural Personal Pronouns',
            grammarLanguage: 'Chinese'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('These are the plural personal pronouns in Chinese:',
                style: TextStyle(fontSize: 22.5)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  border: TableBorder.all(
                    width: 1.5,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text(
                              "English",
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            )),
                        Text(
                          "Chinese\nCharacter",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Chinese\nPinyin",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "We(Exclusive)",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "我们",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "wǒmen",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "We(Inclusive)",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "咱们",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "zánmen",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "You(Plural)",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "你们",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "nǐmen",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text(
                              "They",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            )),
                        Text(
                          "他们\n她们\n它们",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text(
                              "tāmen",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ))
                      ],
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.warning_amber_rounded, size: 40),
                Text(
                    '们 (men) indicates plurality in Simplified Chinese Characters,\n們 does in Traditional Chinese Characters.',
                    style: TextStyle(fontSize: 25))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.warning_amber_rounded, size: 40),
                Text(
                    '咱们 is only used as a subject, and it is inclusive(It only refers I and you).\nIt is not used outside Beijing.',
                    style: TextStyle(fontSize: 25))
              ],
            )
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'How To Use Personal Pronouns?',
            grammarLanguage: 'Chinese'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
                'Chinese personal pronouns can be used as object pronouns directly.',
                style: TextStyle(fontSize: 28)),
            Text('Examples:',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'Personal Pronouns',
            grammarLanguage: 'German'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Here is the personal pronouns in German:",
              style: TextStyle(fontSize: 22.5),
            ),
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
                        'English',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'German',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'I',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Ich',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'You(Singular - Informal)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Du',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'He',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Er',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'She',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Sie',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'It',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Es',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'We',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Wir',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'You(Plural)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Ihr',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'They',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Sie',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'You(Singular - Formal)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          'Sie',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.warning_amber_rounded, size: 40),
                Text(
                    '"Sie" as the second formal singular personal pronouns are always written with its capitalized first letter.',
                    style: TextStyle(fontSize: 25))
              ],
            ),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'Singular Personal Pronouns',
            grammarLanguage: 'Korean'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                'Korean has multiple personal pronouns regarding to addressed person. The age, familiarity and job of that person play role on how it should be addressed\nTherefore, there are multiple versions of personal pronouns, especially the singular ones.',
                style: TextStyle(fontSize: 25),
              ),
            ),
            const Text('I - First Personal Pronouns',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const Text('• Formal: 저 (jeo)', style: TextStyle(fontSize: 21)),
            const Text('• Informal: 나(na)', style: TextStyle(fontSize: 21)),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: "Singular Personal Pronouns - You (Part 1)",
            grammarLanguage: 'Korean'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                '"You" can be directly translated to Korean four ways, two for both formal and informal ways:',
                style: TextStyle(fontSize: 25)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  border: TableBorder.all(
                      width: 1.5,
                      color: Colors.black,
                      style: BorderStyle.solid),
                  children: const [
                    TableRow(children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text(
                            'English',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          )),
                      Text(
                        'Korean\nHangeul',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Korean\nRomanization',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      )
                    ]),
                    TableRow(children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text(
                            'You(Formal)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )),
                      Text(
                        '당신\n그대',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'dangsin\ngeudae',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text(
                            'You(Informal)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )),
                      Text(
                        '너\n그쪽',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'neo\ngeujjog',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ])
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.warning_amber_rounded, size: 40),
                Text(
                    '그대 (geudae) is not widely used now, but it can be seen in songs and poems.',
                    style: TextStyle(fontSize: 25))
              ],
            ),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'Singular Personal Pronouns - You (Part 2)',
            grammarLanguage: 'Korean'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'In Korean, there are several more ways to address to person in front of you:',
                style: TextStyle(fontSize: 25)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Table(
                border: TableBorder.all(
                    width: 1.5, color: Colors.black, style: BorderStyle.solid),
                children: const [
                  TableRow(children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text(
                          'English',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        )),
                    Text(
                      'Korean\nHangeul',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Korean\nRomanization',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    )
                  ]),
                  TableRow(children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text(
                          'You(Formal)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )),
                    Text(
                      '님\n씨\n군\n양',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'nim\nssi\ngun\nyang',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text(
                          'You(Informal)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )),
                    Text(
                      '아저씨(Male)\n아줌마(Female)\n젊은이(Young male)\n청년(Young male)\n아가씨(Young female)',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'ajeossi\najumma\njeolmeuni\ncheongnyeon\nagassi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ])
                ],
              ),
            ),
            const Text(
                '님 (nim), 씨 (ssi) 군 (gun), 양(yang) are used as particles to denote formality.\nYou can check the vocabulary tip of this unit for example.',
                style: TextStyle(fontSize: 25))
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'Singular Personal Pronouns - He/She/It',
            grammarLanguage: 'Korean'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Korean third personal pronouns can be used regardless the gender of the person you are talking with.\nHowever, you still need to be careful about the formality.',
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Table(
                border: TableBorder.all(color: Colors.black, width: 1.5),
                children: const [
                  TableRow(children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text(
                          'English',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        )),
                    Text(
                      'Korean\nHangeul',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Korean\nRomanization',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    )
                  ]),
                  TableRow(
                    children: [
                      Text('He\nShe(Formal)\nIt',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text('그분',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text('geubun',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('He\nShe(Informal)\nIt',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('그 사람\n그\n그녀',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('geu saram\ngeu\ngeunyeo',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                    ],
                  )
                ],
              ),
            )
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'Plural Personal Pronouns',
            grammarLanguage: 'Korean'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  border: TableBorder.all(
                      color: Colors.black,
                      width: 1.5,
                      style: BorderStyle.solid),
                  children: const [
                    TableRow(children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text(
                            'English',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          )),
                      Text(
                        'Korean\nHangeul',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Korean\nRomanization',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      )
                    ]),
                    TableRow(children: [
                      Text('We(Formal)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('저희',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('jeohui',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                    ]),
                    TableRow(children: [
                      Text('We(Informal)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('우리',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('uri',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                    ]),
                    TableRow(children: [
                      Text('You(Formal)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('여러분',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('yeoreobun',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                    ]),
                    TableRow(children: [
                      Text('You(Informal)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('너희',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('neohui',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                    ]),
                    TableRow(children: [
                      Text('They(Formal)',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('그분들',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('geubundeul',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                    ]),
                    TableRow(children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text('They(Formal)',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Text('그 사람들\n그들\n그녀들',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                      Text('geu saramdeul\ngeudeul\ngeunyeondeul',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20)),
                    ]),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.warning_amber_rounded, size: 40),
                Text(
                    'Singular personal pronouns can be pluralized by getting 들 (deul) particle.\nMore details of this particle will be introduced in later units.',
                    style: TextStyle(fontSize: 25))
              ],
            ),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'How To Use Personal Pronouns?',
            grammarLanguage: 'Korean'),
        const Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'As in Chinese,  personal pronouns can be used as object pronouns in Korean as well.\nHowever, there are particles used to denote these pronouns. They will be introduced in later units.',
                style: TextStyle(fontSize: 18)),
            Text('Examples:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[0],
            grammarSubTitle: 'Personal Pronouns',
            grammarLanguage: 'Spanish'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('This is the table of all personal pronouns in Spanish:',
                style: TextStyle(fontSize: 20)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  border: TableBorder.all(color: Colors.black, width: 1.5),
                  children: const [
                    TableRow(children: [
                      Text('English',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                      Text('Spanish',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('I',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Yo',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('You(Informal)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Tú',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('You(Formal)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Usted',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('He',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Él',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('She',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Ella',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Text('We(Male)',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Nosotros',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('We(Female)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Nosotras',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('You(Plural - Informal - Male)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Vosotros',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('You(Plural - Informal - Female',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Vosotras',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('You(Plural -Formal)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Text('Ustedes',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20)))
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('They(Male)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text('Ellos',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Text('They(Female)',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Text('Ellas',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20)))
                    ]),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.warning_amber_rounded, size: 40),
                Text(
                    'It is common that there are not any personal pronouns in a Spanish sentence.\nThe pronoun can be understood from verb conjugation.',
                    style: TextStyle(fontSize: 20))
              ],
            ),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[1],
            grammarSubTitle: 'Name Genders - Part 1',
            grammarLanguage: 'German'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(style: TextStyle(fontSize: 23), children: [
                TextSpan(
                    text: 'There are three gender types a noun can have, '),
                TextSpan(
                    text: 'masculine',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ', '),
                TextSpan(
                    text: 'feminine',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ', and '),
                TextSpan(
                    text: 'neutral',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        '.\nRemember the things before the nouns?\nThese are called '),
                TextSpan(
                    text: 'articles',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        ' and the use of the article in a sentence depends on the '),
                TextSpan(
                    text: 'gender',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' of that noun and the '),
                TextSpan(
                    text: 'case',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '.'),
              ]),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Table(
                  border: TableBorder.all(color: Colors.black, width: 1.5),
                  children: const [
                    TableRow(children: [
                      Text('Case',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                      Text('Masculine(der)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                      Text('Feminine(der)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                      Text('Neutral(der)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                      Text('Plural',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold)),
                    ]),
                    TableRow(children: [
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('Nominativ',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'der',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('die',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('das',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('die',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20)))
                    ]),
                    TableRow(children: [
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('Akkusativ',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('den',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('die',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('das',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('die',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20)))
                    ]),
                    TableRow(children: [
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('Dativ',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('dem',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('der',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('dem',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('den',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20)))
                    ]),
                    TableRow(children: [
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('Genitiv',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('des',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('der',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('des',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.all(7),
                          child: Text('der',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20))),
                    ])
                  ],
                )),
            const Text(
              'These cases will be explained in more detail in later units.',
              style: TextStyle(fontSize: 25),
            )
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[1],
            grammarSubTitle: 'Name Genders - Part 2',
            grammarLanguage: 'German'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: const TextSpan(style: TextStyle(fontSize: 25), children: [
              TextSpan(
                  text: 'The nouns can be expressed as object pronouns with, '),
              TextSpan(
                  text: 'er', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ', '),
              TextSpan(
                  text: 'sie', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ', and '),
              TextSpan(
                  text: 'es', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      ', dependin on the gender of that noun.\nIn other words, "er", "sie" and "es" are not only to express people.'),
            ])),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.warning_amber_rounded, size: 40),
                Text(
                    'The articles in a sentence are used as "the" in German.\nIn other words, they are definite articles.\nTo express "a/an", the following indefinite articles are used: \n•ein\n•eine\nRemember that the use of indefinite articles depends on the gender and case as well.',
                    style: TextStyle(fontSize: 25))
              ],
            ),
          ],
        ))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GrammarTitles(
            grammarTitle: unit1GrammarTopics[1],
            grammarSubTitle: 'Name Genders',
            grammarLanguage: 'Spanish'),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Spanish names have genders, as German ones.",
              style: TextStyle(fontSize: 23),
            ),
            RichText(
              text: const TextSpan(style: TextStyle(fontSize: 23), children: [
                TextSpan(
                    text:
                        'However, there are only two gender types a noun can have, '),
                TextSpan(
                    text: 'masculine',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ', and '),
                TextSpan(
                    text: 'feminine',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        '.\nThe spelling of the name defines its gender.\nIf last letter of a word is '),
                TextSpan(
                    text: 'a', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: " then it is a "),
                TextSpan(
                    text: 'feminine',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: " name. Be careful about the exceptions!"),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Examples: ",
                    style: TextStyle(color: Colors.red[700], fontSize: 23),
                  ),
                  const Text('• el jefe', style: TextStyle(fontSize: 21)),
                  const Text('• el abuelo', style: TextStyle(fontSize: 21)),
                  const Text('• la casa', style: TextStyle(fontSize: 21)),
                  const Text('• la serpiente (! - EXCEPTION)',
                      style: TextStyle(fontSize: 21)),
                ],
              ),
            )
          ],
        ))
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return UnitStructure(
        unitNumber: 1,
        unitTitle: "Unit 1 - First Meet",
        unitVocabularyTopics: unit1VocabularyTopics,
        unitGrammarTopics: unit1GrammarTopics,
        unitDialogue: unit1Dialogue,
        unitDialogueImage: '',
        unitVocabularyTips: unit1VocabularyTip,
        unitGrammarData: unit1GrammarData,
        unitBefore: Unit0(),
        unitAfter: Unit2());
  }
}
