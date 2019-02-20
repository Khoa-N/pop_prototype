import 'package:flutter/material.dart';
import 'package:pop_prototype/main.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/appbar_widget.dart';
import '../util/format.dart';

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
  String country = 'United States';
  String state = 'New York';
  String city = 'New York';
  int locations = 20;
  int favorites = 123456;
  int fans = 9876;
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
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     '@' + this.username,
      //   ),
      //   leading: GestureDetector(
      //     onTapDown: (_) {},
      //     child: Icon(Icons.share),
      //   ),
      // ),
      endDrawer: NavigationDrawer(),
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return AppbarWidget(Scaffold.of(context));
                  },
                ),
                SizedBox(
                  height: 140.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        left: 0.1 * screenSize.width,
                        top: 20.0,
                        child: profilePicture(),
                      ),
                      Positioned(
                        left: 0.1 * screenSize.width + 170,
                        top: 20.0,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '$firstName $lastName\n\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                              TextSpan(
                                text: '$country\n\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                              ),
                              TextSpan(
                                text: following ? 'following' : 'follow',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: OutlineButton(
                        color: Colors.lightBlue[300],
                        borderSide: BorderSide(color: Colors.black),
                        highlightElevation: 4.0,
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                        onPressed: () {
                          router.navigateTo(context, "/Home"); // To be Changed
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${numFormat(this.favorites)}\n\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                              ),
                              TextSpan(
                                text: 'Favorites\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: OutlineButton(
                        color: Colors.lightBlue[300],
                        borderSide: BorderSide(color: Colors.black),
                        highlightElevation: 4.0,
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                        onPressed: () {
                          router.navigateTo(context, "/Home"); // To be Changed
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${numFormat(this.locations)}\n\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                              ),
                              TextSpan(
                                text: 'Locations\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: OutlineButton(
                        color: Colors.lightBlue[300],
                        borderSide: BorderSide(color: Colors.black),
                        highlightElevation: 4.0,
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                        onPressed: () {
                          router.navigateTo(context, "/Home"); // To be Changed
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${numFormat(this.fans)}\n\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                              ),
                              TextSpan(
                                text: 'Fans\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(100, (index) {
                      return GridTile(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                              ),
                              child: Text(
                                '$index',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
