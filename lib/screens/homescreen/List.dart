// import 'package:flutter/material.dart';
// import 'package:haifma_v2/services/authservice.dart';
//
// class ListUser extends StatefulWidget {
//   @override
//   _ListUserState createState() => _ListUserState();
// }
//
// class _ListUserState extends State<ListUser> {
//
//   final AuthService _auth = AuthService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.green[600],
//         appBar: AppBar(
//         title: Text('HOME!!',
//         style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,color: Colors.black
//     )),
//     backgroundColor:  Colors.lightGreen[200],
//     elevation: 0.0,
//     actions: <Widget>[
//     FlatButton.icon(
//     label: Text('Logout'),
//     icon: Icon(Icons.logout),
//     onPressed: () async {
//     await _auth.signOut();
//     },
//     )
//     ],
//     ),
//       body: ListView(
//         padding: EdgeInsets.all(8);
//          Row(
//           children: <Widget>[
//             RaisedButton(
//               child: Text('Add User',
//                   style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,color: Colors.black )),
//               onPressed: () async {
//
//               }
//           ),
//
//     RaisedButton(
//     child: Text('Rea User',
//     style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,color: Colors.black )),
//     onPressed: () async {
//
//     }
//     ),
//
//         ],
//       ),
//     ),
//     );
//   }
// }
