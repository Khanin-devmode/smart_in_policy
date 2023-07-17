import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:smart_in_policy/constants.dart';
import 'package:smart_in_policy/features/client/presentation/clients_page.dart';
import 'package:smart_in_policy/features/policy/presentation/policy_detail_page.dart';
import 'package:smart_in_policy/features/policy/presentation/client_policies_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print(
        '${record.level.name}: @${record.loggerName} ${record.time}: ${record.message}');
  });

  runApp(const ProviderScope(child: SmartInPolicyApp()));
}

class SmartInPolicyApp extends StatelessWidget {
  const SmartInPolicyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set landscape mode in Android only.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'Smart in Policy',
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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
    );
  }
}
