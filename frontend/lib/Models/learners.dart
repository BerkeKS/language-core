import 'dart:convert';
import 'package:language/Models/Words.dart';

class Learner {
  Learner(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.favorites,
      required this.token});
  String id;
  String username;
  String email;
  String password;
  List<Word> favorites;
  String token;

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "email": email,
      "password": password,
      "favorites": favorites,
      "token": token
    };
  }

  factory Learner.fromMap(Map<String, dynamic> responseData) {
    return Learner(
        id: responseData["_id"],
        username: responseData['username'],
        email: responseData['email'],
        password: responseData['password'],
        favorites: responseData['favorites'],
        token: responseData['token']);
  }

  String toJson() => json.encode(toMap());
  factory Learner.fromJson(String source) =>
      Learner.fromMap(json.decode(source));
}

//To solve the problems that freezes flutter within data share with Firestore:
//https://github.com/firebase/flutterfire/issues/7406
