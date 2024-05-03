import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:language/Models/Questions/trueFalseQuestions.dart';
import 'package:language/Services/urls.dart';

Future<List<TFQuestion>> getTrueFalseQuestions(
    BuildContext context, int unit) async {
  var response = await http.get(Uri.parse(APIConfig.tfquestionsAPI));
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body)["questions"];
    List<TFQuestion> questions = [];
    for (var q in jsonResponse) {
      TFQuestion question = TFQuestion(
          unit: q["unit"], question: q["question"], answer: q["answer"]);
      if (question.unit == unit) {
        questions.add(question);
      }
    }
    return questions;
  } else {
    throw ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("There is a problem with error.")));
  }
}
