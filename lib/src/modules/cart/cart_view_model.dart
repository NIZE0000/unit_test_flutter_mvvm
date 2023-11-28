import 'package:flutter/foundation.dart';
import 'package:unit_test_flutter/src/data/models/cart_item_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItemModel> _cartItems = [
    CartItemModel(id: 1, name: 'Product A', price: 10.0, quantity: 2),
    CartItemModel(id: 2, name: 'Product B', price: 20.0, quantity: 5),
    CartItemModel(id: 3, name: 'Product C', price: 15.0, quantity: 3),
  ];

  // Get the list of cart items
  List<CartItemModel> get cartItems => _cartItems;

  // Add an item to the cart
  void addItemToCart(CartItemModel item) {
    _cartItems.add(item);
    notifyListeners();
  }

  // Remove an item from the cart
  void removeItemFromCart(int itemId) {
    _cartItems.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  // Increase the quantity of an item in the cart
  void increaseQuantity(int itemId) {
    var item = _cartItems.firstWhere((item) => item.id == itemId);
    item.increaseQuantity();
    notifyListeners();
  }

  // Decrease the quantity of an item in the cart
  void decreaseQuantity(int itemId) {
    var item = _cartItems.firstWhere((item) => item.id == itemId);
    item.decreaseQuantity();
    notifyListeners();
  }

  // Calculate the total price of all items in the cart
  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _cartItems) {
      totalPrice += item.getTotalPrice();
    }
    return totalPrice;
  }

  // Clear all items from the cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
