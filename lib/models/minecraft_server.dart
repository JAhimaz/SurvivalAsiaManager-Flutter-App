import 'dart:convert';
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
      serverName: "Bungeecord",
      serverIP: "192.168.0.1",
      serverVersion: "1.16.2",
      serverStatus: "ON",
      playerList: [],
      pluginList: [],
      playersOnline: 14,
      maxPlayers: 500),
  MinecraftServer(
      id: 2,
      serverName: "Hub",
      serverIP: "192.168.0.2",
      serverVersion: "1.16.2",
      serverStatus: "ON",
      playerList: [],
      pluginList: [],
      playersOnline: 3,
      maxPlayers: 500),
  MinecraftServer(
      id: 3,
      serverName: "Slimefun Survival",
      serverIP: "192.168.0.2",
      serverVersion: "1.16.2",
      serverStatus: "ON",
      playerList: [],
      pluginList: [],
      playersOnline: 5,
      maxPlayers: 500),
  MinecraftServer(
      id: 4,
      serverName: "Vanilla Survival",
      serverIP: "192.168.0.2",
      serverVersion: "1.16.2",
      serverStatus: "OFF",
      playerList: [],
      pluginList: [],
      playersOnline: 9,
      maxPlayers: 500),
];
