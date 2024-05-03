import 'package:flutter/material.dart';
import 'package:language/Models/sentence.dart';

import 'package:language/Pages/OtherPages/navBar.dart';
import 'package:language/Pages/OtherPages/navBarContent.dart';
import 'package:language/Pages/Unit/UnitTemplates/unitVocabulary.dart';
import 'UnitExercise/unitExercise.dart';
import 'unitIntroduction.dart';
import 'unitDialogue.dart';
import 'unitGrammar.dart';

class UnitStructure extends StatefulWidget {
  UnitStructure(
      {required this.unitNumber,
      required this.unitTitle,
      required this.unitVocabularyTopics,
      required this.unitGrammarTopics,
      required this.unitDialogue,
      required this.unitDialogueImage,
      required this.unitVocabularyTips,
      required this.unitGrammarData,
      required this.unitBefore,
      required this.unitAfter});

  final int unitNumber;
  final String unitTitle;
  final List<String> unitVocabularyTopics;
  final List<String> unitGrammarTopics;
  final List<Sentence> unitDialogue;
  final String unitDialogueImage;
  final String unitVocabularyTips;
  final List<Widget> unitGrammarData;
  final Widget unitBefore;
  final Widget unitAfter;

  static int unitPart = 0;

  /*
  Put in UnitStructure to use in other dart programs like NavBarContent
  Made static int not to get 'instance members can't be accessed from a static method error
  CAUTION: When you add static, you have to use UnitStructure.selectedIndex instead of widget.selectedIndex
  Removed "_" part at the beginning of the variable otherwise it can't be accessed from the other dart programs because it'll be a private setter
  */

  @override
  UnitStructureState createState() =>
      new UnitStructureState(unitTitle, unitDialogue, unitNumber);
}

class UnitStructureState extends State<UnitStructure> {
  UnitStructureState(this.unitTitle, this.unitDialogue, this.unitNumber);

  final String unitTitle;
  final List<Sentence> unitDialogue;
  final int unitNumber;

  colorChange(int unit) {
    Color? beginColor, endColor;
    if (unit % 5 == 1) {
      beginColor = Colors.purple;
      endColor = Colors.red;
    } else if (unit % 5 == 2) {
      beginColor = Colors.orange;
      endColor = Colors.yellow;
    } else if (unit % 5 == 3) {
      beginColor = Colors.blue;
      endColor = Colors.green;
    } else if (unit % 5 == 4) {
      beginColor = Colors.cyan;
      endColor = Colors.white;
    } else {
      beginColor = Color(0xff4338CA);
      endColor = Color(0xff6D28D9);
    }
    List<Color> colorBE = [beginColor, endColor];
    return colorBE;
  }

  late List<Color> beginEnd = colorChange(unitNumber);

  ButtonColor(int unit) {
    Color? b_color;
    if (unit % 5 == 1) {
      b_color = Color.fromARGB(255, 146, 4, 51);
    } else if (unit % 5 == 2) {
      b_color = Color.fromARGB(255, 212, 152, 41);
    } else if (unit % 5 == 3) {
      b_color = Colors.cyan;
    } else if (unit % 5 == 4) {
      b_color = Color.fromARGB(223, 84, 171, 230);
    } else {
      b_color = Color.fromARGB(200, 164, 94, 192);
    }
    return b_color;
  }

  MenuButtonColor(int num) {
    if (num % 5 == 0 || num % 5 == 1) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        body: Builder(
            builder: (context) => Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    beginEnd[0],
                    beginEnd[1],
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => Scaffold.of(context).openDrawer(),
                            icon: const Icon(Icons.menu),
                            color: MenuButtonColor(widget.unitNumber),
                          ),
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width *
                                (1325 / 1366),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                UnitSectionButton(
                                  unithover: widget.unitNumber,
                                  color: ButtonColor(widget.unitNumber),
                                  text: "INTRODUCTION",
                                  active: UnitStructure.unitPart == 0,
                                  clicked: () {
                                    setState(() {
                                      UnitStructure.unitPart = 0;
                                    });
                                  },
                                ),
                                UnitSectionButton(
                                  unithover: widget.unitNumber,
                                  color: ButtonColor(widget.unitNumber),
                                  text: "DIALOGUE",
                                  active: UnitStructure.unitPart == 1,
                                  clicked: () {
                                    setState(() {
                                      UnitStructure.unitPart = 1;
                                    });
                                  },
                                ),
                                UnitSectionButton(
                                  unithover: widget.unitNumber,
                                  color: ButtonColor(widget.unitNumber),
                                  text: "VOCABULARY",
                                  active: UnitStructure.unitPart == 2,
                                  clicked: () {
                                    setState(() {
                                      UnitStructure.unitPart = 2;
                                      UnitVocabulary.translation = '';
                                      VocabularyCardState.selectedLanguage = "";
                                      VocabularyCardState.dropDownGuide =
                                          'Select Language';
                                    });
                                  },
                                ),
                                UnitSectionButton(
                                  unithover: widget.unitNumber,
                                  color: ButtonColor(widget.unitNumber),
                                  text: "GRAMMAR",
                                  active: UnitStructure.unitPart == 3,
                                  clicked: () {
                                    setState(() {
                                      UnitStructure.unitPart = 3;
                                    });
                                  },
                                ),
                                UnitSectionButton(
                                  unithover: widget.unitNumber,
                                  color: ButtonColor(widget.unitNumber),
                                  text: "EXERCISE",
                                  active: UnitStructure.unitPart == 4,
                                  clicked: () {
                                    setState(() {
                                      UnitStructure.unitPart = 4;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UnitContent(
                            widget.unitNumber,
                            widget.unitTitle,
                            widget.unitVocabularyTopics,
                            widget.unitGrammarTopics,
                            widget.unitDialogue,
                            widget.unitDialogueImage,
                            widget.unitVocabularyTips,
                            widget.unitGrammarData,
                          ),
                          const SizedBox(height: 5),
                          UnitAccesser(widget.unitNumber, widget.unitBefore,
                              widget.unitAfter),
                        ],
                      )
                    ]))));
  }
}

