import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/constants.dart';
import 'user_model.dart';

// final userConfig = StateProvider<UserConfig?>((ref) => null);

// class UserService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   late CollectionReference userConfigCollection;

//   void loadUserConfig(String userId) async {
//     userConfigCollection = _firestore.collection(cUserConfig);

//     await userConfigCollection.doc().get().then((value) {
//       print(value);
//     });
//   }
// }

final userConfigStreamProvider = StreamProvider<UserConfig>((ref) async* {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  await for (var snapshot in firestore
      .collection(cUserConfig)
      .doc('AEIHFYFyZIyB76nKAbQc') //temp, actual is user id from auth.
      .snapshots()) {
    Map<int, String> inputTypes = {};

    if (snapshot.exists) {
      Map tempInputTypes = snapshot.get('inputTypes');
      tempInputTypes.forEach((key, value) {
        final entry = <int, String>{int.parse(key): value.toString()};
        inputTypes.addAll(entry);
      });
    }
    print('from service: ' + inputTypes.toString());
    yield UserConfig(inputTypes);
  }
});
