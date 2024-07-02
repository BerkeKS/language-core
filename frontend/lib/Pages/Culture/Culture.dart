import 'package:flutter/material.dart';
import 'package:language/Pages/OtherPages/navBar.dart';

class CulturePage extends StatefulWidget {
  const CulturePage({required this.pageNumber});

  final int pageNumber;

  @override
  State<CulturePage> createState() => _CulturePageState();
}

class _CulturePageState extends State<CulturePage> {
  int activeCountry = 0;
  List<String> countriesToSee = ["China", "Germany", "South Korea", "Spain"];

  void moveBackward(List<String> countries) {
    if (activeCountry == 0) {
      setState(() {
        activeCountry = countries.length - 1;
      });
    } else {
      setState(() {
        activeCountry--;
      });
    }
  }

  void moveForward(List<String> countries) {
    if (activeCountry == countries.length - 1) {
      setState(() {
        activeCountry = 0;
      });
    } else {
      setState(() {
        activeCountry++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: Builder(
          builder: (context) => Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 70, 103, 101)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () => Scaffold.of(context).openDrawer(),
                            icon: const Icon(Icons.menu),
                            color: Colors.white),
                        Expanded(
                            child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height / 45),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 4,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      (activeCountry == 0)
                                          ? "images/languages/Chinese.png"
                                          : (activeCountry == 1
                                              ? "images/languages/German.png"
                                              : (activeCountry == 2
                                                  ? "images/languages/Korean.png"
                                                  : (activeCountry == 3
                                                      ? "images/languages/Spanish.png"
                                                      : "images/languages/Global.png"))),
                                      height: 150,
                                      width: 150,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () =>
                                                moveBackward(countriesToSee),
                                            icon: const Icon(
                                                Icons.arrow_back_ios_new)),
                                        Text(countriesToSee[activeCountry]),
                                        IconButton(
                                            onPressed: () =>
                                                moveForward(countriesToSee),
                                            icon: const Icon(
                                                Icons.arrow_forward_ios)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}

/*
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
                                (1300 / 1366),
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
*/