import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // create user object based on firebase user
  User? _userFromFirebaseUser(User? user)
  {
    // ignore: unnecessary_null_comparison
    return user;
  }

  //auth change user stream

  Stream<User?> get user {
    return auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password, String name) async {
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await user!.updateDisplayName(name);
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign up with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }


  // sign out
  Future signOut() async {
    try {
      return await auth.signOut();
    }
    catch(e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}