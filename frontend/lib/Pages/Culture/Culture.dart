import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Culture extends StatefulWidget {
  const Culture(this.iLink, this.iCLink, this.cultureExplore);

  final String iLink;
  final String iCLink;
  final List<CultureData> cultureExplore;

  @override
  State<Culture> createState() => _CultureState();
}

class _CultureState extends State<Culture> {
  int selectedCountry = 0;

  dColor(int num) {
    if (num == 0) {
      return Color.fromARGB(255, 153, 0, 0);
    } else if (num == 1) {
      return Color.fromARGB(255, 0, 0, 0);
    } else if (num == 2) {
      return Color.fromARGB(255, 201, 57, 57);
    } else if (num == 3) {
      return Color.fromARGB(255, 202, 0, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile(
                value: 0,
                groupValue: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = 0;
                  });
                },
                title: const Text("China")),
            RadioListTile(
                value: 1,
                groupValue: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = 1;
                  });
                },
                title: const Text("Germany")),
            RadioListTile(
                value: 2,
                groupValue: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = 2;
                  });
                },
                title: const Text("South Korea")),
            RadioListTile(
                value: 3,
                groupValue: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = 3;
                  });
                },
                title: const Text("Spain")),
          ],
        ),
        Stack(
          children: [
            Container(
                height: 300,
                width: 1000,
                child: Image.asset(
                  widget.iLink,
                  fit: BoxFit.cover,
                )),
            Container(
                alignment: Alignment.bottomLeft,
                height: 70,
                width: 110,
                child: Image.asset(
                  widget.iCLink,
                  fit: BoxFit.cover,
                ))
          ],
        ),
        ListView(
          children: [
            ListView.builder(
                itemCount: widget.cultureExplore.length,
                itemBuilder: (context, index) {
                  return ExpansionPanelList(
                    dividerColor: dColor(selectedCountry),
                    elevation: 2,
                    expandedHeaderPadding: const EdgeInsets.all(6),
                    expansionCallback: ((panelIndex, isExpanded) {
                      setState(() {
                        widget.cultureExplore[index].isOpen =
                            !widget.cultureExplore[index].isOpen;
                      });
                    }),
                    children: [
                      ExpansionPanel(
                          canTapOnHeader: true,
                          headerBuilder: (context, isOpen) {
                            return Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                widget.cultureExplore[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                          body: Padding(
                            padding: EdgeInsets.all(6),
                            child: Text(widget.cultureExplore[index].data),
                          ),
                          isExpanded: widget.cultureExplore[index].isOpen)
                    ],
                  );
                })
          ],
        )
      ],
    );
  }
}

class CultureData {
  bool isOpen = false;
  String title;
  String data;

  CultureData(this.isOpen, this.title, this.data);
}
