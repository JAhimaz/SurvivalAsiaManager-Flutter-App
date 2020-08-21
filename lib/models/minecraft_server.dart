import 'dart:convert';
import 'dart:math';
import 'package:random_string/random_string.dart';
import 'package:http/http.dart' as http;

import 'minecraftPlayerData.dart';

class UserManagement {
  List<MCPlayerData> loadUsersFromServer(var playerList) {
    List<MCPlayerData> createdPlayerList = [];

    for (var i = 0; i < playerList.length; i++) {
      createdPlayerList.add(MCPlayerData(playerName: playerList[i]));
    }

    return createdPlayerList;
  }
}

class MakeMinecraftServer {
  Future<MinecraftServer> fetchServerDetails(
      String serverIP, int serverPort, String serverName) async {
    final response = await http.get('https://api.minetools.eu/query/' +
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
      throw Exception('Failed to Load Server');
    }
  }
}

class MinecraftServer {
  String serverName, serverIP, serverVersion, serverStatus;
  List<MCPlayerData> playerList = [];
  List<String> pluginList;
  int playersOnline, maxPlayers;

  MinecraftServer(
      {this.serverName,
      this.serverIP,
      this.serverVersion,
      this.serverStatus,
      this.playerList,
      this.pluginList,
      this.playersOnline,
      this.maxPlayers});

  factory MinecraftServer.fromJson(Map<String, dynamic> json, String serverIP,
      int serverPort, String serverName) {
    if (json.containsKey('error')) {
      MinecraftServer created = MinecraftServer(
          serverName: serverName,
          serverIP: serverIP + ":" + serverPort.toString(),
          serverVersion: "Unavailable",
          serverStatus: json['status'],
          playerList: [],
          pluginList: [],
          playersOnline: 0,
          maxPlayers: 0);

      servers.add(created);
      return created;
    } else {
      List<dynamic> tempList = (json['Playerlist']);

      List<MCPlayerData> createdPlayerList = [];

      for (int i = 0; i < tempList.length; i++) {
        createdPlayerList.add(MCPlayerData(playerName: tempList[i]));
      }

      MinecraftServer created = MinecraftServer(
          serverName: serverName,
          serverIP: serverIP + ":" + serverPort.toString(),
          serverVersion: json['Version'],
          serverStatus: json['status'],
          playerList: createdPlayerList,
          pluginList: [],
          playersOnline: json['Players'],
          maxPlayers: json['MaxPlayers']);

      servers.add(created);
      return created;
    }
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
