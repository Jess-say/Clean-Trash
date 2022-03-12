import 'package:cleantrash_app/screens/Login/user/database.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'user.dart';

class Auth {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  late String _passw;
  late String tempEmail;

  Users? _firebaseUser(auth.User? user) {
    if (user == null) {
      return null;
    }
    return Users(user.uid, user.email);
  }

  Stream<Users?>? get user {
    return _firebaseAuth.authStateChanges().map(_firebaseUser);
  }

  Future<Users?> handleSignInEmail(String email, String passw) async {
    final res = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: passw);
    _passw = passw;
    return _firebaseUser(res.user);
  }

  Future<Users?> SignUp(String email, String passw) async {
    final res = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: passw);
    _passw = passw;
    await DatabaseService(uid: res.user!.uid).updateUserData(0, 0, 0, 0, 0);
    return _firebaseUser(res.user);
  }

  String getPass() {
    return _passw;
  }

  Future<Users?> ResetPass(String email) async {
    final res = await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<Users?> ChangePass(String? email) async {
    tempEmail = email as String;
    final res = await _firebaseAuth.sendPasswordResetEmail(email: tempEmail);
  }

  Future<void> Logout() async {
    return await _firebaseAuth.signOut();
  }

  Future<Users?> DeleteAccount() async {
    final del = auth.FirebaseAuth.instance.currentUser;

    del?.delete();
  }
}
