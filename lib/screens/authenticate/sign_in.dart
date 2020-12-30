import 'package:flutter/material.dart';
import 'package:haifma_v2/services/authservice.dart';
import 'package:haifma_v2/shared/constants.dart';
class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final formkey = GlobalKey<FormState>();

  //text field state
  String email ;
  String password ;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('HAIFMA'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register Now'),
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
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (val) => val.isEmpty ? "Enter an Email :" : null,
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
             SizedBox(height: 20.0),
             TextFormField(
               decoration: textInputDecoration.copyWith(hintText: 'Password'),
             validator: (val) => val.length < 6 ?  "Enter a password at least 6 digit" : null,
               obscureText: true,
               onChanged: (val){
                 setState(() => password = val);

               },
             ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[230],
                child: Text('LOGIN', style: TextStyle(color: Colors.black)
                ),
                onPressed: () async {
                    if(formkey.currentState.validate()){
                      dynamic result = await _auth.signInUser(email, password);
                        if(result == null){
                       setState(() => error = "could not sign in");
                                }
                         }
                      },
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
