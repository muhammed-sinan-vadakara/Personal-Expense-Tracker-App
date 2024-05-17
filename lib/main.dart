import 'package:expense_tracker_app/core/themes/theme_provider.dart';
import 'package:expense_tracker_app/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Expense Tracker App',
      theme: ref.watch(themeProvider),
      home: const LoginPage(),
    );
  }
}
