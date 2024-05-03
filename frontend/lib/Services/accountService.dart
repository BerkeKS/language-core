import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:language/Models/words.dart';
import 'package:language/Services/urls.dart';

Future<List<Word>> getFavorite(BuildContext context, String username) async {
  var res =
      await http.get(Uri.parse('${APIConfig.APIUrl}user/$username/favorites'));
  if (res.statusCode == 200) {
    List<Word> favorites = [];
    var jsonResponse = jsonDecode(res.body)["favorites"];
    for (var w in jsonResponse) {
      Word word = Word(
          unit: w["unit"],
          part: w["part"],
          name: w["name"],
          chineseTranslation: w["chineseTranslation"],
          chineseTranslationPinyin: w["chineseTranslationPinyin"],
          germanTranslation: w["germanTranslation"],
          koreanTranslation: w["koreanTranslation"],
          koreanTranslationRomanized: w["koreanTranslationRomanized"],
          spanishTranslation: w["spanishTranslation"]);
      favorites.add(word);
    }
    return favorites;
  } else {
    throw ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(res.toString())));
  }
}

addFavorite(
  String username,
  Word word,
) async {
  await http.post(Uri.parse('${APIConfig.APIUrl}user/$username/addfavorite'),
      body: jsonEncode({'name': word.name}),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      });
}

void removeFavorite(String username, String wordName) async {
  await http.post(Uri.parse('${APIConfig.APIUrl}user/$username/notfavorite'),
      body: {
        'word': wordName
      },
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      });
}
