import 'package:flutter/material.dart';
import 'package:language/Pages/Unit/UnitTemplates/unitVocabulary.dart';
import 'package:language/Services/authService.dart';
import 'package:language/Utility/googleLoginAPI.dart';
import 'package:language/Pages/Quiz/Quizzes/Quiz1.dart';
import 'package:language/Pages/OtherPages/UserProfile.dart';
import 'package:language/Pages/Unit/UnitTemplates/UnitStructure.dart';
import 'package:language/Pages/Unit/Units/Unit5.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBarContent extends StatefulWidget {
  NavBarContent();
  @override
  NavBarContentState createState() => new NavBarContentState();
}

class NavBarContentState extends State<NavBarContent> {
  bool isLogin = false;
  String username = "";
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
        username = loginPreferences.getString("username")!;
      });
    } else {
      setState(() {
        isLogin = false;
      });
    }
  }

  /*
  ibconverter () {
    List<int> pageNumber = [for (int i = -1; i <= 5; i++) i];
    List<bool>selectedEmpty = [];
    for (int i = 0; i <= pageNumber.length - 1; i++){
      selectedEmpty.add(false);
    }
    selectedEmpty[0] = true;
    return selectedEmpty;
  }

  late List<bool>selected = ibconverter();

  select (int n) {
    for (int i = 0; i <= ibconverter().length - 1; i++){
      if (i != n){
        selected[i] = false;
      }
      else{
        selected[i] = true;
      }
    }
  }
  */
  static int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (isLogin || GoogleLoginAPI.currentUser != null)
            ? ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      height: 45,
                      width: 150,
                      child: (GoogleLoginAPI.currentUser != null)
                          ? ListTile(
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    GoogleLoginAPI.currentUser!.photoUrl!),
                              ),
                              title: Text(
                                'Welcome, ${GoogleLoginAPI.currentUser!.displayName}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            )
                          : Text(
                              'Welcome, $username',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            )),
                  NavBarButton(
                    text: "User Profile",
                    active: NavBarContentState.activePage == 3,
                    clicked: () {
                      setState(() {
                        NavBarContentState.activePage = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile()),
                        );
                      });
                    },
                  ),
                  NavBarButton(
                    text: "Logout",
                    active: NavBarContentState.activePage == 4,
                    clicked: () {
                      setState(() {
                        int temp = NavBarContentState.activePage;
                        NavBarContentState.activePage = 4;
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content:
                                      const Text("Are you sure to logout?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            Navigator.pop(context);
                                            NavBarContentState.activePage =
                                                temp;
                                          });
                                        },
                                        child: const Text("CANCEL")),
                                    TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          if (GoogleLoginAPI.currentUser !=
                                              null) {
                                            await GoogleLoginAPI.logout();
                                          } else {
                                            logOut(context);
                                          }
                                          Navigator.pushNamed(context, '/');
                                          setState(() {
                                            NavBarContentState.activePage = 0;
                                          });
                                        },
                                        child: const Text("OK"))
                                  ],
                                ));
                      });
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 116, 116, 116),
                  ),
                  UnitList()
                ],
              )
            : ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  NavBarButton(
                    text: "Main Page",
                    active: NavBarContentState.activePage == 0,
                    clicked: () {
                      setState(() {
                        NavBarContentState.activePage = 0;
                        Navigator.pushNamed(context, "/");
                      });
                    },
                  ),
                  NavBarButton(
                    text: "Login",
                    active: NavBarContentState.activePage == 1,
                    clicked: () {
                      setState(() {
                        NavBarContentState.activePage = 1;
                        Navigator.pushNamed(context, "/login");
                      });
                    },
                  ),
                  NavBarButton(
                    text: "Register",
                    active: NavBarContentState.activePage == 2,
                    clicked: () {
                      setState(() {
                        NavBarContentState.activePage = 2;
                        Navigator.pushNamed(context, "/register");
                      });
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 116, 116, 116),
                  ),
                  const UnitList()
                ],
              ));
  }
}

class UnitList extends StatefulWidget {
  const UnitList({Key? key}) : super(key: key);

  @override
  State<UnitList> createState() => _UnitListState();
}

