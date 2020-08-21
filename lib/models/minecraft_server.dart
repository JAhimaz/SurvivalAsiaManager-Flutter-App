import 'dart:math';
import 'package:random_string/random_string.dart';

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
}

List<MinecraftServer> servers = [
  MinecraftServer(
      id: 1,
      serverName: "Bungeecord",
      serverIP: "192.168.0.1",
      serverVersion: "1.16.2",
      serverStatus: "ON",
      playerList: UserManagement().factoryGenerateUsers(),
      pluginList: [],
      playersOnline: 14,
      maxPlayers: 500),
  MinecraftServer(
      id: 2,
      serverName: "Hub",
      serverIP: "192.168.0.2",
      serverVersion: "1.16.2",
      serverStatus: "ON",
      playerList: UserManagement().factoryGenerateUsers(),
      pluginList: [],
      playersOnline: 3,
      maxPlayers: 500),
  MinecraftServer(
      id: 3,
      serverName: "Slimefun Survival",
      serverIP: "192.168.0.2",
      serverVersion: "1.16.2",
      serverStatus: "ON",
      playerList: UserManagement().factoryGenerateUsers(),
      pluginList: [],
      playersOnline: 5,
      maxPlayers: 500),
  MinecraftServer(
      id: 4,
      serverName: "Vanilla Survival",
      serverIP: "192.168.0.2",
      serverVersion: "1.16.2",
      serverStatus: "OFF",
      playerList: UserManagement().factoryGenerateUsers(),
      pluginList: [],
      playersOnline: 9,
      maxPlayers: 500),
];
