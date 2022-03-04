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

  // get user stream
  Stream<List<User>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
