import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:pop_prototype/main.dart';
import '../ui/login.dart';
import '../ui/home.dart';
import '../ui/landing.dart';
import '../ui/auth_screen.dart';
import '../ui/camera.dart';
import '../ui/notification.dart';
import '../ui/search.dart';
import '../ui/user_profile_screen.dart';
import '../ui/video_player_screen.dart';
import '../ui/saved_screen.dart';
import '../ui/places_screen.dart';
import '../ui/feed_screen.dart';
import '../auth/email_auth.dart';

var usersHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //return UserScreen(params["id"][0]);
  return UserScreen();
});

var homeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //return UserScreen(params["id"][0]);
  return Home();
});

var landingHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //return UserScreen(params["id"][0]);
  return FutureBuilder(
      future: loginStatus(),
      builder: (context, snapshot) {
        if (snapshot != null) {
          return AuthScreen();
        } else {
          return FeedScreen();
        }
      });
});

var loginHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //return UserScreen(params["id"][0]);
  return Login();
});

var cameraHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //return UserScreen(params["id"][0]);
  return CameraScreen(cameras);
});

var videoPlayerHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return VideoPlayerScreen(
      "/" + params["path"][0].replaceAll(new RegExp(r"\*"), "\/"));
});

var notificationHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return NotificationScreen();
});

var searchHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SearchScreen();
});

var savedHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SavedScreen();
});

var placesHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return PlacesScreen();
});

var feedHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return FeedScreen();
});

void defineRoutes(Router router) {
  router.define("/UserProfile", handler: usersHandler);
  router.define("/Home", handler: homeHandler);
  router.define("/Login", handler: loginHandler);
  router.define("/", handler: landingHandler);
  router.define("/CameraScreen", handler: cameraHandler);
  router.define("/SavedScreen", handler: savedHandler);
  router.define("/SearchScreen", handler: searchHandler);
  router.define("/PlacesScreen", handler: placesHandler);
  router.define("/NotificationScreen", handler: notificationHandler);
  router.define("/FeedScreen", handler: feedHandler);
  router.define("/VideoPlayer/:path", handler: videoPlayerHandler);
}
