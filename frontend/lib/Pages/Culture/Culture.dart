import 'package:flutter/material.dart';
import 'package:language/Pages/OtherPages/navBar.dart';

class CulturePage extends StatefulWidget {
  const CulturePage({required this.pageNumber});

  final int pageNumber;

  @override
  State<CulturePage> createState() => _CulturePageState();
}

class _CulturePageState extends State<CulturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: Builder(
          builder: (context) => Row(
                children: [
                  IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.menu),
                    color: Colors.black,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.blueGrey[600]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height / 100),
                      child: Column(
                        children: [
                          Text("Title"),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(
                                              "images/languages/Chinese.png"),
                                          Text("China PR")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
    );
  }
}
