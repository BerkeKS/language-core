import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class UnitGrammar extends StatefulWidget {
  const UnitGrammar(this.number, this.grammarData);

  final int number;
  final List<Widget> grammarData;

  @override
  State<UnitGrammar> createState() => _UnitGrammarState();
}

class _UnitGrammarState extends State<UnitGrammar> {
  int active = 0;

  List<Color> cardColors(int num) {
    Color backgroundColor;
    Color dotColor;
    Color activeDotColor;
    if (num % 5 == 1) {
      backgroundColor = const Color.fromARGB(255, 247, 134, 198);
      dotColor = const Color.fromARGB(255, 199, 46, 153);
      activeDotColor = const Color.fromARGB(255, 145, 10, 104);
    } else if (num % 5 == 2) {
      backgroundColor = const Color.fromARGB(255, 255, 253, 138);
      dotColor = const Color.fromARGB(255, 250, 246, 0);
      activeDotColor = const Color.fromARGB(255, 238, 215, 4);
    } else if (num % 5 == 3) {
      backgroundColor = const Color.fromARGB(255, 142, 238, 185);
      dotColor = const Color.fromARGB(255, 45, 224, 164);
      activeDotColor = const Color.fromARGB(255, 27, 119, 89);
    } else if (num % 5 == 4) {
      backgroundColor = const Color.fromARGB(255, 148, 245, 237);
      dotColor = const Color.fromARGB(255, 52, 223, 223);
      activeDotColor = const Color.fromARGB(255, 34, 134, 134);
    } else {
      backgroundColor = const Color.fromARGB(255, 195, 131, 231);
      dotColor = const Color.fromARGB(255, 163, 48, 209);
      activeDotColor = const Color.fromARGB(255, 84, 14, 102);
    }
    List<Color> cardColors = [backgroundColor, dotColor, activeDotColor];
    return cardColors;
  }

  dotActiveness(int active, int value) {
    if (active == value) {
      return cardColors(widget.number)[2];
    } else {
      return cardColors(widget.number)[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColors(widget.number)[0]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
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
                        active = widget.grammarData.length - 1;
                      }
                    });
                  },
                  icon: const Icon(Icons.arrow_back_outlined, size: 40),
                  color: cardColors(widget.number)[1],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width * (1000 / 1366),
                  child: widget.grammarData[active],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (active != widget.grammarData.length - 1) {
                        active++;
                      } else {
                        active = 0;
                      }
                    });
                  },
                  icon: const Icon(Icons.arrow_forward_outlined, size: 40),
                  color: cardColors(widget.number)[1],
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * (30 / 768),
              width: (widget.grammarData.length * 10) +
                  ((widget.grammarData.length - 1) * 2),
              child: Row(
                children: [
                  for (int i = 0; i < widget.grammarData.length; i++)
                    Container(
                      height: MediaQuery.of(context).size.height * (10 / 768),
                      width: MediaQuery.of(context).size.width * (8 / 1366),
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

class GrammarTitles extends StatelessWidget {
  GrammarTitles(
      {required this.grammarTitle,
      required this.grammarSubTitle,
      required this.grammarLanguage});

  final String grammarTitle;
  final String grammarSubTitle;
  final String grammarLanguage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 200),
      child: Row(
        children: [
          Expanded(
              child: ListTile(
            minVerticalPadding: 4,
            title: Text(
              grammarTitle,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              grammarSubTitle,
              style: const TextStyle(fontSize: 20),
            ),
          )),
          Image.asset(
            (grammarLanguage == "Chinese")
                ? "images/languages/Chinese.png"
                : (grammarLanguage == "German"
                    ? "images/languages/German.png"
                    : (grammarLanguage == "Korean"
                        ? "images/languages/Korean.png"
                        : (grammarLanguage == "Spanish"
                            ? "images/languages/Spanish.png"
                            : "images/languages/Global.png"))),
            height: 100,
            width: 100,
          )
        ],
      ),
    );
  }
}
