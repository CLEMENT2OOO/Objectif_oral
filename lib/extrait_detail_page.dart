import 'package:flutter/material.dart';
import 'package:objectif_oral/data_reader.dart';

Widget extraitDetailPage(BuildContext context, ExtraitData data) {
  return Scaffold(
      appBar: AppBar(
        title: Text(data.shortTitle),
      ),
      body: SingleChildScrollView(
        child: modeSimple(context, data),
      ));
}

/* anc extrait detail page
  String analyseTexte = "";
  for (String t in data["analyse"]) {
    analyseTexte = analyseTexte + t;
  }
  TextStyle textFormatTitle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  TextStyle textFormatNormal = const TextStyle(
    fontSize: 20,
  );
  //MediaQuery.of(context).size
  return Scaffold(
      appBar: AppBar(
        title: Text(data["title_court"]),
      ),
      body: SingleChildScrollView(
        child: modePortrait(
            context, data, analyseTexte, textFormatTitle, textFormatNormal),
      ));
}
*/

Widget modeSimple(BuildContext context, ExtraitData data) {
  return Column(
    children: [
      Hero(
        tag: data.id,
        child: Image.asset(
          "assets/images/gargantua.png",
          fit: BoxFit.cover,
        ),
      ),
      Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              data.widgetTextCreator(context, "${data.fullTitle} | "),
              data.widgetTextCreator(context, "${data.bodyText} | "),
              data.widgetTextCreator(context, "##Analyse :## | "),
              data.widgetTextCreator(context, data.analyse),
            ],
          )),
    ],
  );
}
//TODO: BUG le texte ne se justifie pas et agrandit la colonne
Widget modeDouble(BuildContext context, ExtraitData data) {
  return Row(
    children: [
      Column(
        children: [
          Hero(
            tag: data.id,
            child: Image.asset(
              "assets/images/gargantua.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  data.widgetTextCreator(context, "${data.fullTitle} | "),
                  data.widgetTextCreator(context, "${data.bodyText} | "),
                ],
              )),
        ],
      ),
      const Divider(),
      Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              data.widgetTextCreator(context, "##Analyse :## | "),
              data.widgetTextCreator(context, data.analyse),
            ],
          )
      )
    ],
  );
}