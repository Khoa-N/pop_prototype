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
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     Stack(
//       alignment: Alignment.topCenter,
//       children: <Widget>[
//         SizedBox(
//           width: mediaQuery.width,
//           height: mediaQuery.height * 0.3,
//           child: banner(),
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//               top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius:
//                     BorderRadius.all(Radius.circular(5.0)),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(firstName + ' ' + lastName,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             )),
//                         verify(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 5.0),
//                 child: GestureDetector(
//                   onTapDown: (_) {
//                     setState(() {
//                       hasProfilePicture = !hasProfilePicture;
//                     });
//                   },
//                   child: profilePicture(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ],
// ),
// profileTabBar(),
// SizedBox(
//   width: mediaQuery.width,
//   height: mediaQuery.height * 0.43,
//   child: Builder(
//     builder: (context) {
//       if (view == "info") {
//         return Text(
//           'info',
//           textAlign: TextAlign.center,
//         );
//       } else if (view == "reviews") {
//         return Text(
//           'reviews',
//           textAlign: TextAlign.center,
//         );
//       } else if (view == "collections") {
//         return Text(
//           'collections',
//           textAlign: TextAlign.center,
//         );
//       } else if (view == "map") {
//         return MapWidget();
//       }
//     },
//   ),
// ),

// Widget verify() => this.verified ? Icon(Icons.check_circle) : Container();

// IconData favorited() => this.favorite ? Icons.favorite : Icons.favorite_border;

// Widget menuSelected(value) {
//   switch (value) {
//     case 'Block':
//       return AlertDialog(
//         title: Text('${this.username} has been blocked.'),
//       );
//     case 'Report':
//       return AlertDialog(
//         title: Text('${this.username} has been reported.'),
//       );
//     case 'Mute':
//       return AlertDialog(
//         title: Text('${this.username} has been muted.'),
//       );
//     case 'Copy profile URL':
//       return AlertDialog(
//         title: Text(
//             '${this.username}\'s profile url is www.pop.com/${this.username}'),
//       );
//     case 'Share this Profile':
//       return AlertDialog(
//         title: Text('${this.username}\'s profile has been shared everywhere.'),
//       );
//     default:
//       return null;
//   }
// }

// Widget socialmediabar() {}

// Widget banner() {
//   return this.coverPhotoUrl == ''
//       ? coverPhotoGradient()
//       : Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//             image: ExactAssetImage('assets/cover.jpg'),
//             fit: BoxFit.cover,
//           )),
//         );
// }

// Gradient coverPhotoGradient() {
//   return LinearGradient(
//     colors: [Colors.pink, Colors.yellow, Colors.purple],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   );
// }
