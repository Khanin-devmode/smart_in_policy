import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:smart_in_policy/common/ui/common_app_bar.dart';
import 'package:smart_in_policy/features/core/data/user_service.dart';
import 'package:smart_in_policy/features/policy/data/policy_services.dart';
import 'package:smart_in_policy/features/policy/presentation/add_policy_spec_dialog.dart';

class PolicyDetailPage extends ConsumerStatefulWidget {
  const PolicyDetailPage({super.key});

  @override
  PolicyDetailPageState createState() => PolicyDetailPageState();
}

class PolicyDetailPageState extends ConsumerState<PolicyDetailPage> {
  @override
  Widget build(BuildContext context) {
    final policy = ref.watch(selectedPolicyProvider);
    final policySpecs = ref.watch(policySpecsStreamProvider);

    ref.watch(userConfigStreamProvider); // To load config and update app.

    final userConfig = ref.watch(userConfigProvider);

    final log = Logger('Policy Detail Page');
    log.info(policySpecs);

    return Scaffold(
      appBar: CommonAppBar(
        title: 'Policy Detail',
        actions: [
          IconButton(
              onPressed: () => newPolicySpecDialogBuilder(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(policy!.policyName),
                Text(policy.id as String),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              const Text('Grid Header 1'),
              policySpecs.when(
                  data: (data) {
                    if (data.isNotEmpty) {
                      return Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        children: List.generate(
                          data.length,
                          // (i) => Chip(
                          //   label: Text(
                          //       '${spec.specCode}: ${spec.specPeriodCode}'),
                          // ),
                          (i) {
                            final spec = data[i];
                            return Card(
                              child: SizedBox(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(spec.specCode.toString()),
                                    Text(
                                      userConfig.getInputName(spec.specCode),
                                    ),
                                    Text(spec.specPeriodCode),
                                    Text(kSpecPeriodTypes[spec.specPeriodCode]
                                        as String),
                                    Text(spec.aaAmount!.toStringAsFixed(0)),
                                    Text(spec.aaMonthPeriod.toString()),
                                    Text(spec.aaPaymentCount.toString()),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Text('List is still empty');
                    }
                  },
                  error: (e, trace) => Text(e.toString()),
                  loading: () => Text('Loading')),
              const Text('Grid Header 1'),
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('AH')),
                    label: const Text('Hamilton'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('ML')),
                    label: const Text('Lafayette'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('HM')),
                    label: const Text('Mulligan'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('JL')),
                    label: const Text('Laurens'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('JL')),
                    label: const Text('Laurens'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('JL')),
                    label: const Text('Laurens'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('JL')),
                    label: const Text('Laurens'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('AH')),
                    label: const Text('Hamilton'),
                  ),
                ],
              )
            ],
          )))
        ],
      ),
    );
  }
}
