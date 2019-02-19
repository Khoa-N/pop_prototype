import 'package:flutter/material.dart';
import 'package:pop_prototype/main.dart';
import '../widgets/navigation_drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Home'),
      ),
      endDrawer: NavigationDrawer(),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.lightBlue,
              child: Center(
                child: Text('Hello'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
