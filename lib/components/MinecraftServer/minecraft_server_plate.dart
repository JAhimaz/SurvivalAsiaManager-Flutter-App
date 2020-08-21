import 'package:ServerStats/models/minecraft_server.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class MinecraftServerPlate extends StatelessWidget {
  final MinecraftServer server;

  const MinecraftServerPlate({Key key, @required this.server})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 0.8,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [Color(0xFF3a1c71), Color(0xFFaa076b)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0, 0.9],
                  tileMode: TileMode.clamp)),
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultWidth * 2,
                  vertical: SizeConfig.defaultHeight * 2),
              child: Column(
                children: [
                  Row(children: [
                    Text("Status: ",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white))
                  ]),
                  Row(children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      child: Text("ONLINE",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 30)),
                    ),
                  ]),
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                        child: Text("IP: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white, fontSize: 18)),
                      ),
                      Text("192.168.0.1",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.yellow, fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                        child: Text("Version: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white, fontSize: 18)),
                      ),
                      Text("1.16.2",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.yellow, fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                        child: Text("Players Online: ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white, fontSize: 18)),
                      ),
                    ],
                  ),
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                      child: Text("0",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30)),
                    ),
                    Text(" / " + "50",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 30)),
                  ]),
                ],
              )),
        ));
  }
}

// If possible Make Row A StateLess
