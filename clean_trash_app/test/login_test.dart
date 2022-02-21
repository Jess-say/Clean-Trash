import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cleantrash_app/screens/Login/login_page.dart';
import 'package:cleantrash_app/screens/Login/user/auth.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth{}
class MockFirebaseUser extends Mock implements User{}
class MockAuthResult extends Mock implements UserCredential {}

void main() {
  MockFirebaseAuth _auth = MockFirebaseAuth();
  BehaviorSubject<MockFirebaseUser> _user = BehaviorSubject<MockFirebaseUser>();
  when(_auth.authStateChanges()).thenAnswer((_){
    return _user;
  });
  final user = FirebaseAuth.instance.currentUser!;
  User? _repo =  FirebaseAuth.instance.currentUser!;
  group('user repository test', (){
    when(_auth.signInWithEmailAndPassword(email: "email",password: "password")).thenAnswer((_)async{
      _user.add(MockFirebaseUser());
      return MockAuthResult();
    });
    when(_auth.signInWithEmailAndPassword(email: "mail",password: "pass")).thenThrow((){
      return null;
    });
    test("sign in with email and password", () async {
      bool signedIn = (await user.email) as bool;//handleSignInEmail("email", "password");
      expect(signedIn, true);
      expect(_repo.status, Status.Authenticated);
    });

    test("sing in fails with incorrect email and password",() async {
      bool signedIn = await _repo.handleSignInEmail("mail", "pass");
      expect(signedIn, false);
      expect(_repo.status, Status.Unauthenticated);
    });

    test('sign out', ()async{
      await _repo.signout();
      expect(_repo.status, Status.Unauthenticated);
    });
  });
}