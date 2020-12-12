import 'package:ecommerce/models/order_model.dart';
import 'package:flutter/cupertino.dart';

import 'cart_provider.dart';

class OrderProvider extends ChangeNotifier {
  OrderProvider() {}

  Future<void> completeOrder(CartProvider cartProvider) async {
    if (cartProvider.user != null && cartProvider.totalPrice > 0.0) {
      try {
        print(cartProvider.totalPrice);
        final newOrder = OrderModel.fromOrder(
            cartProvider.user,
            cartProvider.addressModel,
            cartProvider.totalPrice,
            cartProvider.items.length);

        print(newOrder);
        print(cartProvider.user);
        cartProvider.user.orderReference
            .add(newOrder.toOrderMap())
            .then((doc) => doc.id);
      } catch (e) {
        print(e);
      }
    }
  }
}
