import 'package:flutter/material.dart';
import 'package:pop_prototype/main.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("Header"),
          ),
          ListTile(
            leading: Icon(Icons.play_arrow),
            title: Text('Feed'),
            onTap: () {
              router.navigateTo(context, '/Home');
            },
          ),
          ListTile(
            leading: Icon(Icons.videocam),
            title: Text('Record'),
            onTap: () {
              router.navigateTo(context, '/CameraScreen');
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () {
              router.navigateTo(context, '/SearchScreen');
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: () {
              router.navigateTo(context, '/NotificationScreen');
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Saved'),
            onTap: () {
              router.navigateTo(context, '/SavedScreen');
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Places'),
            onTap: () {
              router.navigateTo(context, '/PlacesScreen');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('User Profile'),
            onTap: () {
              router.navigateTo(context, '/UserProfile');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // bloc.logout();
              router.navigateTo(context, '/Home');
            },
          ),
        ],
      ),
    );
  }
}
