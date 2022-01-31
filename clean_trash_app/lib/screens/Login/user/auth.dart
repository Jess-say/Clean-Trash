import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'user.dart';

class Auth {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _firebaseUser(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user{
    return _firebaseAuth.authStateChanges().map(_firebaseUser);
  }

  Future<User?> handleSignInEmail(String email, String passw) async {
    final res = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: passw);

    return _firebaseUser(res.user);
  }

  Future<User?> SignUp(String email, String passw) async {
    final res = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: passw);

    return _firebaseUser(res.user);
  }

  Future<User?> ResetPass(String email, String passw) async {
    final res = await _firebaseAuth.confirmPasswordReset(
        code: email, newPassword: passw);
  }

  Future<void> Logout() async {
    return await _firebaseAuth.signOut();
  }
}