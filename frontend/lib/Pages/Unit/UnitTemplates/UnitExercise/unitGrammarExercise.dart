import 'package:flutter/material.dart';
import 'package:language/Models/Questions/trueFalseQuestions.dart';
import 'package:language/Services/questionService.dart';

class GrammarExercise extends StatefulWidget {
  const GrammarExercise({required this.unit});

  final int unit;

  @override
  State<GrammarExercise> createState() => _GrammarExerciseState();
}

class _GrammarExerciseState extends State<GrammarExercise> {
  int activePart = 0;
  List<String> partList = ['Part 1 - True/False', 'Part 2', 'Part 3'];
  int activeQuestion = 0;
  var selectedAnswer;

  unitColor(int num) {
    if (num % 5 == 0 || num % 5 == 1) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (activePart == 0) {
                          activePart = partList.length - 1;
                        } else {
                          activePart--;
                        }
                      });
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: Colors.white,
                  ) // Look for other arrow options as well
                  ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  partList[activePart],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (activePart != (partList.length - 1)) {
                          activePart++;
                        } else {
                          activePart = 0;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        (activePart == 0)
            ? FutureBuilder<List<TFQuestion>>(
                future: getTrueFalseQuestions(context, widget.unit),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: unitColor(widget.unit),
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (activeQuestion != 0) {
                                activeQuestion--;
                              } else {
                                activeQuestion = snapshot.data!.length - 1;
                              }
                            });
                            selectedAnswer = null;
                          },
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.79,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: unitColor(widget.unit)),
                                  color: Colors.transparent.withOpacity(0.15)),
                              child: Center(
                                  child: Text(
                                snapshot.data![activeQuestion].question,
                                style: TextStyle(
                                    fontSize: 39.5,
                                    color: unitColor(widget.unit)),
                              )),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAnswer = true;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: (selectedAnswer == true)
                                            ? Colors.blue
                                            : unitColor(widget.unit))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "True",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: unitColor(widget.unit)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAnswer = false;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: (selectedAnswer == false)
                                            ? Colors.blue
                                            : unitColor(widget.unit))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "False",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: unitColor(widget.unit)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (selectedAnswer != null) {
                                      if (selectedAnswer ==
                                          snapshot
                                              .data![activeQuestion].answer) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                duration: Duration(seconds: 2),
                                                content: Text("Correct!")));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                duration: Duration(seconds: 2),
                                                content: Text("Wrong!")));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Select your answer first!")));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  child: const Text("ANSWER")),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (activeQuestion == snapshot.data!.length - 1) {
                                activeQuestion = 0;
                              } else {
                                activeQuestion++;
                              }
                              selectedAnswer = null;
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
                },
              )
            : const Text("Grammar")
      ],
    );
  }
}
