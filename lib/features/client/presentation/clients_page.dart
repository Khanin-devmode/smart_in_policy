import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/features/client/data/client_services.dart';
import 'package:smart_in_policy/features/client/presentation/add_client_dialog.dart';
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
    print(allClient);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Clients'),
        actions: [
          IconButton(
              onPressed: () => _dialogBuilder(context), icon: Icon(Icons.add))
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
                // ColorDoc color = allColors[index];
                // return SavedColorRow(
                //     color: color.color,
                //     notifier: colorlistNofifier,
                //     activeIndex: activeIndex,
                //     docId: color.docId,
                //     db: db);

                DateTime dateOfBirth = allClient[index].dateOfBirth;

                return ListTile(
                  title: Text(allClient[index].firstName),
                  subtitle: Text(getCurrentAge(dateOfBirth).toString()),
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

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AddClientDialog();
      },
    );
  }
}
