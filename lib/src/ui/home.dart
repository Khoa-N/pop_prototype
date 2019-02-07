import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.lightBlue,
              child: Center(
                child: Text('Hello'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: mediaQuery.height * 0.075,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(Icons.home),
                      onTap: () {
                        Navigator.pushNamed(context, '/Home');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.search),
                      onTap: () {
                        Navigator.pushNamed(context, '/Home');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.camera_enhance),
                      onTap: () {
                        Navigator.pushNamed(context, '/Home');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.notification_important),
                      onTap: () {
                        Navigator.pushNamed(context, '/Home');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.person),
                      onTap: () {
                        Navigator.pushNamed(context, '/UserProfile');
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
