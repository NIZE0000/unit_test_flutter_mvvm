import 'package:unit_test_flutter/src/data/apis/cart_api.dart';
import 'package:unit_test_flutter/src/data/models/cart_item_model.dart';

class CartService {
  // Method to get cart items
  static Future<List<CartItemModel>> getCartItems() async {
    try {
      // Use the CartApi to fetch cart items
      return await CartApi.getCartItems();
    } catch (e) {
      // Handle errors or exceptions as needed
      rethrow; // Rethrow the exception to propagate it up the call stack
    }
  }
}
