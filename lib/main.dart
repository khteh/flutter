import 'package:flutter/material.dart';
import './FavouriteWidget.dart';
import './StateManagement.dart';
import './fibonacci.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget fibonacciSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [FibonacciForm(key: ValueKey("FibonacciForm"))]));
    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text("Oeschinen Lake Compound",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Text("Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey[500]))
            ],
          )),
          //Icon(Icons.star, color: Colors.red[500]),
          //const Text("41")
          const FavouriteWidget()
        ]));
    Color color = Theme.of(context).primaryColor;
    Widget buttonsSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonsColumn(color, Icons.call, "CALL"),
        _buildButtonsColumn(color, Icons.near_me, "ROUTE"),
        _buildButtonsColumn(color, Icons.share, "SHARE")
      ],
    );
    Widget statesSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              StatefulParentWidget(key: ValueKey("StateManagementWidget"))
            ]));
    Widget textSection = const Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true,
        ));
    return MaterialApp(
        title: 'Flutter Layout',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text("Flutter Layout")),
            body: // a ListView supports app body scrolling when the app is run on a small device.
                ListView(children: [
              fibonacciSection,
              Image.asset("images/lake.jpg",
                  width: 600,
                  height: 240,
                  fit: BoxFit
                      .cover), // BoxFit.cover tells the framework that the image should be as small as possible but cover its entire render box.
              titleSection,
              buttonsSection,
              textSection,
              statesSection
            ])));
  }

  Column _buildButtonsColumn(Color color, IconData icon, String label) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: color)))
        ]);
  }
}
