import 'package:expense_tracker_app/main.dart';
import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showMessage(String content) {
    MyApp.scaffoldMessengerKey.currentState!
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
