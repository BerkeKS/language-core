import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:language/Pages/OtherPages/navBar.dart';
import 'package:language/Services/pageService.dart';
import 'package:language/authentication/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/words.dart';
import '../../Services/accountService.dart';
import '../../Utility/tts.dart';
import '../Unit/UnitTemplates/unitVocabulary.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  static bool isLogin = false;
  static String username = "";
  static String email = "";
  static String password = "";
  static List<String> favorites = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  void onClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  displayWidget(int index) {
    if (index == 0) {
      return const ProfileDetails();
    } else {
      return const Favorites();
    }
  }

  void getLoginData() async {
    SharedPreferences loginPreferences = await SharedPreferences.getInstance();
    if (loginPreferences.containsKey("username")) {
      setState(() {
        isLogin = true;
        username = loginPreferences.getString("username")!;
        email = loginPreferences.getString("email")!;
        password = loginPreferences.getString("password")!;
        favorites = loginPreferences.getStringList("favorites")!;
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
        ? Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_pin), label: "User Profile"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: "Favorites"),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.blueGrey,
                onTap: onClicked),
            drawer: NavBar(),
            body: Builder(
              builder: (context) => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 5, 95, 212),
                  Color.fromARGB(255, 94, 233, 233),
                ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ),
                    displayWidget(_selectedIndex)
                  ],
                ),
              ),
            ),
          )
        : LogInPage();
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width - 80,
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.325),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'User Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.person_pin,
                  size: 100,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Username: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_UserProfileState.username),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var newUsername = TextEditingController();
                        newUsername.text = _UserProfileState.username;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: TextField(
                              controller: newUsername,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "Enter new username"),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {}, child: const Text("SUBMIT"))
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 37, 33, 82)),
                      child: const Text('Change Username'))
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 3,
              ),
              //Do not forget to update the email and password in both Firebase Auth and Firebase Firestore
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Email: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_UserProfileState.email),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var newEmail = TextEditingController();
                        newEmail.text = _UserProfileState.email;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: TextField(
                              controller: newEmail,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "Enter new email"),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {}, child: const Text("SUBMIT"))
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 37, 33, 82)),
                      child: const Text('Change Email'))
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Password: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_UserProfileState.password),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var newPassword = TextEditingController();
                        newPassword.text = _UserProfileState.password;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: TextField(
                              controller: newPassword,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "Enter new password"),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {}, child: const Text("SUBMIT"))
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 37, 33, 82)),
                      child: const Text('Change Password'))
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('NO')),
                          TextButton(onPressed: () {}, child: const Text('YES'))
                        ],
                        content:
                            const Text('Are you sure to delete your account?'),
                      ),
                    );
                  },
                  child: const Text('Delete Learner Account'))
            ]));
  }
}

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Word>>(
      future: getFavorite(context, _UserProfileState.username),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const Center(
                child: Text("Loading...",
                    style: TextStyle(color: Colors.white, fontSize: 27)),
              ));
        } else if (snapshot.hasError) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  color: Color.fromARGB(93, 255, 255, 255).withOpacity(0.2)),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.watch_later,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text(
                    "Words of this unit will be added later.",
                    style: TextStyle(fontSize: 27),
                  )
                ],
              ));
        } else {
          //FutureBuilder<List<Word>> is necessary instead of FutureBuilder to avoid the error about [] operator
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 67, 70, 75),
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (i != 0) {
                        i--;
                      } else {
                        i = snapshot.data!.length - 1;
                      }
                      UnitVocabulary.translation = "";
                      VocabularyCardState.selectedLanguage = '';
                      VocabularyCardState.dropDownGuide = 'Select Language';
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              VocabularyCard(snapshot.data![i]),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 67, 70, 75),
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (i != (snapshot.data!.length - 1)) {
                        i++;
                      } else {
                        i = 0;
                      }
                      UnitVocabulary.translation = "";
                      VocabularyCardState.selectedLanguage = '';
                      VocabularyCardState.dropDownGuide = 'Select Language';
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
        }
      },
    );
  }
}

