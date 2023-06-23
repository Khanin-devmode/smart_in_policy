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
    final newClientFormKey = ref.watch(newClientFormKeyProvider);

    return AlertDialog(
      title: const Text('Basic dialog title'),
      content: Form(
        key: newClientFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: newClientForm.firstName,
              decoration: const InputDecoration(
                labelText: 'Firstname',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: newClientForm.lastName,
              decoration: const InputDecoration(
                labelText: 'Lastname',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: newClientForm.nickName,
              decoration: const InputDecoration(
                labelText: 'Nickname',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Row(
              children: [
                Expanded(child: TextFormField()),
                SizedBox(width: 4),
                Expanded(child: TextFormField()),
                SizedBox(width: 4),
                Expanded(child: TextFormField()),
              ],
            )
            // TextButton(
            //   style: TextButton.styleFrom(
            //     textStyle: Theme.of(context).textTheme.labelLarge,
            //   ),
            //   child: const Text('Select Date'),
            //   onPressed: () async {
            //     Future<DateTime?> dateOfBirth = showDatePicker(
            //       locale: Locale('th', 'TH'),
            //       context: context,
            //       initialDate: newClientForm.dateOfBirth,
            //       firstDate: DateTime.utc(1950, 01, 01),
            //       lastDate: DateTime.now(),
            //     );
            //   },
            // ),
            // InputDatePickerFormField(
            //   errorFormatText: 'Invalid format',
            //   fieldLabelText: 'Date of Birth',
            //   firstDate: DateTime.utc(1920, 1, 1),
            //   lastDate: DateTime.now(),
            //   onDateSubmitted: (value) {
            //     print(value.toUtc());
            //   },
            //   onDateSaved: (value) {
            //     print(value.toUtc());
            //   },
            // )
          ],
        ),
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
            if (newClientFormKey.currentState!.validate()) {
              clientService
                  .addClient(newClientForm.toClientObj())
                  .then((value) {
                ref
                    .read(newClientFormProvider.notifier)
                    .update((state) => NewClientForms());
                Navigator.pop(context);
              });
            }
          },
        ),
      ],
    );
  }
}
