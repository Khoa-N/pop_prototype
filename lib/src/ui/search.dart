import 'package:flutter/material.dart';
import 'package:pop_prototype/main.dart';
import '../widgets/navigation_drawer.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
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
