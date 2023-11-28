import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_flutter/src/data/models/cart_item_model.dart';
import 'package:unit_test_flutter/src/modules/cart/cart_view_model.dart';

void main() {
  group('CartViewModel Tests', () {
    test('Add Item To Cart', () {
      CartViewModel cartViewModel = CartViewModel();
      CartItemModel newItem =
          CartItemModel(id: 4, name: 'New Product', price: 25.0, quantity: 1);

      cartViewModel.addItemToCart(newItem);

      expect(cartViewModel.cartItems.length, 4);
      expect(cartViewModel.cartItems.contains(newItem), true);
    });

    test('Remove Item From Cart', () {
      CartViewModel cartViewModel = CartViewModel();
      int itemIdToRemove = 2;

      cartViewModel.removeItemFromCart(itemIdToRemove);

      expect(cartViewModel.cartItems.length, 2);
      expect(cartViewModel.cartItems.any((item) => item.id == itemIdToRemove),
          false);
    });

    test('Increase Quantity', () {
      CartViewModel cartViewModel = CartViewModel();
      int itemIdToIncrease = 1;

      cartViewModel.increaseQuantity(itemIdToIncrease);

      var item = cartViewModel.cartItems
          .firstWhere((item) => item.id == itemIdToIncrease);
      expect(item.quantity, 3);
    });

    test('Decrease Quantity', () {
      CartViewModel cartViewModel = CartViewModel();
      int itemIdToDecrease = 3;

      cartViewModel.decreaseQuantity(itemIdToDecrease);

      var item = cartViewModel.cartItems
          .firstWhere((item) => item.id == itemIdToDecrease);
      expect(item.quantity, 2);
    });

    test('Get Total Price', () {
      CartViewModel cartViewModel = CartViewModel();

      double totalPrice = cartViewModel.getTotalPrice();

      expect(totalPrice, 10.0 * 2 + 20.0 * 1 + 15.0 * 3);
    });

    test('Clear Cart', () {
      CartViewModel cartViewModel = CartViewModel();

      cartViewModel.clearCart();

      expect(cartViewModel.cartItems.isEmpty, true);
    });
  });
}