class UnitContent extends StatefulWidget {
  const UnitContent(this.un, this.tit, this.vto, this.gto, this.dL, this.dI,
      this.v_tip, this.gd);

  final int un;
  final String tit;
  final List<String> vto;
  final List<String> gto;
  final List<Sentence> dL;
  final String dI;
  final String v_tip;
  final List<Widget> gd;

  @override
  State<UnitContent> createState() => _UnitContentState();
}

class _UnitContentState extends State<UnitContent> {
  late final ContentScreen;

  @override
  void initState() {
    super.initState();
    ContentScreen = [
      UnitIntroduction(widget.un, widget.tit, widget.vto, widget.gto),
      UnitDialogue(
        unitNumber: widget.un,
        dialogue: widget.dL,
        dialogueImage: widget.dI,
      ),
      UnitVocabulary(widget.un, widget.vto, widget.v_tip),
      UnitGrammar(widget.un, widget.gd),
      UnitExercise(widget.un)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.88,
              child: ContentScreen[UnitStructure.unitPart])
        ]);
  }
}

class UnitSectionButton extends StatefulWidget {
  const UnitSectionButton(
      {required this.active,
      required this.clicked,
      required this.text,
      required this.color,
      required this.unithover});

  final bool active;
  final Function clicked;
  final String text;
  final Color color;
  final int unithover;

  @override
  State<UnitSectionButton> createState() => _UnitSectionButtonState();
}

class _UnitSectionButtonState extends State<UnitSectionButton> {
  HoverColor(num) {
    Color? h_color;
    if (num % 5 == 1) {
      h_color = const Color.fromARGB(255, 209, 35, 93);
    } else if (num % 5 == 2) {
      h_color = const Color.fromARGB(255, 240, 187, 89);
    } else if (num % 5 == 3) {
      h_color = const Color.fromARGB(255, 96, 216, 231);
    } else if (num % 5 == 4) {
      h_color = const Color.fromARGB(223, 156, 204, 236);
    } else {
      h_color = const Color.fromARGB(199, 208, 158, 228);
    }
    return h_color;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (265 / 1366),
      child: Material(
        color: widget.active ? widget.color : Colors.transparent,
        child: InkWell(
          onTap: () {
            widget.clicked();
          },
          splashColor: widget.color,
          hoverColor: HoverColor(widget.unithover),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3),
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.active ? Colors.white : widget.color,
                  fontWeight:
                      widget.active ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}

class UnitAccesser extends StatefulWidget {
  const UnitAccesser(this.UnitNum, this.UnitBefore, this.UnitAfter);

  final int UnitNum;
  final Widget UnitBefore;
  final Widget UnitAfter;

  @override
  State<UnitAccesser> createState() => _UnitAccesserState();
}

class _UnitAccesserState extends State<UnitAccesser> {
  TextScript(int num) {
    if (num % 5 == 4) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, //Put the children intro two opposite sides
          children: [
            Row(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black,
                ),
                child: IconButton(
                    onPressed: (() {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => widget.UnitBefore));
                        NavBarContentState.activePage--;
                        UnitStructure.unitPart = 0;
                        VocabularyCardState.selectedLanguage = '';
                      });
                    }),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white)),
              ),
              const SizedBox(width: 20),
              const Text(
                "Go to Previous Unit",
                style: TextStyle(color: Colors.white),
              )
            ]),
            Row(
              children: [
                Text(
                  "Go to Next Unit",
                  style: TextStyle(color: TextScript(widget.UnitNum)),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                  child: IconButton(
                      onPressed: (() {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => widget.UnitAfter));
                          NavBarContentState.activePage++;
                          UnitStructure.unitPart = 0;
                          VocabularyCardState.selectedLanguage = '';
                        });
                      }),
                      icon: const Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.white)),
                ),
              ],
            )
          ]),
    );
  }
}
