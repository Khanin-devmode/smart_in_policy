import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:smart_in_policy/features/policy/data/policy_model.dart';
import 'package:smart_in_policy/features/policy/data/policy_services.dart';

Future<void> newPolicyDialogBuilder(BuildContext context) {
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
    final newPolicyForm = ref.watch(newPolicyFormProvider);
    final policyService = ref.watch(policyServiceProvider);
    final newPolicyFormKey = ref.watch(newPolicyFormKeyProvider);
    final currentYear = DateTime.now().year + 543;
    final selectedClient = ref.watch(selectedClientProvider);

    final log = Logger('New Policy Dialog');

    return AlertDialog(
      title: const Text('New Policy Form'),
      content: Form(
        key: newPolicyFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: newPolicyForm.company,
              decoration: const InputDecoration(
                labelText: 'Policy Company',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: newPolicyForm.name,
              decoration: const InputDecoration(
                labelText: 'Policy Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: newPolicyForm.number,
              decoration: const InputDecoration(
                labelText: 'Policy Number',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const Text('วันที่เริ่มสัญญา'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: newPolicyForm.startDay,
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
                    controller: newPolicyForm.startMonth,
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
                    controller: newPolicyForm.startYear,
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
            const Text('วันสิ้นสุดสัญญา'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: newPolicyForm.endDay,
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
                    controller: newPolicyForm.endMonth,
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
                    controller: newPolicyForm.endYear,
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
                      if (int.parse(value) < 2455) {
                        return 'Please enter date range greater than 2455';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: newPolicyForm.coverage,
              decoration: const InputDecoration(
                labelText: 'ความคุ้มครอง',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                // if (int.parse(value) > 99 || int.parse(value) < 1) {
                //   return 'Please enter date range between 1-99';
                // }
                return null;
              },
            ),
            TextFormField(
              controller: newPolicyForm.cost,
              decoration: const InputDecoration(
                labelText: 'เบี้ยประกัน',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                // if (int.parse(value) > 99 || int.parse(value) < 1) {
                //   return 'Please enter date range between 1-99';
                // }
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
                .read(newPolicyFormProvider.notifier)
                .update((state) => NewPolicyForms());
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Add'),
          onPressed: () {
            if (newPolicyFormKey.currentState!.validate()) {
              policyService
                  .addPolicy(newPolicyForm.toPolicyObj(), selectedClient)
                  .then((value) {
                ref
                    .read(newPolicyFormProvider.notifier)
                    .update((state) => NewPolicyForms());
                Navigator.pop(context);
              });
            }
          },
        ),
      ],
    );
  }
}
