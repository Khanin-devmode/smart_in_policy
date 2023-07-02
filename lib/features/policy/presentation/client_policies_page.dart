import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/constants.dart';
import 'package:smart_in_policy/features/client/data/client_model.dart';
import 'package:smart_in_policy/features/policy/data/policy_model.dart';
import 'package:smart_in_policy/features/policy/data/policy_services.dart';
import 'package:smart_in_policy/features/policy/presentation/add_policy_dialog.dart';

class ClientPolicyPage extends ConsumerStatefulWidget {
  const ClientPolicyPage({super.key});

  @override
  ClientPolicyPageState createState() => ClientPolicyPageState();
}

class ClientPolicyPageState extends ConsumerState<ClientPolicyPage> {
  @override
  Widget build(BuildContext context) {
    Client? selectedClient = ref.watch(selectedClientProvider);

    // if (selectedClient == null) {
    //   Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
    // }
    final clientPolicies = ref.watch(clientPoliciesStreamProvider);
    print(clientPolicies);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User Insurance Policies'),
        actions: [
          IconButton(
            onPressed: () => newPolicyDialogBuilder(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      // body: Row(
      //   children: [
      //     Expanded(flex: 1, child: Text(selectedClient!.firstName)),
      //     Expanded(
      //       flex: 2,
      //       child: ListView(children: [
      //         ListTile(
      //           title: const Text('Policy 1'),
      //           onTap: () {
      //             Navigator.pushNamed(context, rPolicyDetail);
      //           },
      //         ),
      //         ListTile(
      //             title: const Text('Policy 2'),
      //             onTap: () {
      //               Navigator.pushNamed(context, rPolicyDetail);
      //             })
      //       ]),
      //     ),
      //   ],
      // ),
      body: clientPolicies.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.builder(
              // Show messages from bottom to top
              reverse: false,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].policyName),
                );
              },
            );
          } else {
            return const Center(child: Text("Please add policy"));
          }
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
