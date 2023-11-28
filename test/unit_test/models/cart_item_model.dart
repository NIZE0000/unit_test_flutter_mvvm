import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_flutter/src/data/models/cart_item_model.dart';

void main() {
  group('CartItemModel Tests', () {
    test('Increase Quantity', () {
      CartItemModel cartItem = CartItemModel(
        id: 1,
        name: 'Test Item',
        price: 10.0,
        quantity: 2,
      );

      cartItem.increaseQuantity();

      expect(cartItem.quantity, 3);
    });

    test('Decrease Quantity', () {
      CartItemModel cartItem = CartItemModel(
        id: 1,
        name: 'Test Item',
        price: 10.0,
        quantity: 3,
      );

      cartItem.decreaseQuantity();

      expect(cartItem.quantity, 2);
    });

    test('Decrease Quantity - Min Limit', () {
      CartItemModel cartItem = CartItemModel(
        id: 1,
        name: 'Test Item',
        price: 10.0,
        quantity: 1,
      );

      cartItem.decreaseQuantity();

      // Quantity should not go below 1
      expect(cartItem.quantity, 1);
    });

    test('Get Total Price', () {
      CartItemModel cartItem = CartItemModel(
        id: 1,
        name: 'Test Item',
        price: 10.0,
        quantity: 3,
      );

      double totalPrice = cartItem.getTotalPrice();

      expect(totalPrice, 30.0);
    });

    test('Convert to Map', () {
      CartItemModel cartItem = CartItemModel(
        id: 1,
        name: 'Test Item',
        price: 10.0,
        quantity: 3,
      );

      Map<String, dynamic> cartItemMap = cartItem.toMap();

      expect(cartItemMap, {
        'id': 1,
        'name': 'Test Item',
        'price': 10.0,
        'quantity': 3,
      });
    });

    test('Create from Map', () {
      Map<String, dynamic> cartItemMap = {
        'id': 1,
        'name': 'Test Item',
        'price': 10.0,
        'quantity': 3,
      };

      CartItemModel cartItem = CartItemModel.fromMap(cartItemMap);

      expect(cartItem.id, 1);
      expect(cartItem.name, 'Test Item');
      expect(cartItem.price, 10.0);
      expect(cartItem.quantity, 3);
    });
  });
}
