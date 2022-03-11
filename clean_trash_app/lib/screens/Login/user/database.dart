import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cleantrash_app/model/users.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(
      int cardboard, int glass, int metal, int paper, int plastic) async {
    return await userCollection.doc(uid).set({
      'cardboard': cardboard,
      'glass': glass,
      'metal': metal,
      'paper': paper,
      'plastic': plastic,
    });
  }

  // user list from snapshot
  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return User(
        cardboard: doc.get('cardboard') ?? 0,
        glass: doc.get('glass') ?? 0,
        metal: doc.get('metal') ?? 0,
        paper: doc.get('paper') ?? 0,
        plastic: doc.get('plastic') ?? 0,
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      cardboard: snapshot['cardboard'],
      glass: snapshot['glass'],
      metal: snapshot['metal'],
      paper: snapshot['paper'],
      plastic: snapshot['plastic'],
    );
  }

  // get user stream
  Stream<List<User>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
