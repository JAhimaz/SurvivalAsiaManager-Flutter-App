import 'package:ServerStats/icons/custom_icons.dart';
import 'package:flutter/material.dart';
import 'icons/custom_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ServerStats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class LandingPageButton extends StatelessWidget {
  final Icon icon;
  final String text;

  LandingPageButton(this.icon, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, -0.5),
      margin: const EdgeInsets.only(top: 20),
      child: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text(text),
        icon: icon,
        backgroundColor: Color(0xff5950a1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Color(0xff24243e))),
      ),
    );
  }
}
//Icon(CustomIcons.unturned)

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xff0f0c29), Color(0xff24243e)])),
      ),
      Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            alignment: Alignment(0.0, -0.5),
            child: Image.asset(
              'assets/images/animatedlogo.gif',
              height: MediaQuery.of(context).size.width * 0.45,
              width: MediaQuery.of(context).size.width * 0.45,
            ),
          ),
          Container(
            alignment: Alignment(0.0, -0.5),
            margin: const EdgeInsets.only(top: 5, bottom: 130),
            child: Text(
              "SURVIVAL ASIA MANAGER",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.060,
                  fontFamily: 'Arial'),
            ),
          ),
          LandingPageButton(Icon(CustomIcons.minecraftcreeper), "MINECRAFT"),
          LandingPageButton(Icon(CustomIcons.unturned), "UNTURNED"),
        ],
      ))
    ]));
  }
}
