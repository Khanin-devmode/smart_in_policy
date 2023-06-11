import 'package:flutter/material.dart';

class ClientPolicyPage extends StatefulWidget {
  const ClientPolicyPage({super.key});

  @override
  State<ClientPolicyPage> createState() => _ClientPolicyPageState();
}

class _ClientPolicyPageState extends State<ClientPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User Insurance Policies'),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text('Policy 1'),
          onTap: () {
            Navigator.pushNamed(context, '/policy-detail');
          },
        ),
        ListTile(
            title: const Text('Policy 2'),
            onTap: () {
              Navigator.pushNamed(context, '/policy-detail');
            })
      ]),
    );
  }
}
