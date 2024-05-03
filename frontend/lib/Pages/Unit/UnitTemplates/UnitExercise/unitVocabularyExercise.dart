import 'dart:math';
import 'package:flutter/material.dart';
import 'package:language/Models/words.dart';
import 'package:language/Services/wordService.dart';
import 'package:language/Utility/utils.dart';

class VocabularyExercise extends StatefulWidget {
  const VocabularyExercise({required this.unitNumber});

  final int unitNumber;

  @override
  State<VocabularyExercise> createState() => _VocabularyExerciseState();
}

class _VocabularyExerciseState extends State<VocabularyExercise> {
  String selectedLanguage = "Unselected";
  String dropDownGuide = "Select Language";
  bool areOriginalCharacters = false;
  var rnd = Random();
  bool result = false;
  TextEditingController answerController = TextEditingController();

  String renderAnswer(Word word, String language, bool version) {
    if (language == "Chinese") {
      if (version) {
        return word.chineseTranslation;
      } else {
        return word.chineseTranslationPinyin;
      }
    } else if (language == "German") {
      return word.germanTranslation;
    } else if (language == "Korean") {
      if (version) {
        return word.koreanTranslation;
      } else {
        return word.koreanTranslationRomanized;
      }
    } else {
      return word.spanishTranslation;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Word>>(
      future: getWordsForExercise(context, widget.unitNumber),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text(
              "Loading...",
              style: TextStyle(fontSize: 30),
            ),
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          int randomNumber = rnd.nextInt(snapshot.data!.length);
          Word word = snapshot.data![randomNumber];
          return Padding(
            padding: const EdgeInsets.only(top: 12.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Select a Language: "),
                    DropdownButton(
                      hint: Text(dropDownGuide),
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      items: [
                        DropdownMenuItem(
                            onTap: () {
                              setState(() {
                                selectedLanguage = "Chinese";
                              });
                            },
                            value: "Chinese",
                            child: const Text("Chinese")),
                        DropdownMenuItem(
                            onTap: () {
                              setState(() {
                                selectedLanguage = "German";
                              });
                            },
                            value: "German",
                            child: const Text("German")),
                        DropdownMenuItem(
                            onTap: () {
                              setState(() {
                                selectedLanguage = "Korean";
                              });
                            },
                            value: "Korean",
                            child: const Text("Korean")),
                        DropdownMenuItem(
                            onTap: () {
                              setState(() {
                                selectedLanguage = "Spanish";
                              });
                            },
                            value: "Spanish",
                            child: const Text("Spanish")),
                      ],
                      onChanged: (value) => setState(() {}),
                    )
                  ],
                ),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(fontSize: 20),
                        children: [
                      const TextSpan(text: "Selected Language: "),
                      TextSpan(
                          text: selectedLanguage,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white))
                    ])),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: (snapshot.connectionState == ConnectionState.waiting)
                      ? Text("Loading",
                          style: TextStyle(
                              color: (widget.unitNumber % 5 == 0 ||
                                      widget.unitNumber % 5 == 1)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 25))
                      : (selectedLanguage == "Unselected")
                          ? Text(
                              "Please select a language.",
                              style: TextStyle(
                                  color: (widget.unitNumber % 5 == 0 ||
                                          widget.unitNumber % 5 == 1)
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 25),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  word.name,
                                  style: TextStyle(
                                      color: (widget.unitNumber % 5 == 0 ||
                                              widget.unitNumber % 5 == 1)
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 25),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "Enter your answer:"),
                                      controller: answerController,
                                    ),
                                  ),
                                )
                              ],
                            ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: areOriginalCharacters,
                      onChanged: (value) {
                        setState(() {
                          areOriginalCharacters = !areOriginalCharacters;
                        });
                      },
                    ),
                    const Text("Answer are with original characters.")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromARGB(255, 67, 70, 75)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              randomNumber = rnd.nextInt(snapshot.data!.length);
                            });
                          },
                          icon: const Icon(
                            Icons.replay_outlined,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(width: 50),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {
                          if (answerController.text ==
                              renderAnswer(word, selectedLanguage,
                                  areOriginalCharacters)) {
                            showSnackBar(context, "Correct Answer!");
                          } else {
                            showSnackBar(context, "Wrong Answer!");
                          }
                        },
                        child: const Text("SUBMIT"))
                  ],
                )
              ],
            ),
          );
        }
      },
    );
  }
}
