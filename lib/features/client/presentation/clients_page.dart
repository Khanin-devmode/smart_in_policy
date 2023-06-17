import 'package:flutter/material.dart';
import 'package:smart_in_policy/features/client/presentation/add_client_dialog.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Clients'),
        actions: [
          IconButton(
              onPressed: () => _dialogBuilder(context), icon: Icon(Icons.add))
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AddClientDialog();
      },
    );
  }
}
