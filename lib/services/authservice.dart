import 'dart:wasm';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:haifma_v2/models/user.dart';
import 'package:haifma_v2/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user ;
      return _userFromFirebaseUser(user) ;
    } catch(e) {
      print(e.toString());
      return null ;
    }

  }

  Future loginUser(String email, String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      await DatabaseService(uid: user.uid).updateUserData('email', 'male', 23);
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInUser(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }




  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null ;
    }
  }
}

/*
class AuthService{
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.onAuthStateChanged();

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed In";
    }
    on FirebaseAuthException catch(e){return e.message;}
  }

  Future<String> signUp({String email, String password}) async {
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed Up ";
    }
    on FirebaseAuthException catch(e){return e.message;}
}
}
*/