class FavoriteVocabularyCard extends StatefulWidget {
  FavoriteVocabularyCard(this.word);
  final Word word;

  @override
  FavoriteVocabularyCardState createState() =>
      new FavoriteVocabularyCardState();
}

class FavoriteVocabularyCardState extends State<FavoriteVocabularyCard> {
  static String selectedLanguage = '';
  static String dropDownGuide = 'Select Language';

  Widget CardTranslation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.word.name, style: const TextStyle(fontSize: 40)),
        SizedBox(
          height: MediaQuery.of(context).size.height / 25,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(UnitVocabulary.translation,
              style: const TextStyle(fontSize: 54.5)),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: DropdownButton(
            hint: Text(dropDownGuide),
            icon: const Icon(Icons.arrow_drop_down_outlined),
            items: [
              DropdownMenuItem(
                  onTap: () {
                    setState(() {
                      dropDownGuide = 'Chinese';
                      selectedLanguage = 'Chinese';
                    });
                  },
                  value:
                      '${widget.word.chineseTranslation}\n${widget.word.chineseTranslationPinyin}',
                  child: const Text("Chinese")),
              DropdownMenuItem(
                  onTap: () {
                    setState(() {
                      dropDownGuide = 'German';
                      selectedLanguage = 'German';
                    });
                  },
                  value: widget.word.germanTranslation,
                  child: const Text("German")),
              DropdownMenuItem(
                  onTap: () {
                    setState(() {
                      dropDownGuide = 'Korean';
                      selectedLanguage = 'Korean';
                    });
                  },
                  value:
                      '${widget.word.koreanTranslation}\n${widget.word.koreanTranslationRomanized}',
                  child: const Text("Korean")),
              DropdownMenuItem(
                  onTap: () {
                    setState(() {
                      dropDownGuide = 'Spanish';
                      selectedLanguage = 'Spanish';
                    });
                  },
                  value: widget.word.spanishTranslation,
                  child: const Text("Spanish")),
            ],
            onChanged: (value) => setState(() {
              UnitVocabulary.translation = value.toString();
            }),
          ),
        ),
      ],
    );
  }

  Widget cardStructure(String link) {
    if (link == "") {
      return CardTranslation();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            link,
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width * 0.36,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),
          CardTranslation()
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 247, 247, 247),
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.73,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardStructure(widget.word.image!),
            Container(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TTSButton(language: selectedLanguage, word: widget.word),
                    IconButton(
                        onPressed: (() {
                          if (_UserProfileState.isLogin) {
                            if (_UserProfileState.favorites
                                .contains(widget.word.name)) {
                              removeFavorite(
                                  _UserProfileState.username, widget.word.name);
                              setState(() {
                                _UserProfileState.favorites
                                    .remove(widget.word.name);
                              });
                            } else {
                              addFavorite(
                                  _UserProfileState.username, widget.word);
                              setState(() {
                                _UserProfileState.favorites
                                    .add(widget.word.name);
                              });
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: RichText(
                                    text: TextSpan(children: <TextSpan>[
                                  const TextSpan(
                                      text:
                                          "This action is availible for learners with an account.\nClick "),
                                  TextSpan(
                                      text: "here",
                                      style: const TextStyle(
                                          color: Colors.blueAccent),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                              context, "/login");
                                          setCurrentPage("Login");
                                        }),
                                  const TextSpan(
                                      text:
                                          " to login.\nIf you don't have any account, click "),
                                  TextSpan(
                                      text: "here",
                                      style: const TextStyle(
                                          color: Colors.blueAccent),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                              context, "/register");
                                          setCurrentPage("Register");
                                        }),
                                  const TextSpan(text: " to register."),
                                ])),
                              ),
                            );
                          }
                        }),
                        icon: Icon(
                          (_UserProfileState.favorites
                                  .contains(widget.word.name))
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red[800],
                        )),
                  ],
                ))
          ],
        ));
  }
}
