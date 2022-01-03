import 'package:firebase_auth/firebase_auth.dart';
import 'package:oppknocksapp/models/okuser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser

  OKUser? _userFromFirebaseUser(User? user) {
    return user != null ? OKUser(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<OKUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

// add await if didnt work
//Get UID
Future<String> getCurrentUID() async{
  return _auth.currentUser!.uid;
}
  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;


      //await DatabaseCollectionService(uid:user!.uid).updateUserData("name", "username", "college", "sports", "bio");
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


  // Ask for reset email
  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  // register with email & password

  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
