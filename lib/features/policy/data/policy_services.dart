import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<Database>((ref) {
  return Database();
});

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late CollectionReference policiesCollection;

  Future addPolicy() async {
    await policiesCollection.add({});
  }
}
