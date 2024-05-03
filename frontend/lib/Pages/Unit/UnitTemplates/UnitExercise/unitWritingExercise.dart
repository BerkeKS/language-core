import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning_digital_ink_recognition/learning_digital_ink_recognition.dart';

class WritingExercise extends StatefulWidget {
  const WritingExercise({Key? key}) : super(key: key);

  @override
  State<WritingExercise> createState() => _WritingExerciseState();
}

class _WritingExerciseState extends State<WritingExercise> {
  DigitalInkRecognition recognition = DigitalInkRecognition(model: 'zh-Hani');
  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
