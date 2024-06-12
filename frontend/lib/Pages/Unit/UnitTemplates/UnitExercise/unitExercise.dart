import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:language/Pages/Unit/UnitTemplates/UnitExercise/unitWritingExercise.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UnitGrammarExercise.dart';
import 'UnitVocabularyExercise.dart';

class UnitExercise extends StatefulWidget {
  const UnitExercise(this.numberForUnit);

  final int numberForUnit;

  @override
  State<UnitExercise> createState() => _UnitExerciseState();
}

class _UnitExerciseState extends State<UnitExercise> {
  bool isLogin = false;

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
      });
    } else {
      setState(() {
        isLogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (isLogin)
        ? ExercisePage(widget.numberForUnit)
        : const ExerciseBlock();
  }
}

class ExerciseBlock extends StatefulWidget {
  const ExerciseBlock({Key? key}) : super(key: key);

  @override
  State<ExerciseBlock> createState() => _ExerciseBlockState();
}

class _ExerciseBlockState extends State<ExerciseBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(93, 255, 255, 255).withOpacity(0.2)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              size: 40,
            ),
            RichText(
                text: TextSpan(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 209, 208, 208),
                        fontSize: 18),
                    children: [
                  const TextSpan(
                      text: "Exercises are for registered learners."),
                  const TextSpan(text: "\nPress "),
                  TextSpan(
                      text: "here",
                      style: const TextStyle(color: Colors.blueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          Navigator.pushNamed(context, "/login");
                        })),
                  const TextSpan(text: " to log in."),
                  const TextSpan(text: "\nIf you are not registered, press "),
                  TextSpan(
                      text: "here",
                      style: const TextStyle(color: Colors.blueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          Navigator.pushNamed(context, "/register");
                        })),
                  const TextSpan(text: " to sign up.")
                ])),
          ],
        ));
  }
}

class ExercisePage extends StatefulWidget {
  const ExercisePage(this.unitNumber);

  final int unitNumber;

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int selectedWidget = 0;
  late final exerciseScreen;

  @override
  void initState() {
    super.initState();
    exerciseScreen = [
      GrammarExercise(
        unit: widget.unitNumber,
      ),
      VocabularyExercise(unitNumber: widget.unitNumber),
      WritingExercise()
    ];
  }

  buttonTextColor(int unit) {
    Color? bColor;
    if (unit % 5 == 1) {
      bColor = Colors.purple;
    } else if (unit % 5 == 2) {
      bColor = Colors.orange;
    } else if (unit % 5 == 3) {
      bColor = Colors.blue;
    } else if (unit % 5 == 4) {
      bColor = Colors.cyan;
    } else {
      bColor = Color(0xff4338CA);
    }
    return bColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Exercises",
          style: TextStyle(color: Colors.white, fontSize: 37),
        ),
        const Text(
          'Here you can practice what you have learnt in this unit.\nChoose one language and one part to solve the questions.',
          style: TextStyle(color: Colors.grey, fontSize: 25),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //setState is necessary to change active widget.
                  setState(() {
                    selectedWidget = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonTextColor(widget.unitNumber)),
                child: const Text("GRAMMAR")),
            const SizedBox(width: 25),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedWidget = 1;
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonTextColor(widget.unitNumber)),
                child: const Text("VOCABULARY")),
            const SizedBox(width: 25),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedWidget = 2;
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonTextColor(widget.unitNumber)),
                child: const Text("WRITING")),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: exerciseScreen[selectedWidget],
        )
      ],
    );
  }
}
