import 'package:flutter/material.dart';
import 'package:pop_prototype/main.dart';

class AppbarWidget extends StatefulWidget {
  ScaffoldState scaffoldState;
  AppbarWidget(this.scaffoldState);
  @override
  _AppbarWidgetState createState() => _AppbarWidgetState(this.scaffoldState);
}

class _AppbarWidgetState extends State<AppbarWidget> {
  ScaffoldState scaffoldState;
  _AppbarWidgetState(this.scaffoldState);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTapDown: (_) {},
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(Icons.share),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTapDown: (_) {
                scaffoldState.openEndDrawer();
              },
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(Icons.list),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
