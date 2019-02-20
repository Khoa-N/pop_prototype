import 'package:flutter/material.dart';
import 'package:pop_prototype/main.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/appbar_widget.dart';

class SearchScreen extends StatelessWidget {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: Icon(Icons.search, size: 50.0),
                  ),
                  SizedBox(
                    height: 100.0,
                    width: screenSize.width * 0.7,
                    child: TextField(
                      // onChanged: bloc.changeEmail,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'SEARCH',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 75.0,
                        height: 75.0,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                        width: screenSize.width * 0.7,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                // text: '$firstName $lastName\n\n',
                                text: 'firstName lastName\n\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                              TextSpan(
                                // text: '$country\n\n',
                                text: 'country\n\n',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
