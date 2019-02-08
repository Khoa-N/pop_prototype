import 'package:flutter/material.dart';
import '../widgets/map_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key key})
      : super(
            key:
                key); //this is just envoking the constructor of the inherited class.
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
    with SingleTickerProviderStateMixin {
  String username = 'user';
  String firstName = 'First';
  String lastName = 'Last';
  int level = 20;
  int fans = 123456;
  int links = 9876;
  bool hasProfilePicture = true;
  bool favorite = false;
  bool following = true;
  bool verified = true;
  String coverPhotoUrl = 'url';
  String view = 'info';

  changeView(String viewName) {
    setState(() {
      view = viewName;
    });
  }

  Row profileTabBar() {
    Color isActiveButtonColor(String viewName) {
      if (view == viewName) {
        return Colors.blueAccent;
      } else {
        return Colors.black26;
      }
    }

    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.info,
            color: isActiveButtonColor("info"),
          ),
          onPressed: () {
            changeView("info");
          },
        ),
        new IconButton(
          icon: new Icon(
            Icons.local_movies,
            color: isActiveButtonColor("reviews"),
          ),
          onPressed: () {
            changeView("reviews");
          },
        ),
        new IconButton(
          icon: new Icon(
            Icons.bookmark,
            color: isActiveButtonColor("collections"),
          ),
          onPressed: () {
            changeView("collections");
          },
        ),
        new IconButton(
          icon: new Icon(
            Icons.place,
            color: isActiveButtonColor("map"),
          ),
          onPressed: () {
            changeView("map");
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '@' + this.username,
        ),
        leading: Icon(Icons.settings),
        actions: <Widget>[
          Container(
            child: GestureDetector(
              onTapDown: (_) {
                setState(() {
                  favorite = !favorite;
                });
              },
              child: Icon(favorited()),
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'Block',
                  child: Text('Block'),
                ),
                PopupMenuItem(
                  value: 'Report',
                  child: Text('Report'),
                ),
                PopupMenuItem(
                  value: 'Mute',
                  child: Text('Mute'),
                ),
                PopupMenuItem(
                  value: 'Copy profile URL',
                  child: Text('Copy profile URL'),
                ),
                PopupMenuItem(
                  value: 'Share this Profile',
                  child: Text('Share this Profile'),
                ),
              ];
            },
            onSelected: menuSelected,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                /* Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Level: ${numFormat(this.level)}',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Fans: ${numFormat(this.fans)}',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Links: ${numFormat(this.links)}',
                        ), 
                ),
              ],
            ),
          ), */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        SizedBox(
                          width: mediaQuery.width,
                          height: mediaQuery.height * 0.3,
                          child: banner(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(firstName + ' ' + lastName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        verify(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      hasProfilePicture = !hasProfilePicture;
                                    });
                                  },
                                  child: profilePicture(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                profileTabBar(),
                SizedBox(
                  width: mediaQuery.width,
                  height: mediaQuery.height * 0.43,
                  child: Builder(
                    builder: (context) {
                      if (view == "info") {
                        return Text(
                          'info',
                          textAlign: TextAlign.center,
                        );
                      } else if (view == "reviews") {
                        return Text(
                          'reviews',
                          textAlign: TextAlign.center,
                        );
                      } else if (view == "collections") {
                        return Text(
                          'collections',
                          textAlign: TextAlign.center,
                        );
                      } else if (view == "map") {
                        return MapWidget();
                      }
                    },
                  ),
                ),
              ],
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
                        Navigator.pushNamed(context, '/SearchScreen');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.camera_enhance),
                      onTap: () {
                        Navigator.pushNamed(context, '/CameraScreen');
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.notification_important),
                      onTap: () {
                        Navigator.pushNamed(context, '/NotificationScreen');
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

  Widget verify() => this.verified ? Icon(Icons.check_circle) : Container();

  IconData favorited() =>
      this.favorite ? Icons.favorite : Icons.favorite_border;

  Widget menuSelected(value) {
    switch (value) {
      case 'Block':
        return AlertDialog(
          title: Text('${this.username} has been blocked.'),
        );
      case 'Report':
        return AlertDialog(
          title: Text('${this.username} has been reported.'),
        );
      case 'Mute':
        return AlertDialog(
          title: Text('${this.username} has been muted.'),
        );
      case 'Copy profile URL':
        return AlertDialog(
          title: Text(
              '${this.username}\'s profile url is www.pop.com/${this.username}'),
        );
      case 'Share this Profile':
        return AlertDialog(
          title:
              Text('${this.username}\'s profile has been shared everywhere.'),
        );
      default:
        return null;
    }
  }

  Widget socialmediabar() {}

  Widget banner() {
    return this.coverPhotoUrl == ''
        ? coverPhotoGradient()
        : Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage('assets/cover.jpg'),
              fit: BoxFit.cover,
            )),
          );
  }

  Gradient coverPhotoGradient() {
    return LinearGradient(
      colors: [Colors.pink, Colors.yellow, Colors.purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  Widget profilePicture() {
    if (hasProfilePicture) {
      return Container(
        width: 120.0,
        height: 120.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/profile_picture.png'),
          ),
        ),
      );
    } else {
      return CircleAvatar(
        radius: 60.0,
        child: Text(
            '${this.firstName[0].toUpperCase()}${this.lastName[0].toUpperCase()}'),
      );
    }
  }
}

String numFormat(int) {
  if (int < 1000) {
    return int.toString();
  } else if (int < 10000) {
    return (int ~/ 1000).toString() + ',' + (int % 1000).toString();
  } else if (int < 100000) {
    return (int ~/ 1000).toString() +
        '.' +
        ((int % 1000) ~/ 100).toString() +
        'K';
  } else if (int < 1000000) {
    return (int ~/ 1000).toString() + 'K';
  } else
    return (int ~/ 1000000).toString() + 'M';
}
