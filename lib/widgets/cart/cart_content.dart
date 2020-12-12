import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/utils/price_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /**
           *  Preço Total
           */
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "R\$ ${PriceUtils.convertPriceBRL(_cartProvider.totalPrice)}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        /**
           *  Items
           */
        ListView.builder(
          shrinkWrap: true,
          itemCount: _cartProvider.items.length,
          itemBuilder: (_, index) {
            return CartItem(_cartProvider.items[index]);
          },
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
