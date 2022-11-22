import 'package:flutter/material.dart';

class QuantityProvider extends ChangeNotifier {
  int qty = 1;
  void incrementQuantity() {
    qty++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (qty > 1) {
      qty--;
      notifyListeners();
    }
  }
}
