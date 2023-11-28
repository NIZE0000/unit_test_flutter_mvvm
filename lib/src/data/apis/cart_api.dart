import 'package:unit_test_flutter/src/data/models/cart_item_model.dart';

class CartApi {
  // Mock data
  static final List<CartItemModel> _cartItems = [
    CartItemModel(id: 1, name: 'Product A', price: 10.0, quantity: 2),
    CartItemModel(id: 2, name: 'Product B', price: 20.0, quantity: 5),
    CartItemModel(id: 3, name: 'Product C', price: 15.0, quantity: 3),
  ];

  // Method to get cart items
  static Future<List<CartItemModel>> getCartItems() async {
    // For now, return mock data
    return _cartItems;

    // Uncomment the following lines when you're ready to connect to a real API
    // final response = await http.get('your_api_endpoint');
    // if (response.statusCode == 200) {
    //   return parseResponse(response.body);
    // } else {
    //   throw Exception('Failed to load cart items');
    // }
  }

  // Add a method to parse the API response if needed
  // static List<CartItemModel> parseResponse(String responseBody) {
  //   // Implement parsing logic based on your API response
  //   // Return a list of CartItemModel
  // }
}
