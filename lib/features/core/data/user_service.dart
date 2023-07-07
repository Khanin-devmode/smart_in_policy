import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/constants.dart';
import 'user_model.dart';

final userConfig = StateProvider<UserConfig?>((ref) => null);

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late CollectionReference userConfigCollection;

  void loadUserConfig(String userId) async {
    userConfigCollection = _firestore.collection(cUserConfig);

    await userConfigCollection.doc().get().then((value) {
      print(value);
    });
  }
}
