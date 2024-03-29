import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:smart_in_policy/features/core/data/user_service.dart';
import 'package:smart_in_policy/features/policy/data/policy_services.dart';
import 'package:smart_in_policy/features/policy/data/policy_spec_model.dart';

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
    //Selected Input
    final selectedInputTypeCode = ref.watch(selectedInputTypeCodeProvider);
    final selectedSpecPeriodType = ref.watch(selectedSpecPeriodTypeProvider);
    final selectedPolicy = ref.watch(selectedPolicyProvider);

    //User config
    final userConfig = ref.watch(userConfigStreamProvider);

    //Forms
    final newSpecFormKey = ref.watch(newSpecFormKeyProvider);
    final newSpecForm = ref.watch(newSpecFormProvider);

    //Service
    final policyService = ref.watch(policyServiceProvider);

    final log = Logger('New Policy Spec Form');

    // final specPeriods = <String, String>{
    //   'aa': 'แบบประจำทุกเดือน/ปี',
    //   'ab': 'กำหนดเอง',
    //   'ac': 'แบบครั้งเดียว',
    // };

    return AlertDialog(
      title: const Text('New Policy Spec'),
      content: Form(
        key: newSpecFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              userConfig.when(
                data: (userConfig) {
                  log.info('widget build: ${userConfig.inputTypes.toString()}');

                  List<int> inputTypesCode =
                      userConfig.inputTypes.keys.toList();

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
              DropdownButton(
                value: selectedSpecPeriodType,
                items: kSpecPeriodTypes.keys
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(kSpecPeriodTypes[e]!),
                        ))
                    .toList(),
                onChanged: (value) {
                  // log.info(value);
                  ref
                      .read(selectedSpecPeriodTypeProvider.notifier)
                      .update((state) => value as String);
                },
              ),
              const Divider(),
              TextFormField(
                controller: newSpecForm.aaAmount,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'จำนวนเงิน',
                  // prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Field is empty';
                },
              ),
              TextFormField(
                controller: newSpecForm.aaMonthPeriod,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'ทุกๆ',
                  // prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Field is empty';
                },
              ),
              TextFormField(
                controller: newSpecForm.aaPaymentCount,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'จำนวนครั้ง',
                  // prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Field is empty';
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Reset Form'),
          onPressed: () {
            ref
                .read(newSpecFormProvider.notifier)
                .update((state) => NewSpecForm());
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Add'),
          onPressed: () {
            log.info('${newSpecFormKey.currentState!.validate()}');
            if (newSpecFormKey.currentState!.validate()) {
              final newSpec = newSpecForm.toPolicySpecObj(
                specCode: selectedInputTypeCode as int,
                specPeriodCode: selectedSpecPeriodType,
              );

              policyService
                  .addSpecToPolicy(selectedPolicy, newSpec)
                  .then((value) {
                ref
                    .read(newSpecFormProvider.notifier)
                    .update((state) => NewSpecForm());
                Navigator.pop(context);
              });
            } else {
              log.info('form is not validate');
            }
          },
        ),
      ],
    );
  }
}
