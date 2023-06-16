import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/constants.dart';
import 'package:smart_in_policy/features/client/data/client_model.dart';
import 'package:smart_in_policy/features/policy/data/policy_model.dart';

final databaseProvider = Provider<Database>((ref) {
  return Database();
});

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late CollectionReference clientsCollection;

  Future addClient(Client newClient) async {
    clientsCollection = _firestore.collection(cClients);

    Map clientMap = newClient.toCollectionObj();
    clientMap['createdBy'] = 'tempUid';

    try {
      await clientsCollection.add(clientMap);
    } catch (e) {
      print(e);
    }
  }
}

final clientPoliciesProvider = StreamProvider<List<Policy>>((ref) async* {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
});
