import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.statusCode, {Key? key}) : super(key: key);
  final int statusCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              'There is an issue with loading the website.\nPlease try again later.'),
          Text(statusCode.toString())
        ],
      ),
    );
  }
}
