import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final selectedSpecPeriodType = ref.watch(selectedSpecPeriodTypeProvider);
    final log = Logger('New Policy Spec Form');

    final TextEditingController _controller = TextEditingController();

    // final specPeriods = <String, String>{
    //   'aa': 'แบบประจำทุกเดือน/ปี',
    //   'ab': 'กำหนดเอง',
    //   'ac': 'แบบครั้งเดียว',
    // };

    return AlertDialog(
      title: const Text('New Policy Spec'),
      content: SingleChildScrollView(
        child: Form(
          key: newPolicyFormKey,
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
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  ThaiBahtInputFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: 'จำนวนเงิน',
                  // prefixIcon: Icon(Icons.attach_money),
                ),
              ),
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'ทุกๆ',
                  // prefixIcon: Icon(Icons.attach_money),
                ),
              ),
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'จำนวนครั้ง',
                  // prefixIcon: Icon(Icons.attach_money),
                ),
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

class ThaiBahtInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Format the input with Thai Baht symbol and commas
    String formattedValue = '฿' +
        newValue.text.replaceAllMapped(
          RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"),
          (Match match) => '${match.group(1)},',
        );

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formattedValue.length),
      ),
    );
  }
}
