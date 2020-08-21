import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class MinecraftServerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultWidth * 2,
          vertical: SizeConfig.defaultHeight * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Survival Asia Network",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Material(
            elevation: 18.0,
            shape: CircleBorder(),
            shadowColor: Colors.black.withOpacity(0.5),
            color: Colors.transparent,
            child: CircleAvatar(
              radius: SizeConfig.defaultHeight * 3.5,
              child: Image.asset("assets/images/survivalasia_logo.png"),
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
