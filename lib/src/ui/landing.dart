import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';
import '../const/text_const.dart';
import 'package:pop_prototype/main.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          child: Container(
            decoration: landingBackground(),
          ),
        ),
        Positioned(
          top: mediaQuery.size.height * 0.35,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'WELCOME TO\n\n', style: landingSubtitleStyle),
                TextSpan(text: 'POP', style: landingTitleStyle),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: mediaQuery.size.height * 0.05,
          child: Column(
            children: [
              OutlineButton(
                color: Colors.lightBlue[300],
                borderSide: BorderSide(color: Colors.white),
                highlightElevation: 4.0,
                clipBehavior: Clip.none,
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                onPressed: () {
                  router.navigateTo(context, "/Home");
                },
                child: RichText(
                  text: TextSpan(
                    text: 'ACCEPT AND CONTINUE',
                    style: landingSubtitleStyle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  width: mediaQuery.size.width * 0.9,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'By tapping Accept and Continue, you agree to our ',
                          style: landingBodyStyle,
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: landingBoldBodyStyle,
                          /* recognizer: TapGestureRecognizer()
                            ..onTap =
                                _launchURL('https://popofficialapp.com'), */
                        ),
                        TextSpan(
                          text: ' and ',
                          style: landingBodyStyle,
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: landingBoldBodyStyle,
                          /* recognizer: TapGestureRecognizer()
                            ..onTap =
                                _launchURL('https://popofficialapp.com'), */
                        ),
                        TextSpan(
                          text: '.',
                          style: landingBodyStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

BoxDecoration landingBackground() => BoxDecoration(
        image: DecorationImage(
      image: ExactAssetImage('assets/crepe.jpg'),
      fit: BoxFit.cover,
    ));

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