class _UnitListState extends State<UnitList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NavBarButton(
          text: "Unit 0 - Introduction",
          active: NavBarContentState.activePage == 5,
          clicked: () {
            setState(() {
              NavBarContentState.activePage = 5;
              Navigator.pushNamed(context, "/unit0");
              UnitStructure.unitPart = 0;
              VocabularyCardState.selectedLanguage = '';
              UnitVocabulary.translation = '';
              VocabularyCardState.dropDownGuide = 'Select Language';
            });
          },
        ),
        NavBarButton(
          text: "Unit 1",
          active: NavBarContentState.activePage == 6,
          clicked: () {
            setState(() {
              NavBarContentState.activePage = 6;
              Navigator.pushNamed(context, "/unit1");
              UnitStructure.unitPart = 0;
              VocabularyCardState.selectedLanguage = '';
              UnitVocabulary.translation = '';
              VocabularyCardState.dropDownGuide = 'Select Language';
            });
          },
        ),
        NavBarButton(
          text: "Unit 2",
          active: NavBarContentState.activePage == 7,
          clicked: () {
            setState(() {
              NavBarContentState.activePage = 7;
              Navigator.pushNamed(context, "/unit2");
              UnitStructure.unitPart = 0;
              VocabularyCardState.selectedLanguage = '';
              UnitVocabulary.translation = '';
              VocabularyCardState.dropDownGuide = 'Select Language';
            });
          },
        ),
        NavBarButton(
          text: "Unit 3",
          active: NavBarContentState.activePage == 8,
          clicked: () {
            setState(() {
              NavBarContentState.activePage = 8;
              Navigator.pushNamed(context, "/unit3");
              UnitStructure.unitPart = 0;
              VocabularyCardState.selectedLanguage = '';
              UnitVocabulary.translation = '';
              VocabularyCardState.dropDownGuide = 'Select Language';
            });
          },
        ),
        NavBarButton(
          text: "Unit 4",
          active: NavBarContentState.activePage == 9,
          clicked: () {
            setState(() {
              NavBarContentState.activePage = 9;
              Navigator.pushNamed(context, "/unit4");
              UnitStructure.unitPart = 0;
              VocabularyCardState.selectedLanguage = '';
              UnitVocabulary.translation = '';
              VocabularyCardState.dropDownGuide = 'Select Language';
            });
          },
        ),
        NavBarButton(
          text: "Unit 5",
          active: NavBarContentState.activePage == 10,
          clicked: () {
            setState(() {
              NavBarContentState.activePage = 10;
              Navigator.pushNamed(context, "/unit5");
              UnitStructure.unitPart = 0;
              VocabularyCardState.selectedLanguage = '';
              UnitVocabulary.translation = '';
              VocabularyCardState.dropDownGuide = 'Select Language';
            });
          },
        ),
        const Divider(
          color: Color.fromARGB(255, 116, 116, 116),
        ),
        NavBarButton(
          text: "Quiz 1",
          active: NavBarContentState.activePage == 11,
          clicked: () {
            setState(() {
              NavBarContentState.activePage = 11;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Quiz1()),
              );
              UnitStructure.unitPart = 0;
              VocabularyCardState.selectedLanguage = '';
              UnitVocabulary.translation = '';
              VocabularyCardState.dropDownGuide = 'Select Language';
            });
          },
        ),
        NavBarButton(
          text: "Culture Exploration",
          active: NavBarContentState.activePage == 12,
          clicked: () {
            setState(() {
              NavBarContentState.activePage = 12;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Unit5()),
              );
              UnitStructure.unitPart = 0;
              VocabularyCardState.selectedLanguage = '';
              UnitVocabulary.translation = '';
              VocabularyCardState.dropDownGuide = 'Select Language';
            });
          },
        ),
      ],
    );
  }
}

class NavBarButton extends StatefulWidget {
  NavBarButton(
      {required this.active, required this.clicked, required this.text});

  final Function clicked;
  final bool active;
  final String text;

  @override
  NavBarButtonState createState() => new NavBarButtonState();
}

class NavBarButtonState extends State<NavBarButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {
            widget.clicked();
          },
          splashColor: Colors.white,
          hoverColor: const Color.fromARGB(246, 75, 76, 78),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                SizedBox(
                  height: 45,
                  width: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 5,
                        decoration: BoxDecoration(
                            color: widget.active
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(widget.text,
                            style: TextStyle(
                                fontWeight: widget.active
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                            textAlign: TextAlign.right),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
