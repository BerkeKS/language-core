// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:language/Models/words.dart';
import 'package:language/Services/urls.dart';

Future<List<Word>> getWords(
    BuildContext context, int desiredUnit, int desiredPart) async {
  try {
    final res = await http.get(Uri.parse(APIConfig.wordsAPI));
    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body)['words'];
      List<Word> words = [];
      for (var w in jsonResponse) {
        Word word = Word(
            unit: w['unit'],
            part: w['part'],
            name: w['name'],
            chineseTranslation: w['chineseTranslation'],
            chineseTranslationPinyin: w['chineseTranslationPinyin'],
            germanTranslation: w['germanTranslation'],
            koreanTranslation: w['koreanTranslation'],
            koreanTranslationRomanized: w['koreanTranslationRomanized'],
            spanishTranslation: w['spanishTranslation'],
            image: (w['image'] == null) ? "" : w['image']);
        if (word.unit == desiredUnit && word.part == desiredPart) {
          words.add(word);
        }
      }
      return words;
    }
    throw ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Something went wrong.')));
  } catch (err) {
    throw ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(err.toString())));
  }
}

Future<List<Word>> getWordsForExercise(
    BuildContext context, int desiredUnit) async {
  try {
    final res = await http.get(Uri.parse(APIConfig.wordsAPI));
    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body)['words'];
      List<Word> words = [];
      for (var w in jsonResponse) {
        Word word = Word(
            unit: w['unit'],
            part: w['part'],
            name: w['name'],
            chineseTranslation: w['chineseTranslation'],
            chineseTranslationPinyin: w['chineseTranslationPinyin'],
            germanTranslation: w['germanTranslation'],
            koreanTranslation: w['koreanTranslation'],
            koreanTranslationRomanized: w['koreanTranslationRomanized'],
            spanishTranslation: w['spanishTranslation']);
        if (word.unit == desiredUnit) {
          words.add(word);
        }
      }
      print(words);
      return words;
    }
    throw ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Something went wrong.')));
  } catch (err) {
    throw ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(err.toString())));
  }
}
