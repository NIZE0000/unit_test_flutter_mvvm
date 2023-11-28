import 'package:flutter/material.dart';
// import 'package:unit_test_flutter/src/layout.dart';
import 'package:unit_test_flutter/src/modules/cart/cart_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Layout(),
      home: CartView(),
    );
  }
}
