import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_flutter/src/modules/cart/cart_view.dart';

void main() {
  testWidgets('CartView Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: CartView(),
      ),
    );

    // Wait for the widget to initialize and rebuild.
    await tester.pumpAndSettle();

    // Tap on the 'Remove' and 'Add' buttons and verify if the quantity is updated.
    await tester.tap(find.byIcon(Icons.remove).first);
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    // Tap on the 'Clear' button and verify if the cart is cleared.
    await tester.tap(find.text('Clear'));
    await tester.pump();
    expect(find.text('Total: \$0.00'), findsOneWidget);
  });
}
