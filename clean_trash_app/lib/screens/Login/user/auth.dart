import 'package:cleantrash_app/screens/Login/user/database.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'user.dart';
//import 'database.dart';

class Auth {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  late String _passw;
  late String tempEmail;

  User? _firebaseUser(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_firebaseUser);
  }

  Future<User?> handleSignInEmail(String email, String passw) async {
    final res = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: passw);
    _passw = passw;
    return _firebaseUser(res.user);
  }

  Future<User?> SignUp(String email, String passw) async {
    try {
      final res = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: passw);
      _passw = passw;

      //User user = res.user as User;
      // create new doc for user
      //await BadgesService(uid: user.uid).updateUserData(1);

      return _firebaseUser(res.user);
    }catch(e) {
      return null;
    }
  }

  String getPass() {
    return _passw;
  }

  Future<User?> ResetPass(String email) async {
    final res = await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<User?> ChangePass(String? email) async {
    tempEmail = email as String;
    final res = await _firebaseAuth.sendPasswordResetEmail(email: tempEmail);
  }

  Future<void> Logout() async {
    return await _firebaseAuth.signOut();
  }

  Future<User?> DeleteAccount() async {
    final del = auth.FirebaseAuth.instance.currentUser;

    del?.delete();
  }
}
