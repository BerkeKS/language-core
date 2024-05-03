import 'package:flutter/material.dart';

class UnitIntroduction extends StatelessWidget {
  UnitIntroduction(
      this.number, this.title, this.vocabularyTopics, this.grammarTopics);

  final int number;
  final String title;
  final List<String> vocabularyTopics;
  final List<String> grammarTopics;

  textColor(num) {
    if (num % 2 == 0) {
      return Color.fromARGB(255, 67, 70, 75);
    } else {
      return Color.fromARGB(255, 255, 255, 255);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(124, 255, 255, 255).withOpacity(0.15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: TextStyle(color: textColor(number), fontSize: 48)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Vocabulary Topics",
                        style:
                            TextStyle(color: textColor(number), fontSize: 36)),
                    Row(
                      children: [
                        Text("\u2022",
                            style: TextStyle(
                                color: textColor(number),
                                fontSize: 22)), //To Make Bullet Points
                        const SizedBox(width: 5),
                        Text(vocabularyTopics[0],
                            style: TextStyle(
                                color: textColor(number), fontSize: 22))
                      ],
                    ),
                    Row(
                      children: [
                        Text("\u2022",
                            style: TextStyle(
                                color: textColor(number), fontSize: 22)),
                        const SizedBox(width: 5),
                        Text(vocabularyTopics[1],
                            style: TextStyle(
                                color: textColor(number), fontSize: 22))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("Grammar Topics",
                        style:
                            TextStyle(color: textColor(number), fontSize: 36)),
                    Row(
                      children: [
                        Text("\u2022",
                            style: TextStyle(
                                color: textColor(number), fontSize: 22)),
                        const SizedBox(width: 5),
                        Text(grammarTopics[0],
                            style: TextStyle(
                                color: textColor(number), fontSize: 22))
                      ],
                    ),
                    Row(
                      children: [
                        Text("\u2022",
                            style: TextStyle(
                                color: textColor(number), fontSize: 22)),
                        const SizedBox(width: 5),
                        Text(grammarTopics[1],
                            style: TextStyle(
                                color: textColor(number), fontSize: 22))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
