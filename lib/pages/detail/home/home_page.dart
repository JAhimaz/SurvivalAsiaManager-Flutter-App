import 'package:ServerStats/components/MinecraftServer/minecraft_server_plate.dart';
import 'package:ServerStats/models/minecraft_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../size_config.dart';
import 'components/home_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFaa076b),
          leading: Icon(Icons.arrow_back,
              color: Colors.white, size: SizeConfig.defaultHeight * 3),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment
                  .topCenter, // 10% of the width, so there are ten blinds.
              colors: [const Color(0xFF3a1c71), const Color(0xFFaa076b)],
              stops: [0, 0.9], // whitish to gray
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [HomeHeader(), _buildBalance(), _buildServerList()],
            ),
          ),
        ));
  }

  _buildBalance() => Container(
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultWidth * 2,
                vertical: SizeConfig.defaultHeight * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Server: ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white70),
                ),
                SizedBox(height: SizeConfig.defaultHeight),
                Text(
                  "PlaceHolder",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            )),
      );

  _buildServerList() => Container(
      margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 10,
            offset: Offset(0, -6),
          )
        ],
      ),
      child: MinecraftServerPlate(server: servers[0]));
}
