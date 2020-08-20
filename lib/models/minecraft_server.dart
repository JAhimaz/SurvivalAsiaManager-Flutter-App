import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'minecraftPlayerData.dart';

class MinecraftServer {
  String serverName, serverVersion, serverStatus;
  List<MCPlayerData> playerList;
  List<String> pluginList;
  int playersOnline, maxPlayers;

  MinecraftServer(
      {this.serverName,
      this.serverVersion,
      this.serverStatus,
      this.playerList,
      this.pluginList,
      this.playersOnline,
      this.maxPlayers});
}
