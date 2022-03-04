/*import 'package:cloud_firestore/cloud_firestore.dart';

class BadgesService {

  final String uid;
  BadgesService({required this.uid});

  // collection reference
  final CollectionReference badges = FirebaseFirestore.instance.collection('Badges');

  Future updateUserData(int create) async {
    return await badges.doc(uid).set({
      'create': create,
    });
  }

}*/