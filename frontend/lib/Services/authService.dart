import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:language/Models/learners.dart';
import 'package:language/Models/Words.dart';
import 'package:language/Services/pageService.dart';
import 'package:language/Services/urls.dart';
import 'package:language/Utility/googleLoginAPI.dart';
import 'package:language/Utility/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleLoginClass {
  static GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>['email']);
}

void registerLearner(
    {required BuildContext context,
    required String username,
    required String email,
    required String password,
    required List<Word> favorites}) async {
  try {
    Learner learner = Learner(
        id: '',
        username: username,
        email: email,
        password: password,
        favorites: favorites,
        token: '');
    http.Response res = await http.post(Uri.parse(APIConfig.registerAPI),
        body: learner.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        });
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: RichText(
                        text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: <TextSpan>[
                          const TextSpan(
                              text:
                                  "You have successfully registered!\nYou can click "),
                          TextSpan(
                              text: "here",
                              style: const TextStyle(color: Colors.blueAccent),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, '/login');
                                  setCurrentPage("Login");
                                }),
                          const TextSpan(text: " to login.")
                        ])),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"))
                    ],
                  ));
        });
  } catch (err) {
    showSnackBar(context, err.toString());
  }
}

//If you use set paranthesis inside normal paranthesis, you can use "required" declaration
void loginWithUsername(
    {required BuildContext context,
    required String username,
    required String password}) async {
  http.Response res = await http.post(
    Uri.parse(APIConfig.loginUsernameAPI),
    body: jsonEncode({"username": username, "password": password}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (res.statusCode == 200) {
    SharedPreferences loginPreferences = await SharedPreferences.getInstance();
    await loginPreferences.setString(
        "username", jsonDecode(res.body)['user']['username']);
    await loginPreferences.setStringList(
        "favorites",
        (jsonDecode(res.body)['user']['favorites'] as List<dynamic>)
            .cast<String>());
    Navigator.pushNamed(context, '/unit0');
  }
}

void loginWithEmail(
    {required BuildContext context,
    required String email,
    required String password}) async {
  try {
    http.Response res = await http.post(
      Uri.parse(APIConfig.loginEmailAPI),
      body: jsonEncode({"email": email, "password": password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode == 200) {
      SharedPreferences loginPreferences =
          await SharedPreferences.getInstance();
      await loginPreferences.setString(
          "username", jsonDecode(res.body)['user']['username']);
      await loginPreferences.setStringList(
          "favorites",
          (jsonDecode(res.body)['user']['favorites'] as List<dynamic>)
              .cast<String>());
      Navigator.pushNamed(context, '/unit0');
    }
  } catch (err) {
    showSnackBar(context, err.toString());
  }
}

Future<void> googleLogin(BuildContext context) async {
  GoogleLoginAPI.currentUser = await GoogleLoginAPI.login();
  if (GoogleLoginAPI.currentUser == null) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Login is failed.")));
  } else {
    Navigator.pushNamed(context, '/unit0');
  }
}

void logOut(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
}
