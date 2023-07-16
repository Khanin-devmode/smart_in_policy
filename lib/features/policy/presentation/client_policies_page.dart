import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/constants.dart';
import 'package:smart_in_policy/features/client/data/client_model.dart';
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
    final policyService = ref.watch(policyServiceProvider);

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
        body: Row(
          children: [
            Expanded(child: Text(selectedClient!.firstName)),
            Expanded(
              child: clientPolicies.when(
                data: (data) {
                  if (data.isNotEmpty) {
                    return ListView.builder(
                      // Show messages from bottom to top
                      reverse: false,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data[index].policyName),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              removePolicyDialogBuilder(context, () {
                                policyService.deletePolicy(data[index]);
                              });
                            },
                          ),
                          onTap: () {
                            ref
                                .read(selectedPolicy.notifier)
                                .update((state) => data[index]);
                            Navigator.pushNamed(context, rPolicyDetail);
                          },
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
            ),
          ],
        ));
  }

  Future<void> removePolicyDialogBuilder(
      BuildContext context, Function removeFn) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm remove?'),
          content: const Text('Are you sure you want to remove policy?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                removeFn();
                Navigator.pop(context);
              },
              child: const Text('Confirm'),
            )
          ],
        );
      },
    );
  }
}
