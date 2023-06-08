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
        title: const Text('User Insurance Policies'),
      ),
      body: ListView(children: const [
        ListTile(
          title: Text('Policy 1'),
        ),
        ListTile(
          title: Text('Policy 2'),
        )
      ]),
    );
  }
}
