import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_in_policy/constants.dart';
import 'package:smart_in_policy/features/client/presentation/clients_page.dart';
import 'package:smart_in_policy/features/home/home_page.dart';
import 'package:smart_in_policy/features/policy/presentation/policy_detail.dart';
import 'package:smart_in_policy/features/policy/presentation/user_policies_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set landscape mode in Android only.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        rHome: (context) => const ClientsPage(),
        rClientPolicy: (context) => const ClientPolicyPage(),
        rPolicyDetail: (context) => const PolicyDetailPage(),
      },
    );
  }
}
