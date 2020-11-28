import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/routes.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(Routes.CART);
      },
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              width: 60,
              height: 60,
              child: Icon(
                Icons.shopping_basket,
              ),
            ),
            Container(
              margin: EdgeInsets.all(4),
              height: 20,
              width: 20,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text("${_cartProvider.items.length}"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
