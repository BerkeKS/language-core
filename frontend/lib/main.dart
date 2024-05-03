import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:language/Pages/Unit/Units/unit0.dart';
import 'package:language/authentication/login.dart';
import 'package:language/Pages/OtherPages/navBar.dart';
import 'package:language/authentication/signUp.dart';
import 'package:language/Pages/OtherPages/UserProfile.dart';
import 'Pages/OtherPages/NavBarContent.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'Pages/Unit/Units/unit1.dart';
import 'Pages/Unit/Units/unit2.dart';
import 'Pages/Unit/Units/unit3.dart';
import 'Pages/Unit/Units/unit4.dart';

void main() async {
  //The first two codes are to initialize Firebase with our Flutter app.
  WidgetsFlutterBinding.ensureInitialized();
  //To remove "#" in URLs
  usePathUrlStrategy();
  runApp(const LanguageCore());
}

class LanguageCore extends StatefulWidget {
  const LanguageCore({Key? key}) : super(key: key);

  @override
  LanguageCoreState createState() => new LanguageCoreState();
}

class LanguageCoreState extends State<LanguageCore> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Language Core",
      routes: {
        '/': (context) => MainPage(),
        '/login': (context) => LogInPage(),
        '/register': (context) => SignUpPage(),
        '/userprofile': (context) => UserProfile(),
        '/unit0': (context) => Unit0(),
        '/unit1': (context) => Unit1(),
        '/unit2': (context) => Unit2(),
        '/unit3': (context) => Unit3(),
        '/unit4': (context) => Unit4(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  MainPageState createState() => new MainPageState();
  static int activeMainIndex = 0;
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        body: Builder(
            builder: (context) => Stack(children: [
                  IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.menu),
                    color: Colors.black,
                  ),
                  MainPageScreen()
                ])));
  }
}

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.modulate),
                  child: Image.asset("images/logo/LCLogo.png")),
              const Text(
                "You want to study many foreign languages and cultures?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Then you came to the right place.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextStyle(
                  style: const TextStyle(color: Colors.black, fontSize: 23.5),
                  child: Center(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText(
                            'Here, you can memorize foreign words with practical cards.',
                            duration: const Duration(seconds: 20),
                            textAlign: TextAlign.center),
                        FadeAnimatedText(
                            'Here, you can access the grammar of any language for each topic.',
                            duration: const Duration(seconds: 20),
                            textAlign: TextAlign.center),
                        FadeAnimatedText(
                            'Here, you can practice with many dialogues and exercises.',
                            duration: const Duration(seconds: 20),
                            textAlign: TextAlign.center),
                        FadeAnimatedText(
                            'Here, you can learn many interesing facts about many cultures.',
                            duration: const Duration(seconds: 20),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "To benefit these many rights:",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                    setState(() {
                      NavBarContentState.activePage = 2;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 100, 99, 99)),
                  child: const Text("Register")),
              const SizedBox(
                height: 19,
              ),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                      children: <TextSpan>[
                    const TextSpan(text: "Already have an account? "),
                    TextSpan(
                        text: "Login:",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 71, 71, 72)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            Navigator.pushNamed(context, "/login");
                            setState(() {
                              NavBarContentState.activePage = 1;
                            });
                          }))
                  ]))
            ],
          ),
        ),
        Expanded(
            child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.black),
          child: DefaultTextStyle(
              style:
                  const TextStyle(color: Colors.white, fontSize: 150, shadows: [
                Shadow(color: Color.fromARGB(255, 17, 91, 171), blurRadius: 30),
                Shadow(color: Color.fromARGB(255, 6, 43, 83), blurRadius: 30),
                Shadow(color: Color.fromARGB(255, 67, 6, 143), blurRadius: 30)
              ]),
              child: Center(
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText('Welcome to Language Core',
                        speed: const Duration(milliseconds: 200),
                        textAlign: TextAlign.center),
                    TyperAnimatedText('Willkommen bei Language Core',
                        speed: const Duration(milliseconds: 200),
                        textAlign: TextAlign.center),
                    TyperAnimatedText('Bienvenido a Language Core',
                        speed: const Duration(milliseconds: 200),
                        textAlign: TextAlign.center),
                    TyperAnimatedText('欢迎来到\nLanguage Core',
                        speed: const Duration(milliseconds: 200),
                        textAlign: TextAlign.center),
                    TyperAnimatedText('렌구이즈 커르 오신 것을 환영합니다',
                        speed: const Duration(milliseconds: 200),
                        textAlign: TextAlign.center),
                  ],
                ),
              )),
        ))
      ],
    );
  }
}

/*
TODO LIST:
-Use unit image in inroduction and dialogue
-Display images on deployed version
-Culture and quiz page
*/

/*
TO UPDATE DEPLOYED APP ON FIREBASE:
-flutter clean
-flutter pub get
-flutter build web
-npm install -g firebase-tools
-firebase login
-firebase init
-firebase deploy
*/
