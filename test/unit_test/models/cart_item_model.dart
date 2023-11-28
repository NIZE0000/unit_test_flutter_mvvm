import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test_flutter/src/data/models/cart_item_model.dart';

class MockMap extends Mock implements Map<String, dynamic> {}

void main() {
  group('CartItemModel', () {
    test('should increase quantity', () {
      final cartItem =
          CartItemModel(id: 1, name: 'Item', price: 10.0, quantity: 2);

      cartItem.increaseQuantity();

      expect(cartItem.quantity, 3);
    });

    test('should decrease quantity', () {
      final cartItem =
          CartItemModel(id: 1, name: 'Item', price: 10.0, quantity: 2);

      cartItem.decreaseQuantity();

      expect(cartItem.quantity, 1);
    });

    test('should not decrease quantity below 1', () {
      final cartItem =
          CartItemModel(id: 1, name: 'Item', price: 10.0, quantity: 1);

      cartItem.decreaseQuantity();

      expect(cartItem.quantity, 1);
    });

    test('should calculate total price', () {
      final cartItem =
          CartItemModel(id: 1, name: 'Item', price: 10.0, quantity: 3);

      final totalPrice = cartItem.getTotalPrice();

      expect(totalPrice, 30.0);
    });

    test('should convert to map', () {
      final cartItem =
          CartItemModel(id: 1, name: 'Item', price: 10.0, quantity: 2);

      final map = cartItem.toMap();

      expect(map, {'id': 1, 'name': 'Item', 'price': 10.0, 'quantity': 2});
    });

    test('should create from map', () {
      final map = MockMap();
      when(map['id']).thenReturn(1);
      when(map['name']).thenReturn('Item');
      when(map['price']).thenReturn(10.0);
      when(map['quantity']).thenReturn(2);

      final cartItem = CartItemModel.fromMap(map);

      expect(cartItem.id, 1);
      expect(cartItem.name, 'Item');
      expect(cartItem.price, 10.0);
      expect(cartItem.quantity, 2);
    });
  });
}
