import 'package:flutter/material.dart';
import 'package:pop_prototype/main.dart';
import '../widgets/navigation_drawer.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved'),
      ),
      endDrawer: NavigationDrawer(),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.red,
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
