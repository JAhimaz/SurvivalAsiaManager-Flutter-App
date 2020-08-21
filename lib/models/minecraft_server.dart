import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'minecraftPlayerData.dart';

class MinecraftServer {
  String serverName, serverIP, serverVersion, serverStatus;
  List<MCPlayerData> playerList;
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
      serverName: "Test Server",
      serverIP: "192.168.0.1",
      serverVersion: "1.16.2",
      serverStatus: "Online",
      playerList: [],
      pluginList: [],
      playersOnline: 5,
      maxPlayers: 10),
  MinecraftServer(
      id: 2,
      serverName: "Test Server 2",
      serverIP: "192.168.0.2",
      serverVersion: "1.16.2",
      serverStatus: "Online",
      playerList: [],
      pluginList: [],
      playersOnline: 6,
      maxPlayers: 500),
];
