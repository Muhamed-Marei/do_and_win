
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model_balance.dart';

class TodosNotifier extends ChangeNotifier {
  int currentPoint = 0;
  void grtCurrentPoint(UserModelBalance snapshot) async {
    currentPoint = snapshot.currentPoint;
    notifyListeners();
  }
}

final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});
