import 'dart:convert';
import 'dart:math';
import 'package:random_string/random_string.dart';
import 'package:http/http.dart' as http;

import 'minecraftPlayerData.dart';

class UserManagement {
  List<MCPlayerData> factoryGenerateUsers() {
    var random = new Random();
    int numberOfGeneratedUsers = random.nextInt(10);

    List<MCPlayerData> playerList = [];

    for (var i = 0; i < numberOfGeneratedUsers; i++) {
      playerList.add(MCPlayerData(
          playerName: randomAlpha(9),
          playerUUID: randomAlphaNumeric(4) +
              "-" +
              randomAlphaNumeric(4) +
              "-" +
              randomAlphaNumeric(4) +
              "-" +
              randomAlphaNumeric(4)));
    }

    return playerList;
  }
}

class MakeMinecraftServer {
  Future<MinecraftServer> fetchServerDetails(
      String serverIP, int serverPort, String serverName) async {
    final response = await http.get('https://api.minetools.eu/ping/' +
        serverIP +
        '/' +
        serverPort.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MinecraftServer.fromJson(
          json.decode(response.body), serverIP, serverPort, serverName);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to Load Server  ');
    }
  }
}

class MinecraftServer {
  String serverName, serverIP, serverVersion, serverStatus;
  List<MCPlayerData> playerList = [];
  List<String> pluginList;
  int id, playersOnline, maxPlayers;

  MinecraftServer(
      {this.id,
      this.serverName,
      this.serverIP,
      this.serverVersion,
      this.serverStatus,
      this.playerList,
      this.pluginList,
      this.playersOnline,
      this.maxPlayers});

  factory MinecraftServer.fromJson(Map<String, dynamic> json, String serverIP,
      int serverPort, String serverName) {
    MinecraftServer created = MinecraftServer(
        id: 0,
        serverName: serverName,
        serverIP: serverIP + ":" + serverPort.toString(),
        serverVersion: json['version']['name'],
        serverStatus: "ON",
        playerList: UserManagement().factoryGenerateUsers(),
        pluginList: [],
        playersOnline: json['players']['online'],
        maxPlayers: json['players']['max']);

    servers.add(created);
    print(servers.length);
    return created;
  }
}

List<MinecraftServer> servers = [
  // MinecraftServer(
  //     id: 1,
  //     serverName: "Bungeecord",
  //     serverIP: "192.168.0.1",
  //     serverVersion: "1.16.2",
  //     serverStatus: "ON",
  //     playerList: UserManagement().factoryGenerateUsers(),
  //     pluginList: [],
  //     playersOnline: 5,
  //     maxPlayers: 20),
// MinecraftServer(
//     id: 2,
//     serverName: "Hub",
//     serverIP: "192.168.0.2",
//     serverVersion: "1.16.2",
//     serverStatus: "ON",
//     playerList: UserManagement().factoryGenerateUsers(),
//     pluginList: [],
//     playersOnline: 3,
//     maxPlayers: 500),
// MinecraftServer(
//     id: 3,
//     serverName: "Slimefun Survival",
//     serverIP: "192.168.0.2",
//     serverVersion: "1.16.2",
//     serverStatus: "ON",
//     playerList: UserManagement().factoryGenerateUsers(),
//     pluginList: [],
//     playersOnline: 5,
//     maxPlayers: 500),
// MinecraftServer(
//     id: 4,
//     serverName: "Vanilla Survival",
//     serverIP: "192.168.0.2",
//     serverVersion: "1.16.2",
//     serverStatus: "OFF",
//     playerList: UserManagement().factoryGenerateUsers(),
//     pluginList: [],
//     playersOnline: 9,
//     maxPlayers: 500),
];
