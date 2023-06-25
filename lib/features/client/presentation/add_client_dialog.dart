import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/features/client/data/client_services.dart';

class AddClientDialog extends ConsumerWidget {
  const AddClientDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newClientForm = ref.watch(newClientFormProvider);
    final clientService = ref.watch(clientServiceProvider);
    final newClientFormKey = ref.watch(newClientFormKeyProvider);
    final currentYear = DateTime.now().year + 543;

    return AlertDialog(
      title: const Text('New Client Form'),
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
                Expanded(
                  child: TextFormField(
                    controller: newClientForm.birthDay,
                    decoration: const InputDecoration(
                      labelText: 'วัน',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(2)
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (int.parse(value) > 31 || int.parse(value) < 1) {
                        return 'Please enter date range between 1-31';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: TextFormField(
                    controller: newClientForm.birthMonth,
                    decoration: const InputDecoration(
                      labelText: 'เดือน',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(2)
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (int.parse(value) > 12 || int.parse(value) < 1) {
                        return 'Please enter month range between 1-12';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: TextFormField(
                    controller: newClientForm.birthYear,
                    decoration: const InputDecoration(
                      labelText: 'ปี(พ.ศ.)',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(4)
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (int.parse(value) > currentYear ||
                          int.parse(value) < 2455) {
                        return 'Please enter date range between 2455 - $currentYear';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: newClientForm.age,
              decoration: const InputDecoration(
                labelText: 'อายุ',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(2)
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (int.parse(value) > 99 || int.parse(value) < 1) {
                  return 'Please enter date range between 1-99';
                }
                return null;
              },
            ),
            // DropdownButtonFormField(
            //   items: MartialStatus.values.map((MartialStatus martialStatus) {
            //     return DropdownMenuItem<MartialStatus>(
            //       value: martialStatus,
            //       child: Text(martialStatus.name),
            //     );
            //   }).toList(),
            //   onChanged: (value) {

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
