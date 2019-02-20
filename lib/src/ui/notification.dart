import 'package:flutter/material.dart';
import 'package:pop_prototype/main.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/appbar_widget.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String view = 'activity';
  changeView(String viewName) {
    setState(() {
      view = viewName;
    });
  }

  Row notificationTabBar() {
    Color isActiveButtonColor(String viewName) {
      if (view == viewName) {
        return Colors.black;
      } else {
        return Colors.grey;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: () => changeView("activity"),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Activity',
                  style: TextStyle(
                    color: isActiveButtonColor("activity"),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => changeView("messages"),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Messages',
                  style: TextStyle(
                    color: isActiveButtonColor("messages"),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: NavigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Builder(
            builder: (context) {
              return AppbarWidget(Scaffold.of(context));
            },
          ),
          SizedBox(
            width: screenSize.width,
            height: 100.0,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Notifications',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 48.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          notificationTabBar(),
          Expanded(
            child: Builder(
              builder: (context) {
                if (view == "activity") {
                  return Text(
                    'activity',
                    textAlign: TextAlign.center,
                  );
                } else if (view == "messages") {
                  return Text(
                    'messages',
                    textAlign: TextAlign.center,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
