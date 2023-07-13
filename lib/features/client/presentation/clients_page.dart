import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/constants.dart';
import 'package:smart_in_policy/features/client/data/client_services.dart';
import 'package:smart_in_policy/features/client/presentation/add_client_dialog.dart';
import 'package:smart_in_policy/features/core/data/user_service.dart';
import 'package:smart_in_policy/features/policy/data/policy_services.dart';
import 'package:smart_in_policy/helper_functions.dart';

class ClientsPage extends ConsumerStatefulWidget {
  const ClientsPage({super.key});

  @override
  ClientsPageState createState() => ClientsPageState();
}

class ClientsPageState extends ConsumerState<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    final allClient = ref.watch(clientsProvider);
    final clientService = ref.watch(clientServiceProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Clients'),
        actions: [
          IconButton(
              onPressed: () => newClientDialogBuilder(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: allClient.when(
        data: (allClient) {
          if (allClient.isNotEmpty) {
            return ListView.builder(
              // Show messages from bottom to top
              reverse: false,
              itemCount: allClient.length,
              itemBuilder: (context, index) {
                DateTime dateOfBirth = allClient[index].dateOfBirth;

                return ListTile(
                  title: Text(allClient[index].firstName),
                  subtitle: Text(getCurrentAge(dateOfBirth).toString()),
                  trailing: IconButton(
                    onPressed: () => removeClientDialogBuilder(
                      context,
                      () => clientService
                          .deleteClient(allClient[index])
                          .then((value) => Navigator.pop(context)),
                    ),
                    icon: const Icon(Icons.remove),
                  ),
                  onTap: () {
                    ref
                        .read(selectedClientProvider.notifier)
                        .update((state) => allClient[index]);
                    Navigator.pushNamed(context, rClientPolicy);
                  },
                );
              },
            );
          } else {
            return const Center(
                child: Text("Your saved colors will be shown here."));
          }
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }

  Future<void> removeClientDialogBuilder(
      BuildContext context, Function removeFn) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm remove?'),
          content: const Text('Are you sure you want to remove client?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => removeFn(),
              child: const Text('Confirm'),
            )
          ],
        );
      },
    );
  }
}
