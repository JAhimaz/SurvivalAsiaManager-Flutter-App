import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../size_config.dart';
import 'components/home_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.2);
    ovalPath.quadraticBezierTo(
        width * 0.65, height * 0.25, width * 0.6, width * 0.6);
    paint.color = Color(0xff9F86C0);
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
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
          backgroundColor: Color(0xFFf45c43),
          leading: Icon(Icons.arrow_back,
              color: Colors.white, size: SizeConfig.defaultHeight * 4),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment
                  .topCenter, // 10% of the width, so there are ten blinds.
              colors: [
                const Color(0xFFeb3349),
                const Color(0xFFf45c43)
              ], // whitish to gray
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [HomeHeader(), _buildBalance()],
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
                  "ServerName PlaceHolder",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white70),
                )
              ],
            )),
      );
}
