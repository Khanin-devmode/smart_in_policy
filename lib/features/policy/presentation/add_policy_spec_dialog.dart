import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_in_policy/features/core/data/user_service.dart';
import 'package:smart_in_policy/features/policy/data/policy_model.dart';
import 'package:smart_in_policy/features/policy/data/policy_services.dart';

Future<void> newPolicySpecDialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const AddPolicyDialog();
    },
  );
}

class AddPolicyDialog extends ConsumerWidget {
  const AddPolicyDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newPolicyFormKey = ref.watch(newPolicyFormKeyProvider);
    final userConfig = ref.watch(userConfigStreamProvider);

    return AlertDialog(
      title: const Text('New Policy Form'),
      content: Form(
        key: newPolicyFormKey,
        child: Column(
          children: [
            userConfig.when(
              data: (userConfig) {
                print('widget build: ' + userConfig.inputTypes.toString());

                List<String> inputTypes = userConfig.inputTypes.values.toList();

                // return Text('Data Loaded: ' + userConfig.inputTypes.toString());

                if (inputTypes.isNotEmpty) {
                  return DropdownButton(
                    value: inputTypes.first,
                    items: inputTypes
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      print(value);
                    },
                  );
                } else {
                  return Text('Field is empty');
                }
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: (() => Text('loading...')),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Reset Form'),
          onPressed: () {},
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Add'),
          onPressed: () {},
        ),
      ],
    );
  }
}
