import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  final firestore = FirebaseFirestore.instance;

  Future<void> write(String key, dynamic value) async {
    var doc = await firestore.collection(key).add(value);
    await doc.update({'docId': doc.id});
  }

  dynamic read(String key, String uid) async {
    var snapshot =
        await firestore.collection(key).where('uid', isEqualTo: uid).get();
      return snapshot.docs.map((doc) => doc.data()).toList();
}
}
