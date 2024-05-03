import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:language/Pages/OtherPages/NavBarContent.dart';
import 'package:language/Pages/Unit/UnitTemplates/UnitStructure.dart';
import 'package:language/Services/authService.dart';
import 'package:language/Utility/icons.dart';
import '../Pages/OtherPages/navBar.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        body: Builder(
          builder: (context) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/others/Login.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(50, 80, 0, 0),
                      padding: const EdgeInsets.all(5),
                      color: Colors.blueGrey.withOpacity(0.5),
                      height: MediaQuery.of(context).size.height * 3 / 4,
                      width: MediaQuery.of(context).size.width * 5 / 12,
                      child: InputForm(),
                    )
                  ])),
        ));
  }
}

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool usernameOptionActive = true;
  bool passwordVisible = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget usernameForm() {
    return TextFormField(
      decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          icon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 11, 27, 82),
          ),
          hintText: "Username",
          hintStyle: TextStyle(color: Color.fromARGB(255, 146, 146, 146)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      controller: usernameController,
      validator: (value) {
        if (value == null) {
          return "Enter a username";
        }
        return null;
      },
    );
  }

  Widget emailForm() {
    return TextFormField(
        decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            icon: Icon(
              Icons.email,
              color: Color.fromARGB(255, 11, 27, 82),
            ),
            hintText: "Email Address",
            hintStyle: TextStyle(color: Color.fromARGB(255, 146, 146, 146)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        controller: emailController,
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? "Enter a valid email"
            : null);
  }

  Widget passwordForm() {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          icon: const Icon(
            Icons.password,
            color: Color.fromARGB(255, 11, 27, 82),
          ),
          hintText: "Password",
          hintStyle: const TextStyle(color: Color.fromARGB(255, 146, 146, 146)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: IconButton(
              onPressed: (() {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              }),
              icon: Icon(
                passwordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ))),
      obscureText: !passwordVisible,
      controller: passwordController,
      validator: (value) {
        if (value == null) {
          return "Enter a password!";
        }
        return null;
      },
    );
  }

  loginOption(usernameOptionActive) {
    if (usernameOptionActive) {
      emailController.text = '';
      return usernameForm();
    } else {
      usernameController.text = '';
      return emailForm();
    }
  }

  String optionState(usernameOptionActive) {
    if (usernameOptionActive) {
      return "LOGIN WITH YOUR EMAIL ADRESS";
    } else {
      return "LOGIN WITH YOUR USERNAME";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[200]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 7, 6, 66)),
                  onPressed: (() {
                    setState(() {
                      if (usernameOptionActive) {
                        usernameOptionActive = false;
                      } else {
                        usernameOptionActive = true;
                      }
                    });
                  }),
                  child: Text(
                    optionState(usernameOptionActive),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 234, 227, 227),
                  ),
                  onPressed: () {
                    googleLogin(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(CountryIcons.google,
                            color: Color.fromARGB(255, 7, 6, 66)),
                      ),
                      Text(
                        "Login with Google",
                        style:
                            TextStyle(color: Color.fromARGB(255, 50, 48, 48)),
                      )
                    ],
                  ))
            ]),
            const SizedBox(
              height: 15,
            ),
            loginOption(usernameOptionActive),
            const SizedBox(height: 5),
            passwordForm(),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 7, 6, 66)),
                    onPressed: (() async {
                      final isValidForm = loginFormKey.currentState!.validate();
                      if (isValidForm) {
                        if (usernameOptionActive) {
                          loginWithUsername(
                              context: context,
                              username: usernameController.text,
                              password: passwordController.text);
                          setState(() {
                            NavBarContentState.activePage = 5;
                            UnitStructure.unitPart = 0;
                          });
                        } else {
                          loginWithEmail(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text);
                          setState(() {
                            NavBarContentState.activePage = 5;
                            UnitStructure.unitPart = 0;
                          });
                        }
                      }
                    }),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot your password?",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      const TextSpan(text: "Don't have an account? Register "),
                      TextSpan(
                          text: "here",
                          style: const TextStyle(color: Colors.blueAccent),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              Navigator.pushNamed(context, "/register");
                              setState(() {
                                NavBarContentState.activePage = 2;
                              });
                            }))
                    ]),
              ),
            )
          ],
        ));
  }
}
