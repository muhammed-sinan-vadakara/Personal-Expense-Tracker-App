import 'dart:developer';

import 'package:expense_tracker_app/features/home/data/models/expense_model.dart';
import 'package:expense_tracker_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart' as path;

class ExpenceObjectboxStore {
  static ExpenceObjectboxStore? _instance;
  final Store store;
  late final Box<ExpenseEntityModel> historyBox;

  ExpenceObjectboxStore._create(this.store) {
    historyBox = store.box<ExpenseEntityModel>();
  }

  static ExpenceObjectboxStore get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      try {
        final docsDir = await getApplicationDocumentsDirectory();
        final store = await openStore(
          directory: path.join(docsDir.path, 'history'),
        );
        _instance = ExpenceObjectboxStore._create(store);
      } catch (e) {
        log('Error creating ExpenceObjectboxStore: $e');
      }
    }
  }
}
