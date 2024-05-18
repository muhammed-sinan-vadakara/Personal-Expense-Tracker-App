import 'package:expense_tracker_app/core/router/router.dart';
import 'package:expense_tracker_app/core/themes/theme_provider.dart';
import 'package:expense_tracker_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance.clearPersistence();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Expense Tracker App',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: MyApp.scaffoldMessengerKey,
      theme: ref.watch(themeProvider),
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
