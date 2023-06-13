import 'package:flutter/material.dart';
import 'package:smart_in_policy/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, rClientPolicy);
        },
        child: const Text('Policies'),
      )),
    );
  }
}
