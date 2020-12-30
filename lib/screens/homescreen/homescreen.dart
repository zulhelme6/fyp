import 'package:flutter/material.dart';
import 'package:haifma_v2/services/authservice.dart';

class homescreen extends StatelessWidget {

final AuthService _auth = AuthService();
//final formkey = GlobalKey<FormState>();
 // Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        title: Text('HOME!!',
        style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,color: Colors.black
        )),
        backgroundColor:  Colors.lightGreen[200],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            label: Text('Logout'),
            icon: Icon(Icons.logout),
            onPressed: () async {
          await _auth.signOut();
          },
        )
    ],
    ),
      body: Container(
          padding: EdgeInsets.all(8),
          //  key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                RaisedButton(

                  color: Colors.greenAccent[100],
                  child: Text('View Profile'
                  ),
                  onPressed: () async {

                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.greenAccent[100],
                  child: Text('View Promotion',
                    style: TextStyle(  fontStyle: FontStyle.italic,color: Colors.black),
                  ),
                  onPressed: () async {

                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(

                  color: Colors.greenAccent[100],
                  child: Text('Add Profile'
                  ),
                  onPressed: () async {

                  },
                ),
              ],
            ),

      ),
    );

  // void create() async {
  //   if ()
  // }
  //
  }
}



/*
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;

    return Container(
      color: Colors.blue[100],
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height*0.05),
            Text(
              "SAC",
              style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold,color: Colors.black),
            ),
            SizedBox(height: size.height*0.05),
            Text(
              "Animal Complaint System",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
            ),
            SizedBox(height: size.height*0.5),
            RoundedButton(
              text: "LOGIN",
              press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              color: Colors.white60,
              textColor: Colors.black,
              press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
*/