import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:language/Pages/OtherPages/NavBarContent.dart';

class NavBar extends StatefulWidget {
  @override
  NavBarState createState() => new NavBarState();
}

class NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 17, 14, 14),
      child: Column(
        children: [
          SizedBox(height: 125, child: Image.asset("images/logo/LCLogo.png")),
          SizedBox(
            height: 130,
            child: DefaultTextStyle(
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
              child: Center(
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText('Deutsch',
                        speed: const Duration(milliseconds: 150)),
                    TyperAnimatedText('Español',
                        speed: const Duration(milliseconds: 150)),
                    TyperAnimatedText('中文',
                        speed: const Duration(milliseconds: 250)),
                    TyperAnimatedText('한국어',
                        speed: const Duration(milliseconds: 250)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              /*
            child: ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('token', '');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ));
              },
              child: const Text("Logout"),
            ),
          )
            */
              child: NavBarContent())
        ],
      ),
    );
  }
}

/*
DefaultTextStyle(
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
              child: Center(
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    /*
                    FadeAnimatedText('Deutsch', duration: Duration(seconds: 3),fadeOutBegin: 0.9,fadeInEnd: 0.7),
                    FadeAnimatedText('Español', duration: Duration(seconds: 3),fadeOutBegin: 0.9,fadeInEnd: 0.7),
                    FadeAnimatedText('中文', duration: Duration(seconds: 3),fadeOutBegin: 0.9,fadeInEnd: 0.7),
                    FadeAnimatedText('한국어', duration: Duration(seconds: 3),fadeOutBegin: 0.9,fadeInEnd: 0.7),
                    */
                    TyperAnimatedText('Deutsch',
                        speed: const Duration(milliseconds: 150)),
                    TyperAnimatedText('Español',
                        speed: const Duration(milliseconds: 150)),
                    TyperAnimatedText('中文',
                        speed: const Duration(milliseconds: 250)),
                    TyperAnimatedText('한국어',
                        speed: const Duration(milliseconds: 250)),
                  ],
                ),
              ),
            )
*/
