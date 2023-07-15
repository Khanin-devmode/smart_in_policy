import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final policy = ref.watch(selectedPolicy);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Policy detail'),
    //     actions: [
    //       IconButton(
    //           onPressed: () => newPolicySpecDialogBuilder(context),
    //           icon: const Icon(Icons.add))
    //     ],
    //   ),

    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Policy detail'),
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
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              Text('Grid Header 1'),
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.deepOrange,
                  ),
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
                ],
              ),
              Text('Grid Header 1'),
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
                ],
              )
            ],
          )))
        ],
      ),
    );
  }
}
