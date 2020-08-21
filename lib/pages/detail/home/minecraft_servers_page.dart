import 'package:ServerStats/components/MinecraftServer/minecraft_server_plate.dart';
import 'package:ServerStats/models/minecraft_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../size_config.dart';
import 'components/minecraft_server_header.dart';

class MinecraftServerPage extends StatefulWidget {
  @override
  _MinecraftServerPageState createState() => _MinecraftServerPageState();
}

class PlayerList {
  List<DataRow> dataRows = [];

  List<DataRow> getPlayerList(int _currentIndex) {
    if (servers[_currentIndex].playerList.length == 0) {
      dataRows.add(DataRow(cells: [
        DataCell(Text("No Users", style: TextStyle(color: Colors.white))),
        DataCell(Text("No Users", style: TextStyle(color: Colors.white)))
      ]));

      return dataRows;
    }
    for (var i = 0; i < servers[_currentIndex].playerList.length; i++) {
      dataRows.add(DataRow(cells: [
        DataCell(Text(servers[_currentIndex].playerList[i].playerName,
            style: TextStyle(color: Colors.white))),
        DataCell(Text(servers[_currentIndex].playerList[i].playerUUID,
            style: TextStyle(color: Colors.white)))
      ]));
    }
    return dataRows;
  }
}

class _MinecraftServerPageState extends State<MinecraftServerPage> {
  PageController pageController = PageController(viewportFraction: 1.0);

  int _currentIndex = 0;
  List<DataRow> dataRows;

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
          title: Text("Minecraft Servers",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white)),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.add,
                  color: Colors.white, size: SizeConfig.defaultHeight * 4),
            )
          ],
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
          child: Stack(
            children: [
              Column(
                children: [
                  MinecraftServerHeader(),
                  _buildBalance(),
                  _buildServerList(),
                  _buildPageIndicator(),
                ],
              ),
              _buildPlayerList(),
            ],
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
                  "${servers[_currentIndex].serverName}",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            )),
      );
  _buildPlayerList() => SafeArea(
        child: SlidingSheet(
          elevation: 2,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.08, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          headerBuilder: (context, state) {
            return Container(
              height: 56,
              width: double.infinity,
              color: Color(0xFFaa076b),
              alignment: Alignment.center,
              child: Text(
                'Online Players in ${servers[_currentIndex].serverName}',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
            );
          },
          builder: (context, state) {
            return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment
                        .topCenter, // 10% of the width, so there are ten blinds.
                    colors: [const Color(0xFF3a1c71), const Color(0xFFaa076b)],
                    stops: [0, 0.9], // whitish to gray
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
                height: SizeConfig.screenHeight,
                child: Container(
                  width: SizeConfig.screenWidth,
                  //Temporary Till A For Loop Is Made
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label: Text(
                          "User",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        )),
                        DataColumn(
                            label: Text("UUID",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15))),
                      ],
                      rows: PlayerList().getPlayerList(_currentIndex),
                    ),
                  ),
                ));
          },
        ),
      );
  _buildServerList() => Expanded(
        child: PageView.builder(
            itemCount: servers.length,
            controller: pageController,
            onPageChanged: (index) => setState(() {
                  _currentIndex = index;
                }),
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 20),
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
                child: MinecraftServerPlate(server: servers[index]),
              );
            }),
      );
  _buildPageIndicator() => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultWidth * 2,
            vertical: SizeConfig.defaultHeight * 2),
        child: SmoothPageIndicator(
          controller: pageController,
          count: servers.length,
          effect: WormEffect(
              dotHeight: SizeConfig.defaultHeight,
              dotWidth: SizeConfig.defaultWidth,
              dotColor: Colors.grey[800],
              activeDotColor: Colors.white),
        ),
      );
}
