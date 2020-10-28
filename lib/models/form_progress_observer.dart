import 'package:flutter/foundation.dart';

class FormProgressObserver extends ChangeNotifier {
  int currentProgress = 1;

  void registerProgess() {
    currentProgress++;
    notifyListeners();
  }
}
