import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:language/Authentication/login.dart';
import 'package:language/Authentication/signUp.dart';
import 'package:language/Pages/OtherPages/navBarContent.dart';
import 'package:language/Services/accountService.dart';
import 'package:language/Services/pageService.dart';
import 'package:language/Services/wordService.dart';
import 'package:language/Utility/tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/words.dart';

class UnitVocabulary extends StatefulWidget {
  UnitVocabulary(this.unit, this.wordsCategories, this.vocabularyTip);

  final int unit;
  final List<String> wordsCategories;
  final String vocabularyTip;

  static bool activeWordOption = false;

  static String translation = "";

  @override
  State<UnitVocabulary> createState() => _UnitVocabularyState();
}

class _UnitVocabularyState extends State<UnitVocabulary> {
  int i = 0;
  int part = 1;
  int selectedWordList = 0;

  displayTips(String t) {
    if (t != "") {
      return VocabularyTip(t);
    } else {
      return Container(
        color: Colors.transparent,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    IconColor(int unit) {
      Color? iconolor;
      if (unit % 5 == 1) {
        iconolor = Color.fromARGB(255, 146, 4, 51);
      } else if (unit % 5 == 2) {
        iconolor = Color.fromARGB(255, 212, 152, 41);
      } else if (unit % 5 == 3) {
        iconolor = Colors.cyan;
      } else if (unit % 5 == 4) {
        iconolor = Color.fromARGB(223, 84, 171, 230);
      } else {
        iconolor = Color.fromARGB(200, 164, 94, 192);
      }
      return iconolor;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: RadioListTile(
                  value: 0,
                  groupValue: selectedWordList,
                  onChanged: (value) {
                    setState(() {
                      i = 0;
                      selectedWordList = 0;
                      //widget.activeWordList = widget.wordList1;
                      part = 1;
                      UnitVocabulary.translation = "";
                      VocabularyCardState.selectedLanguage = "";
                      VocabularyCardState.dropDownGuide = 'Select Language';
                    });
                  },
                  title: Text(widget.wordsCategories[0])),
            ),
            Expanded(
                child: RadioListTile(
                    value: 1,
                    groupValue: selectedWordList,
                    onChanged: (value) {
                      setState(() {
                        i = 0;
                        selectedWordList = 1;
                        //widget.activeWordList = widget.wordList2;
                        part = 2;
                        UnitVocabulary.translation = "";
                        VocabularyCardState.selectedLanguage = "";
                        VocabularyCardState.dropDownGuide = 'Select Language';
                      });
                    },
                    title: Text(widget.wordsCategories[1])))
          ],
        ),
        //VocabularyCard(widget.activeWordList[i]!),
        FutureBuilder<List<Word>>(
          future: getWords(context, widget.unit, part),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: Text("Loading...",
                        style: TextStyle(
                            color:
                                (widget.unit % 5 == 0 || widget.unit % 5 == 1)
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 27)),
                  ));
            } else if (snapshot.hasError) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      color:
                          Color.fromARGB(93, 255, 255, 255).withOpacity(0.2)),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: IconColor(widget.unit),
                        size: 40,
                      ),
                      const Text(
                        "Words of this unit will be added later.",
                        style: TextStyle(fontSize: 27),
                      )
                    ],
                  ));
            } else {
              //FutureBuilder<List<Word>> is necessary instead of FutureBuilder to avoid the error about [] operator
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 67, 70, 75),
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (i != 0) {
                            i--;
                          } else {
                            i = snapshot.data!.length - 1;
                          }
                          UnitVocabulary.translation = "";
                          VocabularyCardState.selectedLanguage = '';
                          VocabularyCardState.dropDownGuide = 'Select Language';
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  VocabularyCard(snapshot.data![i]),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 67, 70, 75),
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (i != (snapshot.data!.length - 1)) {
                            i++;
                          } else {
                            i = 0;
                          }
                          UnitVocabulary.translation = "";
                          VocabularyCardState.selectedLanguage = '';
                          VocabularyCardState.dropDownGuide = 'Select Language';
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        displayTips(widget.vocabularyTip)
      ],
    );
  }
}

class VocabularyCard extends StatefulWidget {
  VocabularyCard(this.word);
  final Word word;

