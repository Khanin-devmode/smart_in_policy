import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/constants.dart';
import 'package:smart_in_policy/features/client/data/client_model.dart';
import 'package:smart_in_policy/features/policy/data/policy_model.dart';

final selectedClientProvider = StateProvider<Client?>((ref) => null);

final policyServiceProvider = Provider<PolicyService>((ref) {
  return PolicyService();
});

class PolicyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late CollectionReference policiesCollection;

  Future addPolicy() async {
    policiesCollection = _firestore.collection(cPolicies);

    try {
      await policiesCollection.add({
        'createdBy': 'tempid',
      });
    } catch (e) {}
  }
}

final clientPoliciesProvider = StreamProvider<List<Policy>>((ref) async* {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // var allColorDoc = const <ColorDoc>[];

  // final user = ref.watch(authStateProvider).value;

  // while (user != null) {
  //   await for (var snapshot in firestore
  //       .collection(cPolicies)
  //       .where('createdBy', isEqualTo: user.uid)
  //       .snapshots()) {
  //     allColorDoc = [];

  //     if (snapshot.docs.isNotEmpty) {
  //       for (DocumentSnapshot colorDoc in snapshot.docs) {
  //         Color color = hexToColor(colorDoc.get('colorHex'));

  //         var savedColor = ColorDoc(colorDoc.id, color);

  //         allColorDoc = [...allColorDoc, savedColor];
  //         yield allColorDoc;
  //       }
  //     } else {
  //       yield [];
  //     }
  //   }
  // }
});

final newPolicyFormProvider =
    StateProvider<NewPolicyForms>((ref) => NewPolicyForms());

final newPolicyFormKeyProvider = StateProvider((ref) => GlobalKey<FormState>());
