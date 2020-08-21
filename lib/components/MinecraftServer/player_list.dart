import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../size_config.dart';

class PlayerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              'Player List',
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
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
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
                    rows: [],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