  @override
  VocabularyCardState createState() => new VocabularyCardState();
}

class VocabularyCardState extends State<VocabularyCard> {
  static String selectedLanguage = '';
  static String dropDownGuide = 'Select Language';
  bool isLogin = false;
  String username = "";
  List<String>? favorites = [];

  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  void getLoginData() async {
    SharedPreferences loginPreferences = await SharedPreferences.getInstance();
    if (loginPreferences.containsKey("username")) {
      setState(() {
        isLogin = true;
        username = loginPreferences.getString("username")!;
        favorites = loginPreferences.getStringList("favorites");
      });
    } else {
      setState(() {
        isLogin = false;
      });
    }
  }

  Widget CardTranslation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.word.name, style: const TextStyle(fontSize: 40)),
        SizedBox(
          height: MediaQuery.of(context).size.height / 25,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(UnitVocabulary.translation,
              style: const TextStyle(fontSize: 54.5)),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: DropdownButton(
            hint: Text(dropDownGuide),
            icon: const Icon(Icons.arrow_drop_down_outlined),
            items: [
              DropdownMenuItem(
                  onTap: () {
                    setState(() {
                      dropDownGuide = 'Chinese';
                      selectedLanguage = 'Chinese';
                    });
                  },
                  value:
                      '${widget.word.chineseTranslation}\n${widget.word.chineseTranslationPinyin}',
                  child: const Text("Chinese")),
              DropdownMenuItem(
                  onTap: () {
                    setState(() {
                      dropDownGuide = 'German';
                      selectedLanguage = 'German';
                    });
                  },
                  value: widget.word.germanTranslation,
                  child: const Text("German")),
              DropdownMenuItem(
                  onTap: () {
                    setState(() {
                      dropDownGuide = 'Korean';
                      selectedLanguage = 'Korean';
                    });
                  },
                  value:
                      '${widget.word.koreanTranslation}\n${widget.word.koreanTranslationRomanized}',
                  child: const Text("Korean")),
              DropdownMenuItem(
                  onTap: () {
                    setState(() {
                      dropDownGuide = 'Spanish';
                      selectedLanguage = 'Spanish';
                    });
                  },
                  value: widget.word.spanishTranslation,
                  child: const Text("Spanish")),
            ],
            onChanged: (value) => setState(() {
              UnitVocabulary.translation = value.toString();
            }),
          ),
        ),
      ],
    );
  }

  Widget cardStructure(String link) {
    if (link == "") {
      return CardTranslation();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            link,
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width * 0.36,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),
          CardTranslation()
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 247, 247, 247),
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.73,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardStructure(widget.word.image!),
            Container(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TTSButton(language: selectedLanguage, word: widget.word),
                    IconButton(
                        onPressed: (() {
                          if (isLogin) {
                            if (favorites!.contains(widget.word.name)) {
                              removeFavorite(username, widget.word.name);
                              setState(() {
                                favorites!.remove(widget.word.name);
                              });
                            } else {
                              addFavorite(username, widget.word);
                              setState(() {
                                favorites!.add(widget.word.name);
                              });
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                  const TextSpan(
                                      text:
                                          "This action is availible for learners with an account.\nClick "),
                                  TextSpan(
                                      text: "here",
                                      style: const TextStyle(
                                          color: Colors.blueAccent),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LogInPage(),
                                              ));
                                          setCurrentPage("Login");
                                        }),
                                  const TextSpan(
                                      text:
                                          " to login.\nIf you don't have any account, click "),
                                  TextSpan(
                                      text: "here",
                                      style: const TextStyle(
                                          color: Colors.blueAccent),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpPage(),
                                              ));
                                          setCurrentPage("Register");
                                        }),
                                  const TextSpan(text: " to register."),
                                ])),
                              ),
                            );
                          }
                        }),
                        icon: Icon(
                          (favorites!.contains(widget.word.name))
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red[800],
                        )),
                  ],
                ))
          ],
        ));
  }
}

class VocabularyTip extends StatelessWidget {
  const VocabularyTip(this.tip);

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 100,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 45, 46, 49),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: const Text(
            "Tip",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            tip,
            style: const TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }
}
