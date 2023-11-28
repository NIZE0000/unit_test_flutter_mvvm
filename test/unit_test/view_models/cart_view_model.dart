import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_flutter/src/data/models/cart_item_model.dart';
import 'package:unit_test_flutter/src/modules/cart/cart_view_model.dart';

void main() {
  group('CartViewModel Tests', () {
    late CartViewModel viewModel;
    late CartItemModel cartItem;
    late int initialLength;

    setUp(() async {
      viewModel = CartViewModel();
      cartItem =
          CartItemModel(id: 1, name: 'Test Item', price: 10.0, quantity: 1);
      initialLength = viewModel.cartItems.length;
    });

    test('fetchCartItems should populate cartItems', () async {
      await viewModel.fetchCartItems();
      expect(viewModel.cartItems.length, greaterThan(initialLength));
    });

    test('addItemToCart should add an item to cartItems', () {
      viewModel.clearCart();
      viewModel.addItemToCart(cartItem);
      expect(viewModel.cartItems.length, 1);
    });

    test('removeItemFromCart should remove an item from cartItems', () {
      viewModel.addItemToCart(cartItem);
      viewModel.removeItemFromCart(1);
      expect(viewModel.cartItems.length, 0);
    });

    test('increaseQuantity should increase the quantity of an item', () {
      viewModel.addItemToCart(cartItem);
      viewModel.increaseQuantity(1);
      expect(cartItem.quantity, 2);
    });

    test('decreaseQuantity should decrease the quantity of an item', () {
      viewModel.addItemToCart(cartItem);
      viewModel.decreaseQuantity(1);
      expect(cartItem.quantity, 1);
    });

    test('getTotalPrice should calculate the correct total price', () {
      final cartItem1 =
          CartItemModel(id: 1, name: 'Item 1', price: 10.0, quantity: 2);
      final cartItem2 =
          CartItemModel(id: 2, name: 'Item 2', price: 20.0, quantity: 3);
      viewModel.cartItems.addAll([cartItem1, cartItem2]);
      expect(viewModel.getTotalPrice(), 2 * 10.0 + 3 * 20.0);
    });

    test('clearCart should remove all items from cartItems', () {
      viewModel.addItemToCart(cartItem);
      viewModel.clearCart();
      expect(viewModel.cartItems.length, equals(0));
    });
  });
}
