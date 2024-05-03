import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:language/Models/Words.dart';
import 'package:language/Services/authService.dart';
import '../Pages/OtherPages/navBar.dart';
import 'package:email_validator/email_validator.dart';

import '../Pages/OtherPages/navBarContent.dart';

class SignUpPage extends StatelessWidget {
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
                  image: AssetImage("images/others/Login.JPG"),
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
                      margin: EdgeInsets.fromLTRB(50, 80, 0, 0),
                      padding: EdgeInsets.all(5),
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
  final signupFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  static bool passwordVisible = false;

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
        if (value != null && value.length < 5) {
          return "Username must have more than 5 characters!";
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
                  _InputFormState.passwordVisible =
                      !_InputFormState.passwordVisible;
                });
              }),
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.grey,
              ))),
      obscureText: !_InputFormState.passwordVisible,
      controller: passwordController,
      validator: (value) {
        if (value != null && value.length < 8) {
          return "Password must have at least 8 characters!";
        } else if (value != null &&
            !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
                .hasMatch(value)) {
          return "Password must include at least one letter, one number and one special chaacter.";
        }
        return null;
      },
    );
  }

  Widget passwordAgainForm() {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          icon: const Icon(
            Icons.password,
            color: Color.fromARGB(255, 11, 27, 82),
          ),
          hintText: "Confirm Password",
          hintStyle: const TextStyle(color: Color.fromARGB(255, 146, 146, 146)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: IconButton(
              onPressed: (() {
                setState(() {
                  _InputFormState.passwordVisible =
                      !_InputFormState.passwordVisible;
                });
              }),
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.grey,
              ))),
      obscureText: !_InputFormState.passwordVisible,
      controller: passwordAgainController,
      validator: (value) {
        if (value != null && value != passwordController.text) {
          return "Passwords do not match!";
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: signupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Registration",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[200]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            usernameForm(),
            const SizedBox(height: 5),
            emailForm(),
            const SizedBox(height: 5),
            passwordForm(),
            const SizedBox(height: 5),
            passwordAgainForm(),
            const SizedBox(height: 3),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 7, 6, 66)),
                onPressed: (() {
                  final isValidForm = signupFormKey.currentState!.validate();
                  List<Word> favorites = [];
                  if (isValidForm) {
                    registerLearner(
                        context: context,
                        username: usernameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        favorites: favorites);
                  }
                }),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.all(25),
              child: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    children: [
                      const TextSpan(text: "Already have an account? Login "),
                      TextSpan(
                          text: "here",
                          style: const TextStyle(color: Colors.blueAccent),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              Navigator.pushNamed(context, "/login");
                              setState(() {
                                NavBarContentState.activePage = 1;
                              });
                            }))
                    ]),
              ),
            )
          ],
        ));
  }
}
