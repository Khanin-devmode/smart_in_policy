import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/constants.dart';
import 'package:smart_in_policy/features/client/data/client_model.dart';
import 'package:smart_in_policy/features/policy/data/policy_model.dart';
import 'package:smart_in_policy/helper_functions.dart';

final selectedClientProvider = StateProvider<Client?>((ref) => null);

final policyServiceProvider = Provider<PolicyService>((ref) {
  return PolicyService();
});

class PolicyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late CollectionReference policiesCollection;

  Future addPolicy(Policy newPolicy, Client? client) async {
    Map<String, dynamic> policyMap = newPolicy.toCollectionObj();
    policyMap['clientId'] = client!.id;
    policiesCollection = _firestore.collection(cPolicies);

    try {
      await policiesCollection.add(policyMap);
    } catch (e) {}
  }

  Future deletePolicy(Policy policy) async {
    policiesCollection = _firestore.collection(cPolicies);
    try {
      await policiesCollection.doc(policy.id).delete();
      // return true;
    } catch (e) {
      // return Future.error(e);
    }
  }
}

final clientPoliciesStreamProvider = StreamProvider<List<Policy>>((ref) async* {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var clientPolicy = const <Policy>[];
  Client? selctedClient = ref.watch(selectedClientProvider);

  await for (var snapshot in firestore
      .collection(cPolicies)
      .where('clientId', isEqualTo: selctedClient!.id)
      .snapshots()) {
    clientPolicy = [];

    if (snapshot.docs.isNotEmpty) {
      for (DocumentSnapshot clientPolicyDoc in snapshot.docs) {
        DateTime startDate = toDateTime(clientPolicyDoc.get('startDate'));
        DateTime endDate = toDateTime(clientPolicyDoc.get('endDate'));

        Policy policy = Policy(
          clientPolicyDoc.get('policyNumber'),
          clientPolicyDoc.get('policyName'),
          clientPolicyDoc.get('policyCompany'),
          startDate,
          endDate,
          clientPolicyDoc.get('policyCoverage'),
          clientPolicyDoc.get('policyCost'),
          clientPolicyDoc.id,
          clientPolicyDoc.get('clientId'),
        );

        clientPolicy = [...clientPolicy, policy];
        yield clientPolicy;
      }
    } else {
      yield clientPolicy;
    }
  }
});

final newPolicyFormProvider =
    StateProvider<NewPolicyForms>((ref) => NewPolicyForms());

final newPolicyFormKeyProvider = StateProvider((ref) => GlobalKey<FormState>());
