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

final userConfigStreamProvider = StreamProvider<UserConfig>((ref) async* {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // var clientPolicy = const <Policy>[];
  // Client? selctedClient = ref.watch(selectedClientProvider);
  print('working in service');
  await for (var snapshot in firestore
      .collection(cUserConfig)
      .doc('AEIHFYFyZIyB76nKAbQc') //temp, actual is user id from auth.
      .snapshots()) {
    if (snapshot.exists) {
      print('printing user config in realtime');
      print(snapshot.data());
    } else {
      print('snapshot not found');
      yield UserConfig({001: 'ความคุ้มครองประกันชีิวิต'});
    }
  }

  //   if (snapshot.docs.isNotEmpty) {
  //     for (DocumentSnapshot clientPolicyDoc in snapshot.docs) {
  //       DateTime startDate = toDateTime(clientPolicyDoc.get('startDate'));
  //       DateTime endDate = toDateTime(clientPolicyDoc.get('endDate'));

  //       Policy policy = Policy(
  //         clientPolicyDoc.get('policyNumber'),
  //         clientPolicyDoc.get('policyName'),
  //         clientPolicyDoc.get('policyCompany'),
  //         startDate,
  //         endDate,
  //         clientPolicyDoc.get('policyCoverage'),
  //         clientPolicyDoc.get('policyCost'),
  //         clientPolicyDoc.id,
  //         clientPolicyDoc.get('clientId'),
  //       );

  //       clientPolicy = [...clientPolicy, policy];
  //       yield clientPolicy;
  //     }
  //   } else {
  //     yield clientPolicy;
  //   }
  // }
});
