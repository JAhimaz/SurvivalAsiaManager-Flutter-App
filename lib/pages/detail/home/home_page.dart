import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../size_config.dart';

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
      backgroundColor: Color(0xff231942),
      appBar: AppBar(
        backgroundColor: Color(0xff231942),
        leading: Icon(Icons.arrow_back,
            color: Colors.white, size: SizeConfig.defaultHeight * 4),
      ),
      body: Column(),
    );
  }
}
