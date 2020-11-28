import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/utils/price_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "R\$ ${PriceUtils.convertPriceBRL(_cartProvider.totalPrice)}",
                    style: TextStyle(
                      fontSize: 20,
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
          )
        ],
      ),
    );
  }
}
