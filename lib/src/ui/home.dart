import 'package:flutter/material.dart';
import 'package:pop_prototype/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
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
                        router.navigateTo(context, '/Home');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.search),
                      onTap: () {
                        router.navigateTo(context, '/SearchScreen');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.camera_enhance),
                      onTap: () {
                        router.navigateTo(context, '/CameraScreen');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.notification_important),
                      onTap: () {
                        router.navigateTo(context, '/NotificationScreen');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.person),
                      onTap: () {
                        router.navigateTo(context, '/UserProfile');
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
