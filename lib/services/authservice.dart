import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user ;
      return user ;
    } catch(e) {
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