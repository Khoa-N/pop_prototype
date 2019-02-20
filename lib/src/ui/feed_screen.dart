import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/appbar_widget.dart';
import '../util/format.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String username = 'Liz';
  String caption =
      'honey on chicken @breakfastklub with @khoa @brendan @adrean plus strawberries & waffles!';
  int views = 10000;
  int likes = 989;
  bool liked = false;
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Scaffold(
            backgroundColor: Colors.lightBlue,
            endDrawer: NavigationDrawer(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return AppbarWidget(Scaffold.of(context));
                  },
                ),
                Stack(
                  children: <Widget>[
                    Positioned(
                      child: IgnorePointer(
                        ignoring: false,
                        child: SizedBox(
                          width: screenSize.width,
                          height: screenSize.height - 50,
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: SizedBox(
                              width: screenSize.width,
                              height: screenSize.height * 0.15,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  Container(
                                    decoration:
                                        BoxDecoration(color: Colors.black54),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 75.0,
                                          height: 75.0,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 20.0),
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.lightBlue,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenSize.width * 0.7,
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  // text: '$firstName $lastName\n\n',
                                                  text: '@$username\n',
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  // text: '$country\n\n',
                                                  text: '$caption',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: IgnorePointer(
                        ignoring: false,
                        child: SizedBox(
                          width: screenSize.width,
                          height: screenSize.height - 50,
                          child: Align(
                            alignment: FractionalOffset.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${numFormat(views)}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.0),
                                  ),
                                  GestureDetector(
                                    child: liked
                                        ? Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                    onTap: () {
                                      setState(() {
                                        liked ? likes -= 1 : likes += 1;
                                        liked = !liked;
                                      });
                                    },
                                  ),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${numFormat(likes)}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.0),
                                  ),
                                  GestureDetector(
                                    child: saved
                                        ? Icon(
                                            Icons.bookmark,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.bookmark_border,
                                            color: Colors.white,
                                          ),
                                    onTap: () {
                                      setState(() {
                                        saved = !saved;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
