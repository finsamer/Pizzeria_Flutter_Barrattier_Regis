import 'package:flutter/foundation.dart';
import 'package:pizeria/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, {this.quantity = 1});
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  static const double TVA = 0.20;

  int totalItems() => _items.length;

  CartItem getCartItem(int index) {
    return _items[index];
  }

  double get totalHT {
    return _items.fold(0.0, (previousValue, item) => previousValue + (item.pizza.total * item.quantity));
  }

  double get tva {
    return totalHT * TVA;
  }

  double get totalTTC {
    return totalHT + tva;
  }

  void addProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      _items.add(CartItem(pizza));
    } else {
      incrementQuantity(index);
    }
    notifyListeners(); // Notifie les auditeurs
  }

  void removeProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);
    if (index != -1) {
      _items.removeAt(index);
      notifyListeners(); // Notifie les auditeurs
    }
  }

  void incrementQuantity(int index) {
    _items[index].quantity++;
    notifyListeners(); // Notifie les auditeurs
  }

  void decrementQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
    }
    notifyListeners(); // Notifie les auditeurs
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element.pizza.id == id);
  }
}
