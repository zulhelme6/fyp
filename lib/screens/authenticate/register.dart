import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:haifma_v2/services/authservice.dart';
import 'package:haifma_v2/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final formkey = GlobalKey<FormState>();
  //text field state
  String email = '' ;
  String password ='';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('SIGN UP'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.email),
              label: Text('Sign In'),
              onPressed: () {
                widget.toggleView();
              }
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form (
            key: formkey,
            child: Column (
              children: <Widget>[
                SizedBox(height: 10.0),
                TextFormField(
                 decoration: textInputDecoration.copyWith(hintText: 'Email...'),
                  validator: (val) => val.isEmpty ? "Please enter a valid Email " : null,
                  onChanged: (val){
                    setState(() => email = val);

                  },
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password...'),
                  validator: (val) => val.length < 6 ?  "Enter a password at least 6 digit" : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() => password = val);

                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)
                    ),
                    color: Colors.pink[230],
                    child: Text('Register', style: TextStyle(color: Colors.black)
                    ),
                    onPressed: () async {
                      if(formkey.currentState.validate()){
                        dynamic result = await _auth.loginUser(email, password);
                        if(result == null){
                          setState(() => error = "Enter a valid email");
                        }
                      }
                    }
                ),
                SizedBox(height: 18.0),
                Text(
                  error ,
                  style: TextStyle(color: Colors.red, fontSize: 14.0)
                ),

              ],
            ),
          )
      ),
    );
  }
}
