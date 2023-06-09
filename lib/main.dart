import 'package:flutter/material.dart';
import 'package:smart_in_policy/features/home/home_page.dart';
import 'package:smart_in_policy/features/policy/presentation/policy_detail.dart';
import 'package:smart_in_policy/features/policy/presentation/user_policies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(
              title: 'Smartin Policy',
            ),
        '/policy': (context) => const ClientPolicyPage(),
        '/policy-detail': (context) => const PolicyDetailPage(),
      },
    );
  }
}
