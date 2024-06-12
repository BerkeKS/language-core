import 'package:flutter/material.dart';
import 'package:language/Pages/OtherPages/navBar.dart';
import 'package:language/Pages/Unit/UnitTemplates/UnitStructure.dart';
import 'package:language/Pages/Unit/Units/Unit1.dart';

import '../../../Services/pageService.dart';

class Unit0 extends StatefulWidget {
  Unit0();

  static int unitPart = 0;

  @override
  Unit0State createState() => new Unit0State();
}

class Unit0State extends State<Unit0> {
  List<Color> beginEnd = [];

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
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.black, Colors.white],
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
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                              icon: const Icon(Icons.menu),
                              color: Colors.white),
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width *
                                (1325 / 1366),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                UnitSectionButton(
                                  text: "ALPHABET",
                                  active: Unit0.unitPart == 0,
                                  clicked: () {
                                    setState(() {
                                      Unit0.unitPart = 0;
                                    });
                                  },
                                ),
                                UnitSectionButton(
                                  text: "PRONUNCIATION",
                                  active: Unit0.unitPart == 1,
                                  clicked: () {
                                    setState(() {
                                      Unit0.unitPart = 1;
                                    });
                                  },
                                ),
                                UnitSectionButton(
                                  text: "EXERCISE",
                                  active: Unit0.unitPart == 2,
                                  clicked: () {
                                    setState(() {
                                      Unit0.unitPart = 2;
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
                          Unit0Content(),
                          UnitAccesser(Unit1()),
                        ],
                      )
                    ]))));
  }
}

class Unit0Content extends StatefulWidget {
  const Unit0Content();

  @override
  State<Unit0Content> createState() => _Unit0ContentState();
}

class _Unit0ContentState extends State<Unit0Content> {
  late final ContentScreen;

  @override
  void initState() {
    super.initState();
    ContentScreen = [
      Alphabet(),
      Pronunciation(),
      Exercise(),
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
              child: ContentScreen[Unit0.unitPart])
        ]);
  }
}

class UnitSectionButton extends StatefulWidget {
  const UnitSectionButton(
      {required this.active, required this.clicked, required this.text});

  final bool active;
  final Function clicked;
  final String text;

  @override
  State<UnitSectionButton> createState() => _UnitSectionButtonState();
}

class _UnitSectionButtonState extends State<UnitSectionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (1325 / 1366) / 3,
      child: Material(
        color: widget.active ? Colors.grey.shade800 : Colors.transparent,
        child: InkWell(
          onTap: () {
            widget.clicked();
          },
          splashColor: Colors.grey.shade800,
          hoverColor: Colors.grey.shade400,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3),
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.active ? Colors.white : Colors.grey.shade800,
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
  const UnitAccesser(this.UnitAfter);
  final Widget UnitAfter;

  @override
  State<UnitAccesser> createState() => _UnitAccesserState();
}

class _UnitAccesserState extends State<UnitAccesser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
      child: Row(
          mainAxisAlignment:
              MainAxisAlignment.end, //Put the children intro two opposite sides
          children: [
            Row(
              children: [
                const Text(
                  "Go to Next Unit",
                  style: TextStyle(color: Colors.black),
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
                          Navigator.pushNamed(context, "/unit1");
                          setCurrentPage("Unit 1");
                          UnitStructure.unitPart = 0;
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

class Alphabet extends StatefulWidget {
  const Alphabet({Key? key}) : super(key: key);

  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
  int alphValue = 0;
  Widget currentAlphabet = CHalphabet();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RadioListTile(
                    value: 0,
                    groupValue: alphValue,
                    onChanged: ((value) {
                      setState(() {
                        alphValue = 0;
                        currentAlphabet = CHalphabet();
                      });
                    }),
                    title: const Text(
                      "Chinese",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: 1,
                    groupValue: alphValue,
                    onChanged: ((value) {
                      setState(() {
                        alphValue = 1;
                        currentAlphabet = DEalphabet();
                      });
                    }),
                    title: const Text(
                      "German",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: 2,
                    groupValue: alphValue,
                    onChanged: ((value) {
                      setState(() {
                        alphValue = 2;
                        currentAlphabet = KRalphabet();
                      });
                    }),
                    title: const Text(
                      "Korean",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                    child: RadioListTile(
                  value: 3,
                  groupValue: alphValue,
                  onChanged: ((value) {
                    setState(() {
                      alphValue = 3;
                      currentAlphabet = ESalphabet();
                    });
                  }),
                  title: const Text(
                    "Spanish",
                    style: TextStyle(color: Colors.black),
                  ),
                ))
              ],
            ))
      ],
    );
  }
}

Widget CHalphabet() {
  return Center(
    child: Text("Chinese Characters"),
  );
}

Widget DEalphabet() {
  return Center(
    child: Text("German Alphabet"),
  );
}

Widget KRalphabet() {
  return Center(
    child: Text("Korean Alphabet"),
  );
}

Widget ESalphabet() {
  return Center(
    child: Text("Spanish Alphabet"),
  );
}

List<Widget> pronunciationData = [
  Column(
    children: [
      ListTile(
        title: Text("Chinese Pronunciation Rules"),
      )
    ],
  ),
  Column(
    children: [
      ListTile(
        title: Text("German Pronunciation Rules"),
      )
    ],
  ),
  Column(
    children: [
      ListTile(
        title: Text("Korean Pronunciation Rules"),
      )
    ],
  ),
  Column(
    children: [
      ListTile(
        title: Text("Spanish Pronunciation Rules"),
      )
    ],
  ),
];

class Pronunciation extends StatefulWidget {
  const Pronunciation({Key? key}) : super(key: key);

  @override
  State<Pronunciation> createState() => _PronunciationState();
}

class _PronunciationState extends State<Pronunciation> {
  int active = 0;

  dotActiveness(int active, int value) {
    if (active == value) {
      return Colors.grey.shade800;
    } else {
      return Colors.grey.shade500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 475,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (active != 0) {
                          active--;
                        } else {
                          active = pronunciationData.length - 1;
                        }
                      });
                    },
                    icon: const Icon(Icons.arrow_back_outlined),
                    color: Colors.grey.shade500),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: 950,
                  child: pronunciationData[active],
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (active != pronunciationData.length - 1) {
                          active++;
                        } else {
                          active = 0;
                        }
                      });
                    },
                    icon: const Icon(Icons.arrow_forward_outlined),
                    color: Colors.grey.shade500),
              ],
            ),
          ),
          Container(
              height: 30,
              width: (pronunciationData.length * 10) +
                  ((pronunciationData.length - 1) * 2),
              child: Row(
                children: [
                  for (int i = 0; i < pronunciationData.length; i++)
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: dotActiveness(i, active),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                ],
              ))
        ],
      ),
    );
  }
}

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Exercise Page"));
  }
}
