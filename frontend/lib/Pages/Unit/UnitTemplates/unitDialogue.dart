import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:language/Models/sentence.dart';

class UnitDialogue extends StatefulWidget {
  const UnitDialogue(
      {required this.unitNumber,
      required this.dialogue,
      required this.dialogueImage});

  final int unitNumber;
  final List<Sentence> dialogue;
  final String dialogueImage;

  @override
  State<UnitDialogue> createState() => _UnitDialogueState();
}

class _UnitDialogueState extends State<UnitDialogue> {
  Color unitColor(int num) {
    Color backgroundColor;
    if (num % 5 == 1) {
      backgroundColor = const Color.fromARGB(255, 247, 134, 198);
    } else if (num % 5 == 2) {
      backgroundColor = const Color.fromARGB(255, 255, 253, 138);
    } else if (num % 5 == 3) {
      backgroundColor = const Color.fromARGB(255, 142, 238, 185);
    } else if (num % 5 == 4) {
      backgroundColor = const Color.fromARGB(255, 148, 245, 237);
    } else {
      backgroundColor = const Color.fromARGB(255, 195, 131, 231);
    }
    return backgroundColor;
  }

  String dialogueLanguage = 'Chinese';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(124, 255, 255, 255).withOpacity(0.15)),
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  DropdownButton(
                    hint: const Text("Select Language"),
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    items: [
                      DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              dialogueLanguage = 'Chinese';
                            });
                          },
                          value: dialogueLanguage,
                          child: const Text("Chinese")),
                      DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              dialogueLanguage = 'German';
                            });
                          },
                          value: dialogueLanguage,
                          child: const Text("German")),
                      DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              dialogueLanguage = 'Korean';
                            });
                          },
                          value: dialogueLanguage,
                          child: const Text("Korean")),
                      DropdownMenuItem(
                          onTap: () {
                            setState(() {
                              dialogueLanguage = 'Spanish';
                            });
                          },
                          value: dialogueLanguage,
                          child: const Text("Spanish")),
                    ],
                    onChanged: (value) => setState(() {
                      dialogueLanguage = value.toString();
                    }),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ListView.builder(
                        itemCount: widget.dialogue.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              sentenceTranslation(widget.dialogue[index]),
                              Text(
                                '${widget.dialogue[index].speaker}: ${widget.dialogue[index]}',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          );
                        },
                      ))
                ],
              )),
          SizedBox()
        ],
      ),
    ));
  }

  sentenceTranslation(Sentence sentence) {
    switch (dialogueLanguage) {
      case 'Chinese':
        return Column(
          children: [
            Text('${sentence.speaker}: ${sentence.chineseDialogue}'),
            Text('${sentence.speaker}: ${sentence.chinesePinyinDialogue}')
          ],
        );
      case 'German':
        return Text('${sentence.speaker}: ${sentence.germanDialogue}');
      case 'Korean':
        return Column(
          children: [
            Text('${sentence.speaker}: ${sentence.koreanDialogue}'),
            Text('${sentence.speaker}: ${sentence.koreanRomanizedDialogue}')
          ],
        );
      case 'Spanish':
        return Text('${sentence.speaker}: ${sentence.spanishDialogue}');
      default:
    }
  }
}
