import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/features/client/data/client_model.dart';
import 'package:smart_in_policy/features/client/data/client_services.dart';

class AddClientDialog extends ConsumerWidget {
  const AddClientDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newClientForm = ref.watch(newClientFormProvider);
    final clientService = ref.watch(clientServiceProvider);

    return AlertDialog(
      title: const Text('Basic dialog title'),
      content: Column(
        children: [
          TextField(
            controller: newClientForm.firstName,
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Reset Form'),
          onPressed: () {
            // Navigator.of(context).pop();
            ref
                .read(newClientFormProvider.notifier)
                .update((state) => NewClientForms());
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Add'),
          onPressed: () {
            clientService
                .addClient(Client(
                    'Khanin',
                    'Chompoosri',
                    'Nin',
                    DateTime.utc(1986, 6, 20),
                    30,
                    MartialStatus.married.toString()))
                .then((value) {
              ref
                  .read(newClientFormProvider.notifier)
                  .update((state) => NewClientForms());
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }
}
