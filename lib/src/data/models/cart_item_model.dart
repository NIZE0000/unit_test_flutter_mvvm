class CartItemModel {
  final int id;
  final String name;
  final double price;
  int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  // Increase the quantity of the item in the cart
  void increaseQuantity() {
    quantity++;
  }

  // Decrease the quantity of the item in the cart
  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  // Calculate the total price for the item (price * quantity)
  double getTotalPrice() {
    return price * quantity;
  }

  // Convert the CartItem to a map for storage or transmission
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  // Create a CartItem from a map
  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }
}
