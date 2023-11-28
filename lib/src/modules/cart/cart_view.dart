import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_test_flutter/src/data/models/cart_item_model.dart';
import 'package:unit_test_flutter/src/modules/cart/cart_view_model.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shopping Cart'),
        ),
        body: Consumer<CartViewModel>(
          builder: (context, cartViewModel, child) {
            return Column(
              children: [
                Expanded(
                  child: _buildCartList(cartViewModel.cartItems, context),
                ),
                _buildTotalPrice(
                  cartViewModel.getTotalPrice(),
                  cartViewModel
                      .clearCart, // Pass the function without invoking it
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCartList(List<CartItemModel> cartItems, BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(cartItems[index].name),
          subtitle: Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  Provider.of<CartViewModel>(context, listen: false)
                      .decreaseQuantity(cartItems[index].id);
                },
              ),
              Text('${cartItems[index].quantity}'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Provider.of<CartViewModel>(context, listen: false)
                      .increaseQuantity(cartItems[index].id);
                },
              ),
            ],
          ),
          trailing:
              Text('\$${cartItems[index].getTotalPrice().toStringAsFixed(2)}'),
          onTap: () {
            // You can implement more interactions here, like removing an item from the cart
          },
        );
      },
    );
  }

  Widget _buildTotalPrice(double totalPrice, VoidCallback clear) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: clear,
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
