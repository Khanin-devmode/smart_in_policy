import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:smart_in_policy/features/core/data/user_service.dart';
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
    final selectedInputTypeCode = ref.watch(selectedInputTypeCodeProvider);
    final log = Logger('Add Policy Dialog');

    return AlertDialog(
      title: const Text('New Policy Form'),
      content: Form(
        key: newPolicyFormKey,
        child: Column(
          children: [
            userConfig.when(
              data: (userConfig) {
                log.info('widget build: ${userConfig.inputTypes.toString()}');

                List<int> inputTypesCode = userConfig.inputTypes.keys.toList();

                if (inputTypesCode.isNotEmpty) {
                  // ref
                  //     .read(selectedInputTypeCodeProvider.notifier)
                  //     .update((state) => inputTypesCode.first);

                  return DropdownButton<int>(
                    hint: Text('เลือกประเภท'),
                    value: selectedInputTypeCode,
                    items: inputTypesCode
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(userConfig.inputTypes[value]!),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      print(value);
                      ref
                          .read(selectedInputTypeCodeProvider.notifier)
                          .update((state) => value);
                    },
                  );
                } else {
                  return const Text('Field is empty');
                }
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: (() => const Text('loading...')),
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
